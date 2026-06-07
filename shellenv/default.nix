{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
    };
  };
}

