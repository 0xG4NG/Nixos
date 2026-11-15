# Home-manager compartido entre todas tus máquinas
{ pkgs, ... }:
{
  home.username = "ruben";
  home.homeDirectory = "/home/ruben";

  programs.git = {
    enable = true;
    settings.user.name = "0xG4NG";
    settings.user.email = "0xG4NG@ruben@g4ng.es";
  };
  
  programs.gh.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.starship.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    btop
  ];

  home.stateVersion = "26.05";
}
