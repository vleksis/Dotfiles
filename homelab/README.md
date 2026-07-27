# Homelab

This directory owns the configuration for the homelab deployment. It is a
concrete domain composition, not a collection of reusable NixOS modules.

## Layout

- `inventory/` defines nodes, service metadata, and service placement.
- `nixos/` implements homelab services and their SOPS integration.
- `home-manager/` contains client-side configuration for accessing the homelab.
- `packages/` contains packages used only by homelab services.

Encrypted values remain in `../secrets/homelab.yaml`; `.sops.yaml` controls its
recipients.

## Adding a service

1. Add its metadata to `inventory/catalog.nix`.
2. Place it on a node in `inventory/nodes.nix`.
3. Add a same-named NixOS module under `nixos/services/`.
4. If it needs a secret, declare the SOPS secret in that service module and add
   the encrypted value to `../secrets/homelab.yaml`.

The service dispatcher imports modules by the names listed for each node, so
the inventory name and module filename must match.

## References

- https://github.com/ryan4yin/nix-config/tree/main/secrets
- https://github.com/badele/nix-homelab
- https://github.com/ibizaman/selfhostblocks
