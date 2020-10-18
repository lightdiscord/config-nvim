{ symlinkJoin, lib, callPackage }:

symlinkJoin {
	name = "nvim-config";
	paths = [
		(lib.cleanSource ../config)
		(callPackage ./packs { })
	];
}
