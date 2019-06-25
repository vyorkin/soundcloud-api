shell:
	nix-shell
build:
	nix-build
run:
	nix-shell --run 'cabal new-exec soundcloud-server'
repl:
	nix-shell --run 'cabal new-repl soundcloud-server'
test:
	nix-shell --run 'cabal new-test soundcloud-test'
clean:
	rm -f .ghc.environment*
	nix-shell --run 'cabal new-clean'
emacs:
	nix-shell --run 'emacs . &'
cabal2nix:
	cabal2nix . > project.nix

.PHONY: shell build run repl test clean cabal2nix
