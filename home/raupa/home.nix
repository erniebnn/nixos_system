{ pkgs, ... }:

{
  imports = [
    ./noctalia.nix
    ./niri.nix
  ];

  xdg.enable = true;

  home.packages = with pkgs; [
    fastfetch
    btop
  ];

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

  programs.firefox.enable = true;
  programs.vscode.enable = true;

  programs.fastfetch = {
    enable = true;
    settings.logo.source = "nixos2";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
  };

  home.stateVersion = "26.05";
}