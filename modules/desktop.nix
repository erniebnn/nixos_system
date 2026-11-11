{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
  };
}
