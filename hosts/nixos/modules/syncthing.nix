{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "auc";
    configDir = "/home/auc/.config/syncthing";
    settings = {
      devices = {
        "server" = { id="PELHXME-DYXXES7-POQ7PDX-CDPEPKJ-JZVOKXM-EQG6EAE-FRCCDTT-LTSZUAF"; };
      };
      folders = {
        "Obsidian" = {
          id="7o5gq-esu9c";
          path = "/home/auc/Obsidian";
          devices = [ "server" ];
          ignorePerms = true;
        };

        "RoamNotes" = {
          id="rsdw4-icijz";
          path = "/home/auc/RoamNotes";
          devices = [ "server" ];
          ignorePerms = true;
        };
      };
    };
  }; 
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";    
}