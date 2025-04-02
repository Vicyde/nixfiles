{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
     bat
     gh
     git
     kitty
     neovim 
     tree
  ];

}
