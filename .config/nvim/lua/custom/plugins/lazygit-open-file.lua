return function(filename, line_number)
  line_number = tonumber(line_number) or 1
  -- vim.cmd 'bwipeout!'
  vim.cmd.close()
  vim.cmd('edit ' .. filename)
end
