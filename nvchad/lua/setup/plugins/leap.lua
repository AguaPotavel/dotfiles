require('leap').create_default_mappings()

vim.keymap.set('n',        's', '<Plug>(leap)', { remap = true})
vim.keymap.set('n',        'S', '<Plug>(leap-from-window)', { remap = true})
vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)', { remap = true})
vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)', { remap = true})
