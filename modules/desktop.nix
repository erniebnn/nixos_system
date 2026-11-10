{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  programs.mango.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.noctalia-greeter}/bin/noctalia-greeter --cmd mango";
        user = "greeter";
      };
    };
  };
}