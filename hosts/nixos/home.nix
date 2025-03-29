{ config, pkgs, ... }:

{
  home.username = "auc";
  home.homeDirectory = "/home/auc";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "SpaceMono Nerd Font";
      size = 14;
    };
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ../../configs/starship/starship.toml;
  };

  programs.zsh = {
  	enable = true;
	shellAliases = {
		ll = "ls -l";
		grep = "grep --color=auto";
	};
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
