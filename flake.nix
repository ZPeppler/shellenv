{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeModules.default = { pkgs, ... }: {
        imports = [ ./shellenv ];
        home.username = builtins.getEnv "USER";
        home.homeDirectory = builtins.getEnv "HOME";
        home.stateVersion = "26.05";
      };
    };
}

