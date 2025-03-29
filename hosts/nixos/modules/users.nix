{
  users.users.auc = {
    isNormalUser = true;
    description = "Jasper Reuhman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };
}
