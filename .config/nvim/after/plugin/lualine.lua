local mode_map = {
    ['n']   = '􁜾 ',
    ['no']  = '􀍠 ',
    ['nov'] = '􀍠 ',
    ['noV'] = '􀍠 ',
    ['no�'] = '􀍠 ',
    ['niI'] = '􁜾 ',
    ['niR'] = '􁜾 ',
    ['niV'] = '􁜾 ',
    ['nt']  = '􁜾 ',
    ['v']   = '􀹃 ',
    ['vs']  = '􀹃 ',
    ['V']   = '􁎢 ',
    ['Vs']  = '􁎢 ',
    ['�s']  = '􀡅 ',
    ['s']   = '􂇏 ',
    ['S']   = '􀐩 ',
    ['�']   = '􀑠 ',
    ['i']   = '􀈊 ',
    ['ic']  = '􀈊 ',
    ['ix']  = '􀈊 ',
    ['R']   = '􁝀 ',
    ['Rc']  = '􁝀 ',
    ['Rx']  = '􁝀 ',
    ['Rv']  = '􁚜 ',
    ['Rvc'] = '􁚜 ',
    ['Rvx'] = '􁚜 ',
    ['c']   = '􀆔 ',
    ['cv']  = '􀐳 ',
    ['ce']  = '􀐳 ',
    ['r']   = '􁝀 ',
    ['rm']  = '􀍡 ',
    ['r?']  = '􀇺 ',
    ['!']   = '􁕔 ',
    ['t']   = '􀩼 ',
}


vim.o.showmode = false
require('lualine').setup {
    options = {
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                function()
                    return mode_map[vim.api.nvim_get_mode().mode] or "__"
                end,
                padding = 1
            }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            '%=', --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = {
            'filetype',
            {
                'diagnostics',
                symbols = { error = '􀘰  ', warn = '􀇿  ', info = '􁊈  ', hint = '􁇗  ' }
            }
        },
        lualine_z = {
            {
                'location',
                separator = { left = '', right = '' },
                left_padding = 2
            },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {
        'quickfix',
        'fzf',
        'mason',
        'fugitive',
    },
}
