inputs:

let
  laptop = import ./systems/laptop.nix inputs;
  macbook = import ./systems/macbook.nix inputs;
in
{
  formatter = {
    x86_64-linux = laptop.formatter;
    aarch64-darwin = macbook.formatter;
  };

  inherit (laptop) nixosConfigurations;
  inherit (macbook) darwinConfigurations;
}
