fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts { 
    '@ox_lib/init.lua',
    'config.lua',
    -- 'secure.lua' --- protekce 
}

client_scripts {
    'cl-main.lua',
    'utils.lua',
}

server_scripts {
    'sv-main.lua'
}