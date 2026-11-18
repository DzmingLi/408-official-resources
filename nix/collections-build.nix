{ fromYear ? 2009, throughYear ? 2026, currentSyllabusOnly ? false }:
let
  flake = builtins.getFlake ("git+file://" + toString ../.);
in flake.lib.${builtins.currentSystem}.mkCollections {
  inherit fromYear throughYear currentSyllabusOnly;
}
