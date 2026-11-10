{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d20e7bd5-987f-4d42-bf70-ad8ec4dc4515";
    fsType = "btrfs";
    options = [ "subvol=@nixos" ];
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/d20e7bd5-987f-4d42-bf70-ad8ec4dc4515";
    fsType = "btrfs";
    options = [ "subvol=@swap" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/28FE-954B";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [
    { device = "/swap/swapfile"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
