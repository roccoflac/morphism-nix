{ pkgs, ... }:

{
  users.users.rocco = {
    isNormalUser = true;
    description = "rocco";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };
}
