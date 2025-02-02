{ config, pkgs, inputs, ... }:


{
  home.stateVersion = "24.11"; 
  home.username = "luxus";
  home.homeDirectory = "/home/luxus";
  programs.zsh = {
    enable = true;
    initExtra = ''
    '';
  };
  imports = [
    ./astronvim.nix
  ];

  home.packages = with pkgs; [
    fzf # fuzzy search in terminal
            gcc
        git
        git-lfs
        gnumake
        cargo
        nix-ld
        wget
	      rustc
        zsh
  ];

  home.file = {};
  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
        enable = true;
        extraConfig = {
          core.editor = "nvim";
          user = {
            email = "luxuspur@gmail.com";
            name = "luxus";
          };
          init = {defaultBranch = "main";};
        };
        aliases = {
          cam = "commit -a -m";
          clo = "config --list --show-origin";
          l = "log --oneline -n10";
        };
      };
}