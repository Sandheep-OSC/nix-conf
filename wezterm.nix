{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [ wezterm ];
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
      	".config/wezterm".source = ./dotfiles/.config/wezterm;
      };
    };
  };
}
