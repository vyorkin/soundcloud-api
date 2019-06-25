{ mkDerivation, aeson, base, base-unicode-symbols, bytestring
, case-insensitive, co-log, containers, directory, doctest, dotenv
, ekg, ekg-core, eventful-test-helpers, hedgehog, jwt, lens, mtl
, natural-transformation, optparse-applicative, postgresql-simple
, postgresql-simple-migration, random, relude, resource-pool
, servant, servant-server, stdenv, tasty, tasty-discover
, tasty-expected-failure, tasty-hedgehog, text, time
, unordered-containers, warp
}:
mkDerivation {
  pname = "soundcloud-api";
  version = "0.0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base base-unicode-symbols bytestring case-insensitive co-log
    containers ekg ekg-core jwt lens mtl natural-transformation
    optparse-applicative postgresql-simple postgresql-simple-migration
    random relude resource-pool servant servant-server text time
    unordered-containers warp
  ];
  executableHaskellDepends = [
    aeson base base-unicode-symbols bytestring case-insensitive co-log
    containers directory dotenv ekg ekg-core jwt lens mtl
    natural-transformation optparse-applicative postgresql-simple
    postgresql-simple-migration random relude resource-pool servant
    servant-server text time unordered-containers warp
  ];
  testHaskellDepends = [
    aeson base base-unicode-symbols bytestring case-insensitive co-log
    containers doctest ekg ekg-core eventful-test-helpers hedgehog jwt
    lens mtl natural-transformation optparse-applicative
    postgresql-simple postgresql-simple-migration random relude
    resource-pool servant servant-server tasty tasty-expected-failure
    tasty-hedgehog text time unordered-containers warp
  ];
  testToolDepends = [ tasty-discover ];
  doHaddock = false;
  description = "SoundCloud toy clone API";
  license = stdenv.lib.licenses.mit;
}
