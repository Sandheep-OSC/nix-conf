{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [ ];
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
      	".config/neovim".source = ./dotfiles/.config/neovim;
      };
    };
  };
}
