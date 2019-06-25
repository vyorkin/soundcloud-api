let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          project = haskellPackagesNew.callPackage ./project.nix { };
          dotenv = haskellPackagesNew.callPackage ./nix/dotenv-0.8.0.0.nix { };
          co-log = haskellPackagesNew.callPackage ./nix/co-log-0.2.0.nix { };
          typerep-map = haskellPackagesNew.callPackage ./nix/typerep-map-0.3.2.nix { };
        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };

in
  { project = pkgs.haskellPackages.project;
  }
