{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5a9c737c587d2c34d63c5b3cb53c6ab0705bdf4f.tar.gz") {}
}: pkgs.callPackage ./vinegar.nix {
	wine = pkgs.wineWowPackages.staging.overrideDerivation (oldAttrs: {
		patches = (oldAttrs.patches or []) ++ [
			(pkgs.fetchpatch {
				url = "https://raw.githubusercontent.com/flathub/io.github.vinegarhq.Vinegar/4f2d744c80477e54426299aa171c1f0ea8282d27/patches/wine/segregrevert.patch";
				hash = "sha256-GTOBKnvk3JUuoykvQlOYDLt/ohCeqJfugnQnn7ay5+w=";
			})
		];
	});
}