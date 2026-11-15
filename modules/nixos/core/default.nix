# Base común para TODOS los hosts
{ pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [ "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";
  services.xserver.xkb.layout = "es";

  users.users.ruben = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "cambiame"; # cámbiala con `passwd` tras el primer arranque
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    htop
  ];

  # Wrapper cómodo para rebuilds con diff (nh os switch)
  programs.nh = {
    enable = true;
    flake = "/home/ruben/nix-config";
  };
}
