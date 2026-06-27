{ config, pkgs, ... }:

{
  environment.etc."xdg/foot/foot.ini" = {
    text = ''
font=0xProto Nerd Font:size=12
    '';
    mode = "0644";
  };
}
