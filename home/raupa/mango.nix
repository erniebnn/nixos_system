{ inputs, ... }:

{
  imports = [
    inputs.mangowm.hmModules.mango
  ];
  
  wayland.windowManager.mango = {
    enable = true;
    settings = builtins.readFile ./mango.toml;
  };
}