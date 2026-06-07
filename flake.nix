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
      packages.${system}.default =
        let
          user = builtins.getEnv "USER";
          home = builtins.getEnv "HOME";
        in
        (home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            username = user;
            homeDirectory = home;
            stateVersion = "26.05";
          };

          modules = [ ./shellenv/ ];
         }).activationPackage;
    };
}

