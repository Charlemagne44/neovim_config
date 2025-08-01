return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    strategies = {
      chat = { adapter = "ollama_local" },
      inline = { adapter = "ollama_local" },
      cmd = { adapter = "ollama_local" },
    },
    adapters = {
      ollama_local = function()
        local adapters = require("codecompanion.adapters")
        return adapters.extend("ollama", {
          name = "ollama_local",
          schema = {
            model = { default = "codellama:latest" }, -- <-- this is what matters
          },
        })
      end,
    },
    log_level = "DEBUG",
  },
}

