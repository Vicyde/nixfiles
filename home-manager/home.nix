{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "auc";
  home.homeDirectory = "/home/auc";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    brave
    emacs
    libreoffice-qt-fresh
    obsidian
    vscode
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  imports = [
    ./modules/kitty.nix
    ./modules/zsh.nix
  ];

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ../configs/starship/starship.toml;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
