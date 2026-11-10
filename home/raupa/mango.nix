{ ... }:

{
  wayland.windowManager.mango = {
    enable = true;
    extraConfig = builtins.readFile ./mango.toml;
  };
}