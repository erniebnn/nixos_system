{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = builtins.readFile ./arch_grub.cfg;
    };
  };
  
  networking.hostName = "erwins-laptop";

  users.users.raupa = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [ ];

  programs = {
    bash.enable = true;
  };

  system.stateVersion = "26.05";
}

