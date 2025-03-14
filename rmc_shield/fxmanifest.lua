fx_version 'cerulean'
game 'gta5'

author 'RMC Development'  -- Replace with your name
description 'Ballistic Shield with Custom Animation'

version '1.0.0'

-- Specify your shared scripts (if any)
shared_scripts {
    'config.lua'  -- Make sure you have a config.lua file if you're using one
}

-- Client scripts (where the shield logic and animation are defined)
client_scripts {
    'client.lua'
}

-- Server scripts (for handling server-side logic if needed)
server_scripts {
    'server.lua'
}

-- Stream folder where custom .ycd animations are stored
files {
    'stream/ebrwny@shield003.ycd'  -- Path to the custom animation file
}

-- Data files (if you use any)
data_file 'AUDIO_WAVEPACK' 'audio/sfx/radio/*'

-- Optional: Add any UI files or additional assets if needed
