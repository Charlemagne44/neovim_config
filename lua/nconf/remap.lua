-- (~/.config/nvim/lua/nconf/remap.lua)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Run gofmt on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    -- Run gofmt
    vim.fn.jobstart({ "gofmt", "-w", filepath }, {
      on_exit = function()
        -- Reload buffer if gofmt modified the file
        local current_view = vim.fn.winsaveview()
        vim.cmd("edit!")
        vim.fn.winrestview(current_view)
      end,
    })
  end,
})

