set shell := ["sh", "-eu", "-c"]
set default-list

###################
#    VARIABLES    #
###################

root := justfile_directory()

###################
#       NIX       #
###################

[doc("Rebuild the current macOS configuration")]
[group('macos')]
[group('nix')]
[macos]
rebuild *args:
    sudo darwin-rebuild switch --flake "{{ root }}#${NIX_HOST:?NIX_HOST is not set}" {{ args }}

[doc("Rebuild the current NixOS configuration")]
[group('linux')]
[group('nix')]
[linux]
rebuild *args:
    sudo nixos-rebuild switch --flake "{{ root }}#${NIX_HOST:?NIX_HOST is not set}" {{ args }}

[doc("Build and deploy the homelab configuration remotely")]
[group('macos')]
[group('nix')]
[macos]
deploy-homelab *args:
    nix run --inputs-from "{{ root }}" nixpkgs#nixos-rebuild -- switch --flake "{{ root }}#okabe" --target-host "okabe" --build-host "okabe" --elevate=sudo {{ args }}

[doc("Update all flake inputs")]
[group('nix')]
update:
    nix flake update --commit-lock-file

[doc("List system profile generations")]
[group('nix')]
history:
    nix profile history --profile /nix/var/nix/profiles/system

[doc("Garbage collect Nix store entries older than seven days")]
[group('nix')]
gc:
    sudo nix-collect-garbage --delete-older-than 7d
    # Also collect the user profile: https://github.com/NixOS/nix/issues/8508
    nix-collect-garbage --delete-older-than 7d

###################
#       CI        #
###################

[doc("Format repository files")]
[group('ci')]
fmt:
    nix fmt
    just --fmt

[doc("Lint repository files")]
[group('ci')]
lint: lint-just lint-actions lint-secrets lint-nix

[doc("Check Justfile formatting")]
[group('ci')]
lint-just:
    just --fmt --check

[doc("Lint GitHub Actions workflows")]
[group('ci')]
lint-actions:
    actionlint

[doc("Scan Git history for secrets")]
[group('ci')]
lint-secrets:
    gitleaks git --redact --no-banner --verbose .

[doc("Lint Nix files")]
[group('ci')]
lint-nix:
    nix fmt -- --ci
    statix check . --ignore 'hardware/asus-rog-strix-g614ji/hardware-configuration.nix'
    deadnix --fail .

[doc("Check the flake configuration")]
[group('ci')]
check-config:
    nix flake check --all-systems --keep-going

###################
#      MACOS      #
###################

[doc("Reset Launchpad to reindex applications")]
[group('macos')]
[macos]
reset-launchpad:
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
