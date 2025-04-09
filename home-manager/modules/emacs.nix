{pkgs, ...}:
{
  services.emacs = {
    enable = true;
    package = with pkgs; (
        (emacsPackagesFor pkgs.emacs).emacsWithPackages (
            epkgs: [
                epkgs.dashboard
                epkgs.evil
                epkgs.general
                epkgs.ivy
                epkgs.magit
                epkgs.which-key
                epkgs.doom-themes
            ]
        )
    );
  };

  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
        epkgs.dashboard
        epkgs.evil
        epkgs.general
        epkgs.ivy
        epkgs.magit
        epkgs.which-key
        epkgs.doom-themes
    ];

    extraConfig = ''
        (dashboard-setup-startup-hook)

        (evil-mode)

        (which-key-mode 1)

        (setq doom-themes-enable-bold t
              doom-themes-enable-italic t)
        (load-theme 'doom-one t)

        (setq inhibit-startup-screen t)

        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)

        (global-display-line-numbers-mode 1)
        (setq display-line-numbers-type 'relative)

        (global-visual-line-mode t)    

        (set-face-attribute 'default nil
            :font "SpaceMono Nerd Font"
            :height 150
            :weight 'normal) 
    '';
  };
}
