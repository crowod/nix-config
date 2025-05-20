nia:
	nixos-rebuild switch --flake .#nia --use-remote-sudo

mio:
	nixos-rebuild switch --flake .#mio --use-remote-sudo

hikari:
	nix build .#darwinConfigurations.hikari.system --extra-experimental-features 'nix-command flakes'
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#hikari --show-trace
up:
	nix flake update
	
upp:
	nix flake lock --update-input $(i)
	
history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug
	
.PHONY: clean  
clean:  
	rm -rf result
