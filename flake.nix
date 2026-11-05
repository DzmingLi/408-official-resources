{
  description = "Official postgraduate 408 papers, typeset with Typix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-fonts = {
      url = "github:DzmingLi/nur-packages";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, typix, nur-fonts }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      buildFor = system:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          lib = pkgs.lib;
          typixLib = typix.mkLib pkgs;
          founderFonts = pkgs.callPackage (nur-fonts + "/pkgs/fangzheng-fonts") { };
          fallbackFont = pkgs.tex-gyre-math.termes;
          mathFonts = pkgs.runCommand "mps-math-font" {
            nativeBuildInputs = [ (pkgs.python3.withPackages (p: [ p.fonttools ])) ];
          } ''
            python3 ${./scripts/build-mps-math.py} \
              --source-dir ${founderFonts}/share/fonts/truetype \
              --fallback ${fallbackFont}/share/fonts/opentype/texgyretermes-math.otf \
              --output "$out/share/fonts/opentype/FZSTS_MPS-Math.otf"
          '';
          fontPaths = [
            "${founderFonts}/share/fonts/truetype"
            "${fallbackFont}/share/fonts/opentype"
            "${mathFonts}/share/fonts/opentype"
            "${pkgs.dejavu_fonts}/share/fonts/truetype"
          ];
          typstPackages = import ./typst-packages.nix;
          pdfPython = pkgs.python3.withPackages (p: [ p.pypdf ]);
          src = builtins.path {
            path = ./.;
            name = "kaoyan-408-sources";
            filter = path: type:
              let
                relative = lib.removePrefix (toString ./. + "/") (toString path);
                parts = lib.splitString "/" relative;
                allowedRoots = [ "历年真题+参考解答" "旧版题型示例" "真题分类汇编" "考试大纲" "scripts" "assets" "template.typ" ];
                allowed = lib.elem (lib.head parts) allowedRoots || builtins.match "20[0-9][0-9]" (lib.head parts) != null;
                excluded = lib.any (part: lib.elem part [ "backups" ".build" ".git" "output" ]) parts;
              in
              !excluded && allowed &&
              (type == "directory" || lib.any (ext: lib.hasSuffix ext relative) [ ".typ" ".py" ".org" ".svg" ".png" ".jpg" ".jpeg" ".json" ".toml" ]);
          };
          paperRoot = "历年真题+参考解答";
          paperDirectories = builtins.readDir (./. + "/${paperRoot}");
          years = lib.filter (year:
            paperDirectories.${year} == "directory" && builtins.match "20[0-9][0-9]" year != null
          ) (builtins.attrNames paperDirectories);
          documents = lib.concatMap (year:
            let directory = "${paperRoot}/${year}";
            in [ { name = year; source = "${directory}/${year}.typ"; cover = true; } ]
              ++ lib.optional (builtins.pathExists (./. + "/${directory}/${year}-答案.typ"))
                { name = "${year}-answers"; source = "${directory}/${year}-答案.typ"; cover = false; }
          ) years ++ [ { name = "old-sample"; source = "旧版题型示例/题型示例.typ"; cover = true; } ];
          paperSrc = document: builtins.path {
            path = ./.;
            name = "408-${document.name}-sources";
            filter = path: type:
              let
                relative = lib.removePrefix (toString ./. + "/") (toString path);
                directory = builtins.dirOf document.source;
                inPaper = lib.hasPrefix "${directory}/" relative;
                sharedAsset = lib.hasPrefix "assets/" relative;
                image = lib.any (ext: lib.hasSuffix ext relative) [ ".svg" ".png" ".jpg" ".jpeg" ];
              in
              if type == "directory" then
                lib.hasPrefix "${relative}/" document.source
                || lib.hasPrefix "${directory}/" relative
                || relative == "assets" || sharedAsset
              else relative == "template.typ" || relative == document.source
                || (image && (inPaper || sharedAsset));
          };
          mkPaper = document: typixLib.mkTypstDerivation {
            name = "408-${document.name}";
            src = paperSrc document;
            inherit fontPaths;
            emojiFont = null;
            unstable_typstPackages = typstPackages;
            buildPhaseTypstCommand = ''
              mkdir -p "$out"
              typst compile --ignore-system-fonts --root . ${lib.escapeShellArg document.source} "$out/${document.name}.pdf"
            '';
            installPhaseCommand = "true";
          };
          readingPackages = lib.listToAttrs (map (document:
            lib.nameValuePair document.name (mkPaper document)
          ) documents);
          printPackages = lib.listToAttrs (map (document:
            lib.nameValuePair "${document.name}-print" (pkgs.runCommand "408-${document.name}-print" {
              nativeBuildInputs = [ pdfPython ];
            } ''
              mkdir -p "$out"
              python3 ${./scripts/booklet.py} \
                "${readingPackages.${document.name}}/${document.name}.pdf" \
                "$out/${document.name}-print.pdf" \
                ${lib.optionalString document.cover "--cover-back-blank --back-cover-blank"}
            '')
          ) documents);
          past-exams = pkgs.symlinkJoin {
            name = "408-past-exams";
            paths = builtins.attrValues readingPackages;
          };
          print-version = pkgs.symlinkJoin {
            name = "408-print-version";
            paths = builtins.attrValues printPackages;
          };
          collections = typixLib.mkTypstDerivation {
            name = "408-topic-collections";
            inherit src fontPaths;
            emojiFont = null;
            unstable_typstPackages = typstPackages;
            nativeBuildInputs = [ pdfPython ];
            buildPhaseTypstCommand = ''
              python3 scripts/build-collections.py --output "$out"
            '';
            installPhaseCommand = "true";
          };
        in {
          packages = readingPackages // printPackages // {
            default = past-exams;
            inherit past-exams print-version collections;
            fonts = founderFonts;
            math-fonts = mathFonts;
          };
          checks = { inherit past-exams print-version collections; };
          devShell = typixLib.devShell {
            inherit fontPaths;
            emojiFont = null;
            TYPST_PACKAGE_CACHE_PATH = typixLib.fetchTypstPackages typstPackages;
            packages = [ pdfPython pkgs.gh ];
          };
        };
    in {
      packages = forAllSystems (system: (buildFor system).packages);
      checks = forAllSystems (system: (buildFor system).checks);
      devShells = forAllSystems (system: { default = (buildFor system).devShell; });
    };
}
