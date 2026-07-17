set shell := ["sh", "-eu", "-c"]

default:
    @just --list

# Rebuild NixOS configuration
[group('nix')]
rebuild *args:
    sudo nixos-rebuild switch --flake "$HOME/Dotfiles#laptop" --accept-flake-config {{args}}

# Rebuild macOS configuration
[group('nix')]
rebuild-mac *args:
    sudo darwin-rebuild switch --flake "$HOME/Dotfiles#macbook" --option accept-flake-config true {{args}}

# Check configuration
[group('nix')]
check:
    nix flake check --accept-flake-config

# Update all the flake inputs
[group('nix')]
update:
  nix flake update --commit-lock-file

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Garbage collect all unused nix store entries
[group('nix')]
gc:
  # garbage collect all unused nix store entries(system-wide)
  sudo nix-collect-garbage --delete-older-than 7d
  # garbage collect all unused nix store entries(for the user - home-manager)
  # https://github.com/NixOS/nix/issues/8508
  nix-collect-garbage --delete-older-than 7d

[group('nix')]
fmt:
    nix fmt
