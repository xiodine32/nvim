return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
		{ "lukas-reineke/lsp-format.nvim" },
	},
	opts = function(_, _)
		local lsp = require("lsp-zero").preset("recommended")

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		-- local cmp = require('cmp')
		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
		-- local cmp_mappings = lsp.defaults.cmp_mappings({
		--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		--     ["<C-Space>"] = cmp.mapping.complete(),
		-- })

		cmp_mappings["<Tab>"] = nil
		cmp_mappings["<S-Tab>"] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		-- local cmp = require("cmp")
		-- local cmp_action = require("lsp-zero").cmp_action()
		-- cmp.setup({
		--     mapping = {
		--         ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		--         ["<Tab>"] = cmp_action.luasnip_supertab(),
		--         ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		--     },
		-- })

		---@diagnostic disable-next-line: unused-local
		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })

			if client.supports_method("textDocument/formatting") then
				require("lsp-format").on_attach(client)
			end
		end)

		local lspconfig = require("lspconfig")

		-- lua
		lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
		-- angular
		lspconfig.angularls.setup({})
		-- typescript
		lspconfig.tsserver.setup({})
		-- c sharp
		lspconfig.omnisharp.setup({
			cmd = { "dotnet", "~/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			enable_editorconfig_support = true,
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			enable_ms_build_load_projects_on_demand = false,
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			enable_roslyn_analyzers = true,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			organize_imports_on_format = true,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			enable_import_completion = true,
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			sdk_include_prereleases = true,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			analyze_open_documents_only = true,
		})

		-- null ls
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local lint = null_ls.builtins.diagnostics

		local sources = {
			formatting.csharpier,
			formatting.stylua,
			formatting.yamlfmt,

			lint.shellcheck,
		}

		null_ls.setup({
			debug = true,
			sources = sources,
		})

		lsp.setup()
	end,
}
