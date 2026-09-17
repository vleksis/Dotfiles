# Homelab

This directory owns the configuration for the homelab deployment. It is a
concrete domain composition, not a collection of reusable NixOS modules.

## Layout

- `inventory/` defines nodes, service metadata, and service placement.
- `clients/` configures machines and user environments that access the homelab.
- `nixos/` implements common host infrastructure, homelab services, and their
  SOPS integration.
- `packages/` contains packages used only by homelab services.

Encrypted values live in two files, with recipients controlled by `.sops.yaml`:

- `../secrets/homelab.yaml` holds private backend secrets, such as VPN keys and
  admin credentials. Daru cannot decrypt this file.
- `../secrets/homepage.yaml` holds the six widget API keys shared with Homepage.
  Both Daru and Okabe can decrypt it; Prowlarr, Radarr, and Sonarr also consume
  their keys from this file. Existing recovery access is preserved for both files.

## Adding a service

1. Add its metadata to `inventory/catalog.nix`.
2. Place it on a node in `inventory/nodes.nix`.
3. Add a same-named NixOS module under `nixos/services/`.
4. If it needs a secret, declare the SOPS secret in that service module and add
   the encrypted value.

The service dispatcher imports modules by the names listed for each node, so
the inventory name and module filename must match.

Infrastructure required on every node, such as SSH, is imported directly by
`nixos/default.nix` and configured from node metadata instead of the singleton
service catalog.

## References

- https://github.com/ryan4yin/nix-config/tree/main/secrets
- https://github.com/badele/nix-homelab
- https://github.com/ibizaman/selfhostblocks
