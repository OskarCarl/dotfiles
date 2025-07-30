# vim: ft=sh

# sets default permissions on the given directory tree. if none is given, assumes "."
set_def_permissions() {
    if [[ -z $1 ]]; then
        1=".";
    fi
    find "$1" -type d -exec chmod 755 -- {} +;
    find "$1" -type f -exec chmod 644 -- {} +;
}

# prevents nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

# prevents nested lf instances
if [ -n "$LF_LEVEL" ]; then
	lf() {
		if [ -z "$@" ]; then
			target="$(pwd)"
		else
			target="$@"
		fi

		/usr/bin/lf -remote "send $id cd $target"
		exit
	}
fi

lg() {
	f=`pwd`
	err=0
	while [[ ! -d "$f/.git/" ]]; do
		f=$(dirname $f)
		if [[ "$f" == "/" ]]; then
			err=1
			break
		fi
	done
	if [[ "x$err" == "x0" ]]; then
		lazygit -p $f
	else
		print "No git repository found in directory and parents."
	fi
}

update_dependents() {
	if [ -z "$1" ]; then
		print "You need to provide a pacakge name."
	else
		packages="$(pactree -rlu $1 | rg "^($(yay -Qm | rg -o "^[\w-]+" | tr '\n' '|'))\$" | tr '\n' ' ')"
		printf "yay -Sy %s\nPress enter to continue.\n" $packages
		read -r
		yay -Sy $packages
	fi
}

