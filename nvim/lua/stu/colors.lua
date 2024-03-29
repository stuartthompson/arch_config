-- vim: set colorcolumn=25,41,69:

-- Color Codes {{{
-- Gray {{{
local gray = {
    darkest     = '#16161d',
    darker      = '#3b3c51',
    dark        = '#545675',
    normal      = '#696d8e',
    light       = '#888ba8',
    lighter     = '#d6d6e1',
    lightest    = '#f6f6f9',
}
--}}}

-- Red {{{
local red = {
    darkest     = '#3f0702',
    darker      = '#690c04',
    dark        = '#931106',
    normal      = '#d21808',
    light       = '#db4539',
    lighter     = '#e4746b',
    lightest    = '#eda39c',
}
--}}}

-- Orange {{{
local orange = {
    darkest     = '#3f2a04',
    darker      = '#6a4607',
    dark        = '#946109',
    normal      = '#d38b0d',
    light       = '#dca23d',
    lighter     = '#e5b96e',
    lightest    = '#edd19e',
}
--}}}

-- Yellow {{{
local yellow = {
    darkest     = '#474108',
    darker      = '#776d0e',
    dark        = '#a79813',
    normal      = '#eed91b',
    light       = '#f1e149',
    lighter     = '#f5e867',
    lightest    = '#f8f0a4',
}
--}}}

-- Green {{{
local green = {
    darkest     = '#26460f',
    darker      = '#40761a',
    dark        = '#59a524',
    normal      = '#7feb33',
    light       = '#99ef5c',
    lighter     = '#b2f385',
    lightest    = '#ccf7ad',
}
--}}}

-- Blue {{{
local blue = {
    darkest     = '#0d2743',
    darker      = '#154170',
    dark        = '#1d5b9c',
    normal      = '#2a82df',
    light       = '#559be5',
    lighter     = '#7fb4ec',
    lightest    = '#aacdf2',
}
--}}}

-- Purple {{{
local purple = {
    darkest     = '#431046',
    darker      = '#711a75',
    dark        = '#9e24a4',
    normal      = '#e134ea',
    light       = '#e75dee',
    lighter     = '#ed85f2',
    lightest    = '#f3aef7',
}
--}}}
--}}}

-- Common backgrounds {{{
local bg = {
    default     = gray.darkest,
    highlight   = gray.normal,
    status      = gray.dark,
}
--}}}

-- Common Foregrounds {{{
local fg = {
    default     = gray.lightest,
    highlight   = gray.lightest,
    status      = gray.lightest,
}
--}}}

local highlights = {
    { 'Normal',         fg.default,     bg.default                  },
    { 'Bold',           fg.default,     bg.default                  },
    { 'Italic',         fg.default,     bg.default                  },
    
    { 'Debug',          fg.default,                                 },
    { 'Directory',      blue.normal,                                },
    { 'Error',          fg.default,     red.darkest                 },
    { 'ErrorMsg',       red.normal,     bg.default                  },
    { 'Exception',      red.normal,     bg.default                  },

-- Invisibles (listchars) {{{
    { 'NonText',        gray.darker                                 },
    { 'SpecialKey',     gray.darker                                 },
--}}}

    { 'MatchParen',     nil,            blue.normal                 },

    { 'LineNr',         green.lightest                              },
    { 'LineNrAbove',    gray.darker                                 },
    { 'LineNrBelow',    gray.darker                                 },

    { 'Cursor',         green.normal,   green.normal                },
    { 'CursorColumn',   green.normal,   green.normal                },
    { 'CursorLine',     green.normal,   green.normal                },
    { 'CursorLineNr',   green.normal,   green.normal                },

    { 'ColorColumn',    nil,            gray.darker                 },

-- Marks and Folds {{{
    { 'FoldColumn',     fg.status,      bg.status                   },
    { 'Folded',         gray.lighter,   gray.darker                 },
--}}}

-- Search {{{
    -- Search result highlight
    { 'Search',         fg.highlight,   bg.highlight                },
    -- Search result highlight (while typing search term)
    { 'IncSearch',      fg.highlight,   bg.highlight                },
--}}}

-- Popup Menus {{{
    -- Popup menu background
    { 'Pmenu',          yellow.lightest,     gray.darker,           },
    { 'PMenuSel',       yellow.lightest,     gray.darker,           },
--}}}

-- Status {{{
    { 'StatusLine',     fg.status,      bg.status,      'bold'      },
--}}}

-- Programming Language {{{
    { 'Attribute',      purple.normal,  nil,        'italic'        },
    { 'Comment',        gray.light                                  },
    { 'Constant',       blue.light                                  },
    { 'Enum',           green.dark                                  },
    { 'EnumMember',     green.lighter                               },
    { 'Function',       yellow.lighter                              },
    { 'Identifier',     gray.lightest                               },
    { 'Interface',      green.lightest                              },
    { 'Keyword',        orange.light                                },
    { 'Lifetime',       purple.normal,  nil,        'italic,bold'   },
    { 'Macro',          purple.normal                               },
    { 'Namespace',      green.dark                                  },
    { 'Operator',       orange.lighter                              },
    { 'PathSeparator',  green.darkest                               },
    { 'Special',        purple.light                                },
    { 'Structure',      gray.lightest                               },
    { 'BuiltInType',    green.dark                                  },
    { 'Type',           green.lighter                               },
--}}}
}

-- Rust links {{{
local rustLinks = {
    { 'rustAttribute',                  'Attribute'                 },
    { 'rustCommentLine',                'Comment'                   },
    { 'rustCommentLineDoc',             'Comment'                   },
    { 'rustConditional',                'Keyword'                   },
    { 'rustDerive',                     'Attribute'                 },
    { 'rustDeriveTrait',                'Attribute'                 },
    { 'rustFuncName',                   'Function'                  },
    { 'rustLifetime',                   'Lifetime'                  },
    { 'rustModPath',                    'Namespace'                 },
    { 'rustModPathSep',                 'PathSeparator'             },
    { 'rustOperator',                   'Operator'                  },
    { 'rustRepeat',                     'Keyword'                   },
    { 'rustSelf',                       'Keyword'                   },
    { 'rustSigil',                      'Keyword'                   },
    { 'rustStorage',                    'Keyword'                   },
    { '@lsp.type.builtinType.rust',     'BuiltInType'               },
    { '@lsp.type.comment.rust',         'Comment'                   },
    { '@lsp.type.decorator.rust',       'Special'                   },
    { '@lsp.type.enum.rust',            'Enum'                      },
    { '@lsp.type.enumMember.rust',      'EnumMember'                },
    { '@lsp.type.interface.rust',       'Interface'                 },
    { '@lsp.type.method.rust',          'Function'                  },
    { '@lsp.type.namespace.rust',       'Namespace'                 },
    { '@lsp.type.struct.rust',          'Type'                      },
}
--}}}

-- Set Highlights and Links {{{
-- Set highlights
for _, hi in ipairs(highlights) do
    local bg = nil
    if hi[3] ~= nil then
        bg = hi[3]
    end
    local gui = 'none'
    if hi[4] ~= nil then
        gui = hi[4]
    end
    vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", hi[1], hi[2], bg, gui))
end

-- Set the links
for _, link in ipairs(rustLinks) do
    local cmd = string.format("highlight link %s %s", link[1], link[2])
    vim.cmd(cmd)
end
--}}}

