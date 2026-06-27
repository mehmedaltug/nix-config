{ config, pkgs, ... }:

{
  imports = [
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/foot.nix
    ./modules/wofi.nix
    ./modules/neovim.nix
  ];
}
