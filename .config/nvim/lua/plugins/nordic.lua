return {
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			disable_background = true
			require 'nordic' .load()
		end
	}
}
