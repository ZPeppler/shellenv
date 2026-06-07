{ pkgs, lib, ... }:

{
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
    };
  };
}

