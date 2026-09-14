{ pkgs }:

{
  nixfmt = {
    enable = true;
    args = [ "--check" ];
  };

  deadnix.enable = true;

  statix = {
    enable = true;
    # The built-in hook checks the whole tree when a Nix file changes.
    settings.ignore = [ "hardware/asus-rog-strix-g614ji/hardware-configuration.nix" ];
  };

  just = {
    enable = true;
    name = "Justfile formatting";
    package = pkgs.just;
    entry = "${pkgs.just}/bin/just --fmt --check";
    files = "^Justfile$";
    pass_filenames = false;
  };

  actionlint.enable = true;

  gitleaks = {
    enable = true;
    name = "Gitleaks staged changes";
    package = pkgs.gitleaks;
    extraPackages = [ pkgs.git ];
    # The commit hook scans the index; just lint-secrets still scans history.
    entry = "${pkgs.gitleaks}/bin/gitleaks git --staged --redact --no-banner";
    pass_filenames = false;
    always_run = true;
  };
}
