{ lib, buildPythonPackage, fetchFromGitHub, setuptools, chardet }:

buildPythonPackage rec {
  pname = "imbox";
  version = "0.9.6";

  # pypi source doesn't contain tests
  src = fetchFromGitHub {
    owner = "liuhh666233";
    repo = "imbox-origin";
    rev = "accc60fad86a362b1782a3fe8996e707321ee199";
    sha256 = "sha256-Fxw4VFteY3+XyOJh4Npgxc8wEhah7vpgXyx+vxRukHU=";
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
