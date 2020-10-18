{ linkFarmFromDrvs, callPackage }:

linkFarmFromDrvs "packs" [
	(linkFarmFromDrvs "pack" [
		(callPackage ./default { })
	])
]
