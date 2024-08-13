{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [ lunarvim ];
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
      	".config/lvim".source = ./dotfiles/.config/lvim;
      };
    };
  };
}
