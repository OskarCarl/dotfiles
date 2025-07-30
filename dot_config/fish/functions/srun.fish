function srun --wraps="systemd-run" --description="Run as superuser via systemd-run";
	if test (count $argv) -lt 1
		echo "No command given, opening default shell..."
		set -a argv "-S"
	end
	systemd-run -t $argv
end

