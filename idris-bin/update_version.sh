#!/bin/bash
set -e -v

VERSION=$1

git clean -fxd
sed -i "s/^pkgver=.*/pkgver="$VERSION"/" PKGBUILD
updpkgsums
makepkg -s
mkaurball -f
namcap *.pkg.tar.xz
aurploader
