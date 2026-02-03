{
  description = "weebsite";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pnpm2nix.url = "github:wrvsrx/pnpm2nix-nzbr/adapt-to-v9";
    pnpm2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { pnpm2nix, ... }:
  let
    system = "x86_64-linux";
  in {
    packages.${system}.default = pnpm2nix.packages.${system}.mkPnpmPackage {
      name = "pastel";
      src = ./.;
      installInPlace = true;
    };
  };
}
