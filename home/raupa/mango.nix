{ inputs, ... }:

{
  imports = [
    inputs.mangowm.hmModules.mango
  ];
  
  wayland.windowManager.mango = {
    enable = true;
  };

  xdg.configFile."mango/config.toml".source = ./mango/config.toml;
  xdg.configFile."mango/keybinds.toml".source = ./mango/keybinds.toml;
}
