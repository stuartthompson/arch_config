local colors = require('stu.colors')
local gray = colors.gray
local red = colors.red
local orange = colors.orange
local yellow = colors.yellow
local green = colors.green
local blue = colors.blue
local purple = colors.purple

-- Define highlights {{{
local highlights = {
    { 'Normal',         gray.lightest,  black                       },
    { 'Bold',           gray.lightest,  black                       },
    { 'Italic',         gray.lightest,  black                       },
    
    { 'Debug',          gray.lightest,                              },
    { 'Directory',      blue.normal,                                },
    { 'Error',          gray.lightest,  red.dark                    },
    { 'ErrorMsg',       red.normal,     gray.darkest                },
    { 'Exception',      red.normal,     gray.darkest                },

-- Invisibles (listchars) {{{
    { 'NonText',        gray.darker                                 },
    { 'SpecialKey',     gray.darker                                 },
--}}}

    { 'MatchParen',     nil,            blue.normal                 },

-- Columns & Cursors {{{
    -- Line numbers
    { 'LineNr',         green.lightest                              },
    { 'LineNrAbove',    gray.darker                                 },
    { 'LineNrBelow',    gray.darker                                 },
    
    -- Cursor
    { 'Cursor',         green.normal,   green.normal                },
    { 'CursorColumn',   green.normal,   green.normal                },
    { 'CursorLine',     nil,            green.darkest               },
    { 'CursorLineNr',   green.normal,   green.normal                },

    -- Columns
    { 'ColorColumn',    nil,            blue.darker                 },
    -- Sign column (left; used by git signs)
    { 'SignColumn',     gray.lightest,  gray.darkest                },
--}}}

-- Diff {{{
    { 'DiffAdd',        green.lightest, green.darkest               },
    { 'DiffChange',     blue.lightest,  blue.darkest                },
    { 'DiffDelete',     red.lightest,   red.darkest                 },
    { 'DiffText',       purple.lightest,purple.darkest              },
--}}}

-- Marks and Folds {{{
    { 'FoldColumn',     gray.lightest,  gray.dark                   },
    { 'Folded',         gray.lighter,   gray.darker                 },
--}}}

-- Search {{{
    -- Search result highlight
    { 'Search',         gray.lightest,  gray.light                  },
    -- Search result highlight (while typing search term)
    { 'IncSearch',      gray.lightest,  gray.lighter                },
--}}}

-- Popup Menus {{{
    -- Notifications
    { "NotifyBackground", green.dark,             gray.darker              },
    -- Popup menu background
    { 'Pmenu',          gray.lightest,     gray.darkest,           },
    { 'PMenuSel',       yellow.lightest,   gray.darkest,           },
--}}}

-- Status {{{
    { 'StatusLine',     gray.lightest,      gray.normal,      'bold'      },
--}}}

-- Markdown {{{
    { 'Title',          yellow.normal, nil,         'bold'          },
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
--}}}

-- Markdown links {{{
local markdownLinks = {
    { 'MarkdownH1Delimiter',            'Title'                     },
    { 'lsp_markdown4',                  'Normal'                    },
}
--}}}

-- Define Rust links {{{
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
    vim.cmd(string.format("hi %s guifg=%s guibg=%s gui=%s", hi[1], hi[2], bg, gui))
end

-- Set Markdown links
for _, link in ipairs(markdownLinks) do
    local cmd = string.format("hi link %s %s", link[1], link[2])
    vim.cmd(cmd)
end

-- Set Rust links
for _, link in ipairs(rustLinks) do
    local cmd = string.format("hi link %s %s", link[1], link[2])
    vim.cmd(cmd)
end
--}}}

