import <nixpkgs/nixos/tests/make-test.nix> {
	machine = { config, pkgs, ... }: {
		environment.systemPackages = with pkgs; [
			(callPackage ../../default.nix {})
		];
	};

	testScript = ''
		$machine->waitForUnit("multi-user.target");
	'';
}
