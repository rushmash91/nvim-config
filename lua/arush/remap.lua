vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Set the leader key to Space
vim.g.mapleader = ' '

-- Function to open the file in a tmux pane
local function open_in_tmux_pane(split_type)
    -- Netrw sets the current line to the filepath in the Netrw buffer
    local file = vim.fn.getline('.')
    if vim.fn.filereadable(file) == 1 then
        -- If it's a file, build and run the tmux command
        local tmux_cmd = 'tmux split-window ' .. split_type .. ' nvim ' .. vim.fn.shellescape(file)
        vim.fn.system(tmux_cmd)
    else
        print('The current line is not a file or the file is not readable.')
    end
    vim.cmd('redraw!')
end

-- Netrw key mappings for tmux integration
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        -- Map 'Space th' to open the file in a horizontal tmux split
        vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>th', '', {
            noremap = true,
            silent = true,
            callback = function() open_in_tmux_pane('-h') end
        })
        -- Map 'Space tv' to open the file in a vertical tmux split
        vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>tv', '', {
            noremap = true,
            silent = true,
            callback = function() open_in_tmux_pane('-v') end
        })
    end
})

