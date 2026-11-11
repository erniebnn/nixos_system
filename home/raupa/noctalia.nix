{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
  };

  xdg.configFile."noctalia" = {
    source = ./noctalia;
    target = ".";
  };

  home.file = {
    "Wallpapers".source = ./wallpapers;
  };
}
