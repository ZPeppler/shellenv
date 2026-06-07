{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
    };
  };
}

