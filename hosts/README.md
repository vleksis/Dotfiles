# Hardware hosts

This directory defines physical machine profiles.

Directory names identify the underlying hardware and remain stable even when the machine's deployed role or hostname changes.

## Naming

- Use lowercase, kebab-case hardware names.
- Prefer the product family and model identifier when available.
- Keep bootloader, disk, GPU, platform, and other machine-specific configuration here.

## Current hardware

| Directory               | Physical machine          | Outputs           |
| ----------------------- | ------------------------- | ----------------- |
| `macbook-air-m4`        | Apple MacBook Air with M4 | `eren`            |
| `asus-rog-strix-g614ji` | ASUS ROG Strix G614JI     | `mikasa`, `okabe` |

Multiple outputs may share the same hardware profile, but they are not intended to be deployed simultaneously.
