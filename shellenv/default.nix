{ pkgs, lib, ... }:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
    };
  };
}

