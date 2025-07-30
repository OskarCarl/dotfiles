function ll --wraps="eza" --description="Show a detailed list of a targets contents using eza";
	eza --all --git --binary --long $argv
end

