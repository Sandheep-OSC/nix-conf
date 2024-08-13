{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  # Define custom variables
  customVariableTest = config.customVariableTest or "test";

  # Define packages based on custom variables
  myPackages = with pkgs; [
    fzf git
  ] ++ (if customVariableTest == "test" then [ pkgs.brave ] else []);
in
{
  imports = [];

  options = {
    # Define my custom variables
    customVariableTest = lib.mkOption {
      type = lib.types.str;
      default = "test";
    };
  };

  config = {
    customVariableTest = "";  # or use config.customVariableTest to provide default value

    programs = {
      bash = {
        # enable = if customProp == "enableBash" then true else false;
	enable = false;
      };
      zsh = {
        enable = false;
      };
      fish = {
        enable = true;
      };
    };

    home = {
      packages = myPackages ++ (
        with pkgs-unstable; [
          neovim
        ]
      );
    };
  };
}
