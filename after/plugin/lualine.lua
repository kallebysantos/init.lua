local function current_time()
    return os.date('%H:%M')
end

require('lualine').setup({
    options = { theme = 'iceberg_dark' },
    sections = {
        lualine_y = { 'location' },
        lualine_z = { current_time }
    }
})
