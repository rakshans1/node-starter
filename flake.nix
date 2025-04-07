{
  description = "Node Starter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        inherit (pkgs) inotify-tools terminal-notifier;
        inherit (pkgs.lib) optionals;
        inherit (pkgs.stdenv) isDarwin isLinux;

        linuxDeps = optionals isLinux [ inotify-tools ];
        darwinDeps = optionals isDarwin [ terminal-notifier ]
          ++ (with pkgs.darwin.apple_sdk.frameworks; optionals isDarwin [
          CoreFoundation
          CoreServices
        ]);

        nodejs = pkgs.nodejs_22;
        yarn = pkgs.yarn.override { nodejs = nodejs; };

      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs;  [
               nodejs yarn
            ] ++ linuxDeps ++ darwinDeps;
            shellHook = ''
              export PATH=bin:$PATH
            '';
          };
        };
      });
}
