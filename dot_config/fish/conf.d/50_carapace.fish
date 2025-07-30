if status is-interactive
	set -gx CARAPACE_BRIDGES fish
	carapace _carapace | source
end
