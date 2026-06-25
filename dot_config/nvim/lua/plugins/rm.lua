return {
	'babarot/rm.nvim',
	cmd = 'Rm', -- Load when :Rm is executed
	opts = {
		command = 'kioclient move {file} trash:/',
	},
}
