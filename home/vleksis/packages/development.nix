{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    pyright
    ruff
    black
    isort
    uv

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
