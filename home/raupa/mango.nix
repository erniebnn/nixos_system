{ inputs, ... }:

{
  imports = [
    inputs.mangowm.hmModules.mango
  ];
  
  wayland.windowManager.mango = {
    enable = true;
    extraConfig = builtins.readFile ./mango.toml;
  };
}