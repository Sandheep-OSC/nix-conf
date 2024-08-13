{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [ alacritty ];
in
{
  imports = [];

  options = {};

  config = {

    programs = {
    };

    home = {
      packages = myPackages ++ (
        with pkgs-unstable; []
      );
      file = {
      	".config/alacritty".source = ./dotfiles/.config/alacritty;
      };
    };
  };
}
