{ inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  xdg.configFile."niri" = {
    source = ./niri;
    target = ".";
  };
}