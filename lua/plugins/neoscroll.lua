return {
  -- Smooth scrolling.
  "karb94/neoscroll.nvim",
  config = function()
    neoscroll = require("neoscroll")
    neoscroll.setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = false, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil, -- Default easing function
      performance_mode = false, -- Disable "Performance Mode" on all buffers.

      -- Hide/show cursor line before/after scrolling.
      pre_hook = function(info)
        if info == "cursorline" then
          vim.wo.cursorline = false
        end
      end,
      post_hook = function(info)
        if info == "cursorline" then
          vim.wo.cursorline = true
        end
      end,
    })
    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 350, easing = "sine", info = "cursorline" })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 350, easing = "sine", info = "cursorline" })
      end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
