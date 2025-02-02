# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default 
  ];

  wsl = {
    enable = true;
    defaultUser = "luxus";
    startMenuLaunchers = true;
  };
      programs.nix-ld.enable = true;
      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "luxus" = import ./home.nix;
    };
  };
  system.stateVersion = "24.11";
}