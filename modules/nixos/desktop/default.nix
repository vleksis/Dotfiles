_:

{
  imports = [
    ./fonts.nix
    ./hardware.nix
    ./ld.nix
    ./programs.nix
    ./session.nix
    ./sound.nix
  ];

  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
}
