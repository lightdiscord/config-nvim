{ linkFarmFromDrvs, callPackage }:

linkFarmFromDrvs "default" [
  (callPackage ./start { })
]
