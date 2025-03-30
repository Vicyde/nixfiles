{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
     bat
     brave
     emacs
     gh
     git
     kitty
     libreoffice-qt-fresh
     neovim 
     obsidian
     tree
     vscode
  ];

}
