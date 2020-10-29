{ linkFarmFromDrvs, callPackage }:

linkFarmFromDrvs "42" [
  (callPackage ./start { })
]
