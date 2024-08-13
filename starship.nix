{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  myPackages = with pkgs; [];
in
{
  imports = [];

  options = {};

  config = {

    programs = {
      starship = {
	    enable = true;
	    # Configuration written to ~/.config/starship.toml
	    settings = {};
	  };
    };

    home = {
      packages = myPackages ++ (
        with pkgs-unstable; []
      );
      file = {
      	".config/starship.toml".source = ./starship.toml;
      };
    };
  };
}
