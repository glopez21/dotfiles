return {
    "nvim-lualine/lualine.nvim",
    
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    
    -- cool function for progress
    progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,

    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'catppuccin',
          component_separators = { left = "", right = "" },
		      section_separators = { left = "", right = "" },
		      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		      always_divide_middle = true,
	      },
	      sections = {
		      lualine_a = { branch, diagnostics },
          lualine_b = { mode },
          lualine_c = {},
          -- lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_x = { diff, spaces, "encoding", filetype },
          lualine_y = { location },
          lualine_z = { progress },
	      },
	      inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
	      },
	      tabline = {},
	      extensions = {},

      })
    end
  }