{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home-manager.users.raupa = {
    programs.noctalia = {
      enable = true;
    };
  };
}
