{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [ kitty ];
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
      	".config/kitty".source = ./dotfiles/.config/kitty;
      };
    };
  };
}
