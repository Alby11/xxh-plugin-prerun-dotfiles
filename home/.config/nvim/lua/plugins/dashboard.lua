local mapkey = require("util.keymapper").mapvimkey

local keys = {
	mapkey("<leader>H", "Dashboard", "n", { silent = true, noremap = true, desc = "Dashboard" }), -- Call Dashboard
}

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function()
			-- Function to execute a shell command and capture its output
			local function execute_command(command)
				local handle = io.popen(command)
				local result = handle:read("*a")
				handle:close()
				return result
			end

			-- Get the username
			local username = execute_command("whoami"):gsub("\n", "")
			-- Get the hostname
			local hostname = execute_command("hostname"):gsub("\n", "")
			-- Get current working directory
			local current_directory = vim.fn.getcwd()
			local opts = {
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
						append = {
							string.format("%s@%s > %s", username, hostname, current_directory),
						},
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " New file",
							group = "DiagnosticHint",
							action = "ene | startinsert",
							key = "n",
						},
						{
							desc = " Restore session",
							group = "Constant",
							action = 'lua require("persistence").load()',
							key = "s",
						},
						{
							desc = " Projects",
							group = "Property",
							action = "Telescope projects",
							key = "p",
						},
						{
							desc = " Find",
							group = "Field",
							action = "Telescope fd",
							key = "d",
						},
						{
							desc = " Live grep",
							group = "Number",
							action = "Telescope live_grep",
							key = "g",
						},
						{
							desc = " Config",
							group = "Parameter",
							action = '[[lua require("lazyvim.util").telescope.config_files()()]]',
							key = "c",
						},
						{
							desc = "> Cheat.sh",
							group = "Exception",
							action = "Cheat",
							key = "C",
						},
						{
							desc = "  Quit",
							group = "Exception",
							action = "qa",
							key = "q",
						},
					},
				},
			}

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
		keys = keys,
	},
}
