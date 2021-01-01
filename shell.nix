{ pkgs ? import <nixpkgs> {} }:
with pkgs;
  let
    workingPackage = callPackage ./default.nix {};
    withSymbols = enableDebugging workingPackage;
  in
    mkShell {
      nativeBuildInputs = [
        withSymbols
        gdb
        which
        dbus # Should be a dependency of the package itself, but that doesn't seem to happen
      ];
    }
