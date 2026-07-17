{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    pyright
    ruff
    black
    isort
    uv

    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    cargo-watch
    cargo-edit
    cargo-nextest

    go
    gopls
    gotools
    gofumpt
    golangci-lint
    delve

    gcc
    clang-tools
    cmake
    gnumake
    pkg-config
    openssl

    nixd
    nil
    nixfmt
    statix
    deadnix

    bash-language-server
    shfmt
    fish-lsp

    vim-language-server

    taplo
    yaml-language-server
    yamlfmt
    yamllint
    vscode-langservers-extracted
    marksman

    dockerfile-language-server
    docker-compose-language-service
    hadolint

    sqls
    sqlfluff

    actionlint

    typescript-language-server
    prettier
    biome

    lua-language-server
    stylua
  ];
}
