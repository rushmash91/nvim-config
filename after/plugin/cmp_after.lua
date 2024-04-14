-- Ensure cmp is available
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- Configuration for nvim-cmp to set Enter to select completion
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  -- Add the rest of your existing cmp.setup configuration here as needed.
})

