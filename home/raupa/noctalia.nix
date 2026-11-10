{ inputs, ... }:

{
  home-manager.users.raupa = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
    };
  };
}