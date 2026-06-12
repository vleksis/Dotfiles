{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    btop
    fastfetch
    wl-clipboard
    cliphist
    tree
    jq

    zip
    unzip
    p7zip
    unrar

    kitty
    alacritty

    mcfly

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
    shellcheck
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
    gh

    typescript-language-server
    prettier
    biome

    lua-language-server
    stylua

    telegram-desktop

    awww
    swayidle
    grim
    slurp
    swappy
    wf-recorder

    brightnessctl
    playerctl
    pamixer
    pavucontrol
    pwvucontrol

    zed-editor

    nautilus
    file-roller
    loupe
    mpv

    fuzzel
    xwayland-satellite

    papirus-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
    capitaine-cursors
    shared-mime-info
    desktop-file-utils
  ];
}
