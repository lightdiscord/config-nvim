# config-nvim-pack-default

The lock is currently manually generated.
Maybe we could abuse nix flake for that, but because nix flake allows only attrset (and no thunk) for inputs and because we need to specify `flake = false`, we can't use function to automatically add this attribute.

## Guides

### Generate a lock file

To generate a lock file we can run `nix-prefetch-github` on each entry of a `entries.txt` file and merge all the json object into a file that we can format using `jq`.
