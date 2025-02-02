{
    description = "Nixos config flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }@inputs: {
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";        
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
	        nixos-wsl.nixosModules.wsl
        ];
      };

  };

  };
}
