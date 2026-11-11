{ inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl
}