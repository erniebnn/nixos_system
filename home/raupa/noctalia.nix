{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
  };

  xdg.configFile."noctalia/config.toml".source = ./noctalia.toml;
}
