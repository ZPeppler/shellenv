{ pkgs, lib, ... }:

let
  user = builtins.getEnv "USER";
  homeDir = builtins.getEnv "HOME";
in
{
  home.username = user;
  home.homeDirectory = homeDir;
  home.stateVersion = "26.05";

  import = [ ./default.nix ];
}

