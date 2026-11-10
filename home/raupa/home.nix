{ pkgs, ... }:

{
  imports = [
    ./noctalia.nix
    ./mango.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    btop
    firefox
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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
  };

  home.stateVersion = "26.05";
}