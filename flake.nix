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
                allowedRoots = [ "历年真题+参考解答" "题型示例" "分类汇编" "考试大纲" "scripts" "template.typ" ];
                allowed = lib.elem (lib.head parts) allowedRoots || builtins.match "20[0-9][0-9]" (lib.head parts) != null;
                excluded = lib.any (part: lib.elem part [ "backups" ".build" ".git" "output" ]) parts;
              in
              !excluded && allowed &&
              (type == "directory" || lib.any (ext: lib.hasSuffix ext relative) [ ".typ" ".py" ".org" ".svg" ".png" ".jpg" ".jpeg" ".json" ".toml" ]);
          };
          pdfs = typixLib.mkTypstDerivation {
            name = "kaoyan-408-official-pdfs";
            inherit src fontPaths;
            emojiFont = null;
            unstable_typstPackages = typstPackages;
            nativeBuildInputs = [ pdfPython ];
            buildPhaseTypstCommand = ''
              python3 scripts/test-booklet.py
              python3 scripts/build-pdfs.py --output "$out" --jobs 4
              python3 scripts/publish-release.py --directory "$out" --check-only
            '';
            installPhaseCommand = "true";
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
          packages = { default = pdfs; inherit pdfs collections; fonts = founderFonts; math-fonts = mathFonts; };
          checks = { inherit pdfs collections; };
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
