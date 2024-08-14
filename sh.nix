# { config, lib, customProp, pkgs, pkgs-unstable, ... }:
#
# let
#   # Define custom variables
#   customVariableTest = config.customVariableTest or "test";
#
#    commonConfig = ''
#     if [ -f ~/.config/bash_scripts/main.sh ]; then
#       source ~/.config/bash_scripts/main.sh
#     else
#       echo "404: ~/.config/bash_scripts/main.sh not found"
#     fi
#   '';
#
#
#
#   shellAliases = ''
# 	export NEOVIM_PROFILE_PATH="neovim"
# 	alias nvim-jdhao="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/jdhao/ nvim"
# 	alias nvim-xero="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/xero/ nvim"
# 	alias nvim-astro="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/astrovim/ nvim"
# 	alias nvim-josean="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/josean/ nvim"
# 	alias nvim-ecosse3="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/ecosse3/ nvim"
# 	alias nvim-rafi="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/rafi/ nvim"
# 	alias nvim-sf="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep-first/ nvim"
# 	alias nvim-s="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep/ nvim"
# 	alias lz="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/lazyvim/ nvim"
#   ''
#
#   # Define packages based on custom variables
#   myPackages = with pkgs; [
#     fzf git
#   ] ++ (if customVariableTest == "test" then [ pkgs.brave ] else []);
# in
# {
#   imports = [];
#
#   options = {
#     # Define my custom variables
#     customVariableTest = lib.mkOption {
#       type = lib.types.str;
#       default = "test";
#     };
#   };
#
#   config = {
#     customVariableTest = "";  # or use config.customVariableTest to provide default value
#
#     programs = {
#       bash = {
#         # enable = if customProp == "enableBash" then true else false;
# 	enable = true;
# 	# extraConfig = commonConfig;
#       };
#       zsh = {
#         enable = true;
# 	initExtraFirst = commonConfig;
#       };
#       fish = {
#         enable = true;
# 	interactiveShellInit = ''
# 	      if test -f ~/.config/bash_scripts/main.sh
# 		source ~/.config/bash_scripts/main.sh
# 	      else
# 		echo "404: ~/.config/bash_scripts/main.sh not found"
# 	      end
# 	    '';
#       };
#     };
#
#     home = {
#       packages = myPackages ++ (
#         with pkgs-unstable; [
#           neovim
#         ]
#       );
#     };
#   };
# }

{ config, lib, customProp, pkgs, pkgs-unstable, ... }:

let
  # Define custom variables
  customVariableTest = config.customVariableTest or "test";

  commonConfig = ''
    if [ -f ~/.config/bash_scripts/main.sh ]; then
      source ~/.config/bash_scripts/main.sh
    else
      echo "404: ~/.config/bash_scripts/main.sh not found"
    fi
  '';

  shellAliases = ''
    export NEOVIM_PROFILE_PATH="neovim"
    alias nvim-jdhao="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/jdhao/ nvim"
    alias nvim-xero="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/xero/ nvim"
    alias nvim-astro="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/astrovim/ nvim"
    alias nvim-josean="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/josean/ nvim"
    alias nvim-ecosse3="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/ecosse3/ nvim"
    alias nvim-rafi="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/rafi/ nvim"
    alias nvim-sf="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep-first/ nvim"
    alias nvim-s="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep/ nvim"
    alias lz="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/lazyvim/ nvim"
  '';

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
        enable = true;
        # extraConfig = ''
        #   ${shellAliases}
        # '';
      };
      zsh = {
        enable = true;
        initExtraFirst = ''
          ${shellAliases}
        '';
      };
      fish = {
        enable = true;
        interactiveShellInit = ''
          ${shellAliases}
        '';
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

