{
  description = "weebsite";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pnpm2nix.url = "github:wrvsrx/pnpm2nix-nzbr/adapt-to-v9";
    pnpm2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { pnpm2nix, flake-utils ,... }:
    flake-utils.lib.eachDefaultSystem(system: {
      packages.default = pnpm2nix.packages.${system}.mkPnpmPackage {
        name = "pastel";
        src = ./.;
        installInPlace = true;
      };
    });
}
