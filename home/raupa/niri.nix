{ inputs, ... }:

{
  xdg.configFile."niri" = {
    source = ./niri;
  };
}
