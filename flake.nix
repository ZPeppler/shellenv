{
  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      systems = [ "x86_64-linux" ];
    in
    {
      packages = builtins.listToAttrs (
        map (
          system:
          let
            pkgs = import nixpkgs { inherit system; };
          in
          {
            name = system;
            value = rec {
              shellenv = pkgs.buildEnv {
                name = "shellenv";

                paths = [
                  pkgs.zsh
                ];
              };

              default = shellenv;
            };
          }
        ) systems
      );
    };
}

