function reload --description 'Reload nixos configuration'
    sudo nixos-rebuild switch --flake ~/Dotfiles#laptop --accept-flake-config
end
