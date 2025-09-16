#!/usr/bin/fish

yay -S $(checkrebuild | rg -v '.*-bin' | cut -d\t -f 2)

rustup update

