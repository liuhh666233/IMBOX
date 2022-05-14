{
  description = "Python library for reading IMAP mailboxes and converting email content to machine readable data.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/21.11";

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.flake-utils.lib.eachSystem [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "x86_64-darwin"
    ] (system:       let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in{
        # Some of the python tools are developed and packaged with poetry.
        defaultPackage =  pkgs.python3Packages.callPackage  ./. { };
      });
}
