{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    btop
  ];

  wayland.windowManager.mango = {
    enable = true;
    extraConfig = lib.readFile ./mango.toml;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Erwin Raupach";
      email = "raupacherwin@gmail.com";
    };
  };

  programs.kitty = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
  };
}