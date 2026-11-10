{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
      menuentry "Arch Linux" --class arch --class gnu-linux --class gnu --class os {
        set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod btrfs
        search --no-floppy --fs-uuid --set=root d20e7bd5-987f-4d42-bf70-ad8ec4dc4515
        linux   /@/boot/vmlinuz-linux root=UUID=d20e7bd5-987f-4d42-bf70-ad8ec4dc4515 rw rootflags=subvol=@ quiet splash loglevel=3 systemd.show_status=no rd.udev.log_level=3 vt.global_cursor_default=0
        initrd  /@/boot/amd-ucode.img /@/boot/initramfs-linux.img
      }
      '';
    };
  };

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "erwins-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "de_DE.UTF-8";
    LC_COLLATE        = "de_DE.UTF-8";
    LC_CTYPE          = "de_DE.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT    = "de_DE.UTF-8";
    LC_MESSAGES       = "en_US.UTF-8";
    LC_MONETARY       = "de_DE.UTF-8";
    LC_NAME           = "de_DE.UTF-8";
    LC_NUMERIC        = "en_US.UTF-8";
    LC_PAPER          = "de_DE.UTF-8";
    LC_TELEPHONE      = "de_DE.UTF-8";
    LC_TIME           = "de_DE.UTF-8";
  };
  
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  services.libinput.enable = true;
  services.pipewire.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;

  users.users.raupa = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    micro
    wget
  ];

  programs = {
    bash.enable = true;
    mangowc.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "26.05";
}

