# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/fonts.nix
      ./modules/locale.nix
      ./modules/packages.nix
      ./modules/users.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
