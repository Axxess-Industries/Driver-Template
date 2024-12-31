---@diagnostic disable: undefined-global
--[[=============================================================================
    File is: .luacheckrc

    Copyright 2024 2024-2025 Axxess Industries. All Rights Reserved.  All Rights Reserved.

    Find the list of Luacheck warnings at:
    https://luacheck.readthedocs.io/en/stable/warnings.html

===============================================================================]]

-- don't flag warnings about the self variable
ignore = {
    '212/self',
}

-- stdlib globals (should be 'luajit' or 'lua52' for Control4 drivers)
std = "luajit+Control4+Driver"

--allow_defined_top -- Defining globals implicitly by setting in top level code
allow_defined_top = true

max_line_length = 200


-- Control4 standard globals
stds.Control4 = {
    read_globals = {
        -- Control4 Driver Architecture mandated read-only globals
        'C4',
        'C4SystemEvents',
        'Properties',
        'Variables',
    },

    globals = {
         -- Driver Internal Globals
        'TEMPLATE_VERSION',
        'ON_DRIVER_EARLY_INIT',
        'ON_DRIVER_INIT',
        'ON_DRIVER_LATEINIT',
        'ON_DRIVER_DESTROYED',
        'ON_PROPERTY_CHANGED',
        'LUA_ACTION',
        'EX_CMD',
        'DEV_MSG',
        'PersistData',
        'UpdateProperty',
        'OnBindingChanged',
        'LogError',
        'LogWarn',
        'LogInfo',
        'LogDebug',
        'LogTrace',
        'LogDev',
        'AsciiToBCD',
        'BCDToAscii',
        'MakeXMLNode',
        'MakeXMLAttrNode',
        'ExtractXMLValue',
        'StringFromUnicode',
        'tointeger',
        'Go',
        'IsEmpty',
        'ReverseTable',
        'CloneTable',
        'tonumber_loc',
        'StringToHex',
        'VersionCheck',
        'RecordHistory',
        'RecordCriticalHistory',
        'RecordWarningHistory',
        'RecordInfoHistory',
        'GetC4ZPath',
        'pCallFunction',
        'toboolean',
        'StringSplit',
        'UpdateC4Variable',
        'gIsDevelopmentVersionOfDriver',
        'HexToString',
        'inheritsFrom',
        'CreateTimer',

        'DEFAULT_PROXY_BINDINGID',
        'HideProperty',
        'ShowProperty',
        'EstablishCommunication',
        'TearDownCommunication',
    },
}

---------------------------------------------------------------------
-- Driver specific

-- Driver-defined globals
---@diagnostic disable-next-line: undefined-global
stds.Driver = {
    read_globals = {
    },

    globals = {
        -- Everybody can see
        'Template_Driver'
    }
}


---------------------------------------------------------------------
-- File specific

files['driver.lua'] = {
    ignore = {
        -- unused globals
    },
    read_globals = {
        'SetLogName',
        'DRIVER_NAME',
    }
}
