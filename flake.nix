{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let 
   lib = nixpkgs.lib;
   pkgs = nixpkgs.legacyPackages."x86_64-linux";
   pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";
   customProp = "disableBash";
  in {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      my-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Import the previous configuratiiiiiion.nix we used,
          # so the old cofiguration file still takes effect
          ./configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      demo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit customProp;
          inherit pkgs-unstable;
        };
      };
    };
  };
}
