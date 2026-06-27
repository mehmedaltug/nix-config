# ************************* #
#                           #
#    BOILERPLATE CONFIG     #
#                           #
# ************************* #

{ pkgs ? import <nixpkgs> {} }:

# Define in-file variables
let
  libraries = with pkgs; [
  #  udev
  #  alsa-lib
  ];

  var_packages = with pkgs; [
  #  cargo
  ];
in
pkgs.mkShell {
    # Install DEV packages
    packages = with pkgs; [
    #    nodejs
    ];
    
    # Install dependencies of the packages
    inputsFrom = with pkgs; [
    #    bat
    ]

    # Define libraries for the target machine
    buildInputs = var_packages;

    # Define libraries that execute on host
    nativeBuildInputs = libraries;

    # Set ENV variables
    #DEV_BUILD = 1;
    #PROGRAM_NAME = "lalala";
}
