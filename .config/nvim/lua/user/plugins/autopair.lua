return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	dependencies = {
		"windwp/nvim-ts-autotag",
		config = true,
	},
}
