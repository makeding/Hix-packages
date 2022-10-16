{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, ...
} @ args:

stdenv.mkDerivation rec {
  pname = "mp4fpsmod";
  version = "0.27";
  src = fetchFromGitHub ({
    owner = "nu774";
    repo = "mp4fpsmod";
    rev = "v${version}";
    sha256 = "sha256-87gcike8zIRkkXRBC5bUIZtgsbVyghPqV3Ni87EaK2s";
  });

  nativeBuildInputs = [
    autoreconfHook
  ];
  enableParallelBuilding = true;

  preConfigure = ''
  ./bootstrap.sh
  '';
}