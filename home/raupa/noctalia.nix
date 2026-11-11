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
  };

  home.file = {
    "Wallpapers".source = ./wallpapers;
  };
}
