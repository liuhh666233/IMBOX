{ lib, buildPythonPackage, fetchFromGitHub, setuptools, chardet }:

buildPythonPackage rec {
  pname = "imbox";
  version = "0.9.6";

  # pypi source doesn't contain tests
  src = fetchFromGitHub {
    owner = "liuhh666233";
    repo = "imbox-origin";
    rev = "2cae854dbd77e503d294fce7d5bcdb27e48719b5";
    sha256 = "sha256-4JTV95kOe/mQEHANvtDu0RwlqnB/mg0yqdJx5HHcAjI=";
  };

  # patches = [
  #   ./patches/Support-to-connect-163-mail-server.patch
  #   ./patches/Support-to-parse-chinese-attachment-file-name.patch
  # ];

  propagatedBuildInputs = [ chardet ];

  doCheck = false;

  meta = with lib; {
    description =
      "Python library for reading IMAP mailboxes and converting email content to machine readable data";
    homepage = "https://github.com/martinrusev/imbox";
    license = licenses.mit;
    maintainers = [ ];
  };
}
