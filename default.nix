{ pkgs ? import <nixpkgs> {}, debug ? false
, stdenv ? pkgs.stdenv }:
with pkgs;
  stdenv.mkDerivation rec {
    version = "2020-12-31";
    pname = "playerctl";

    unpackPhase = ''
      cp -r --target-directory=. -- ${./.}/*
    '';

    nativeBuildInputs = [
      meson ninja pkgconfig gtk-doc docbook_xsl gobject-introspection dbus
    ];

    buildInputs = [ glib dbus ];

    runtimeDependencies = [ dbus ];

    mesonFlags = [ "-Dbash-completions=true" ];

  }
