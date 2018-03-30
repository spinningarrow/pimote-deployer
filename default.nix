let pkgs = import <nixpkgs> {};

in pkgs.stdenv.mkDerivation rec {
  name = "pimote-deployer";

  buildInputs = with pkgs; [
    nodejs-8_x
  ];
}
