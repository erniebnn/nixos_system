{ inputs, pkgs, ... }:

{
  imports = [
    inputs.mangowm.nixosModules.mango
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.mango.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
  };

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
