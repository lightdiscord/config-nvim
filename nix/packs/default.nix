{ linkFarmFromDrvs, callPackage }:

linkFarmFromDrvs "packs" [
  (linkFarmFromDrvs "pack" [
    (callPackage ./default { })
    (callPackage ./42 { })
  ])
]
