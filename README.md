# pimote-deployer

Deploys newer versions of the `pimote-*` apps (to be run on the Raspberry Pi).

## Run

    npm i

	env PUBNUB_SUBSCRIBE_KEY=your-subscribe-key \
		PIMOTE_DEPLOYMENT_DIR=path/to/dir \
		npm start

## Develop

This project uses [nix][] and [direnv][] to manage dependencies and the project
environment.

[nix]: https://nixos.org/nix/
[direnv]: https://direnv.net/
