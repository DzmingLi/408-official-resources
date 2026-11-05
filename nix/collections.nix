{ pkgs, lib, typixLib, fontPaths, typstPackages }:
let
  root = ../.;
  catalog = builtins.fromJSON (builtins.readFile (root + "/真题分类汇编/collections.json"));
  rows = lib.concatMap (group: group.rows) catalog;
  mkPackages = { fromYear ? 2009, throughYear ? 2026, paperSize ? "A4", currentSyllabusOnly ? false }:
    assert lib.assertMsg (builtins.isInt fromYear && builtins.isInt throughYear
      && 2009 <= fromYear && fromYear <= throughYear && throughYear <= 2026)
      "collection years must satisfy 2009 <= fromYear <= throughYear <= 2026";
    assert lib.assertMsg (lib.elem paperSize [ "A4" "A5" ]) "paperSize must be A4 or A5";
    assert lib.assertMsg (builtins.isBool currentSyllabusOnly) "currentSyllabusOnly must be a boolean";
    let
      selectedYears = member: lib.filter (year: fromYear <= year && year <= throughYear) member.years;
      hasQuestions = member: selectedYears member != [] && !(currentSyllabusOnly && member.historical);
      selectedRows = lib.filter (row: lib.any hasQuestions row.members) rows;
      mkCollection = row: answers:
        let
          name = row.code + (if answers then "-answers" else "-questions");
          output = if answers then row.answer else row.question;
          years = map toString (lib.unique (lib.concatMap selectedYears (lib.filter hasQuestions row.members)));
          src = builtins.path {
            path = root;
            name = "${name}-sources";
            filter = path: type:
              let
                relative = lib.removePrefix (toString root + "/") (toString path);
                parts = lib.splitString "/" relative;
                top = lib.head parts;
                inPaper = top == "历年真题+参考解答" && builtins.length parts > 1 && lib.elem (builtins.elemAt parts 1) years;
                image = lib.any (ext: lib.hasSuffix ext relative) [ ".svg" ".png" ".jpg" ".jpeg" ];
                templates = [ "template.typ" "真题分类汇编/template.typ" "真题分类汇编/collections.json" ];
              in
              if type == "directory" then
                lib.elem relative [ "历年真题+参考解答" "真题分类汇编" ] || inPaper
                || lib.elem top [ "scripts" "assets" "考试大纲" ]
              else lib.elem relative templates
                || (top == "scripts" && lib.hasSuffix ".py" relative)
                || (top == "考试大纲" && lib.hasSuffix ".org" relative)
                || (top == "assets" && image)
                || (inPaper && (image || lib.hasSuffix (if answers then "-答案.typ" else "/${builtins.elemAt parts 1}.typ") relative));
          };
        in typixLib.mkTypstDerivation {
          name = "408-${name}";
          inherit src fontPaths;
          emojiFont = null;
          unstable_typstPackages = typstPackages;
          nativeBuildInputs = [ pkgs.python3 ];
          buildPhaseTypstCommand = ''
            python3 scripts/extract-collections.py --output generated --collection ${row.code} \
              --from-year ${toString fromYear} --through-year ${toString throughYear} \
              ${lib.optionalString currentSyllabusOnly "--current-syllabus-only"} ${lib.optionalString answers "--answers"}
            mkdir -p "$out/$(dirname ${lib.escapeShellArg output})"
            typst compile --ignore-system-fonts --root . \
              --input collection-size=${paperSize} \
              --input from-year=${toString fromYear} --input through-year=${toString throughYear} \
              generated/entry.typ "$out/${output}"
          '';
          installPhaseCommand = "true";
        };
    in lib.listToAttrs (lib.concatMap (row: [
      (lib.nameValuePair "${row.code}-questions" (mkCollection row false))
      (lib.nameValuePair "${row.code}-answers" (mkCollection row true))
    ]) selectedRows);
  mkCollections = options: pkgs.symlinkJoin {
    name = "408-topic-collections";
    paths = builtins.attrValues (mkPackages options);
  };
  lecturePackages = mkPackages {};
  subjectPackages = lib.listToAttrs (map (group:
    lib.nameValuePair "collections-${group.prefix}" (pkgs.symlinkJoin {
      name = "408-collections-${group.prefix}";
      paths = builtins.attrValues (lib.filterAttrs (name: _: lib.hasPrefix "${group.prefix}-" name) lecturePackages);
    })
  ) catalog);
in {
  inherit mkCollections;
  collections = mkCollections {};
  packages = lecturePackages // subjectPackages;
}
