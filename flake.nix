{
  description = "A plugin for tmux that allows users to select actions from a customizable popup menu";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    lib = (nixpkgs.lib.extend (import ./lib self)) // home-manager.lib;
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
    ];
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {inherit system;});
    forAllSystems = f: lib.genAttrs systems (system: f pkgsFor.${system});
  in {
    packages = forAllSystems (pkgs: {
      tmux-which-key = pkgs.callPackage ./nix/default.nix {
        python = pkgs.python3;
      };
    });

    homeManagerModules.tmux-which-key = import ./home-manager/module.nix;

    defaultPackage = lib.genAttrs systems (system: self.packages.${system}.tmuxPlugins.tmux-which-key);
  };
}
