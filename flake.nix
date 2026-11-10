{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [
        ./profiles/laptop/configuration.nix
        ./modules/base.nix
        ./modules/desktop.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.raupa = import ./home/raupa/home.nix;
        }
      ];
    };
  };
}
