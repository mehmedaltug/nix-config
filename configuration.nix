{ config, pkgs, ... }:



let
  protontricks-wrapper = pkgs.writeShellScriptBin "protontricks-cwd-launch" ''
    if [ -n "$1" ]; then
      cd "$(dirname "$1")"
      exec ${pkgs.gamemode}/bin/gamemoderun ${pkgs.protontricks}/bin/protontricks-launch "$1"
    fi
  '';
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "m-nixos";
  networking.wireless.enable = true;

  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  time.timeZone = "Europe/Istanbul";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "tr";
    variant = "";
  };

  console.keyMap = "trq";

  users.users."mehmed" = {
    isNormalUser = true;
    description = "mehmed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    # Basic utils
    vim wget git firefox google-chrome pcmanfm
    pavucontrol mousepad lazygit curl eom evince
    onlyoffice-desktopeditors unrar xarchiver

    # Programming
    gcc neovim tree-sitter python3 gh lazygit jre

    # wm Packages
    wl-clipboard mako blueman wofi waybar nwg-look
    gnome-themes-extra grim slurp power-profiles-daemon
    lxmenu-data shared-mime-info

    # MISC
    exfat ntfs3g
    (makeDesktopItem {
      name = "protontricks-cwd";
      desktopName = "Protontricks (CWD Fix)";
      comment = "Launch EXE inside its own directory using Protontricks";
      icon = "steam";
      terminal = false;
      categories = [ "Game" "Utility" ];
      mimeTypes = [ 
        "application/x-ms-dos-executable" 
        "application/x-msdownload" 
        "application/x-wine-extension-exe" 
        "application/vnd.microsoft.portable-executable"
      ];
      exec = "${protontricks-wrapper}/bin/protontricks-cwd-launch %f";
    })
  ];
  fonts.packages = with pkgs; [
  nerd-fonts._0xproto
  ];
  programs.steam.enable = true;
  programs.steam.protontricks.enable = true;
  programs.gamemode.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.gnome.gnome-keyring.enable = true;
  services.power-profiles-daemon.enable = true;
  services.blueman.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  fileSystems."/mnt/nvme0n1p3" = {
     device = "/dev/nvme0n1p3";
     fsType = "ntfs";
     options = [
       "defaults"
       "rw"
     ];
  };
  fileSystems."/mnt/nvme0n1p4" = {
     device = "/dev/nvme0n1p4";
     fsType = "exfat";
     options = [
       "defaults"
       "rw"
     ];
  };
  
  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch";
    ncc = "nvim /etc/nixos/";
    nix-cleanup = "sudo nix-collect-garbage -d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}
