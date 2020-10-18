{ fetchFromGitHub, linkFarm }:

let

	sources = builtins.fromJSON (builtins.readFile ./lock.json);

	mapEntry = { repo, ... }@entry: {
		name = repo;
		path = fetchFromGitHub entry;
	};

	entries = map mapEntry sources;

in

linkFarm "start" entries
