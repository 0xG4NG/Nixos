{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    ./disko.nix
    ./hardware.nix # se genera durante la instalación
    ../../modules/nixos/core
  ];

  networking.hostName = "laptop";

  # Arranque UEFI (Secure Boot con lanzaboote se añade más adelante)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Escritorio: cambia a Plasma/Hyprland si prefieres
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Portátil
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.fwupd.enable = true; # actualizaciones de firmware
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.ruben = import ../../home/ruben/laptop.nix;
  };

  # Pon la versión de la ISO con la que instales y NO la cambies después
  system.stateVersion = "26.05";
}
