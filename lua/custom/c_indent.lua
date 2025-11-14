-- C/C++ Indentation Configuration for CS50x
-- This ensures consistent auto-indentation for C files

-- ============================================================================
-- INDENTATION METHOD TOGGLE
-- ============================================================================
-- Change this to switch between indentation methods:
--   'cindent'     - Traditional Vim C indentation (recommended, more predictable)
--   'treesitter'  - Modern tree-sitter based indentation (more intelligent)
-- ============================================================================
local INDENT_METHOD = 'cindent'  -- Toggle: 'cindent' or 'treesitter'
-- ============================================================================

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'h', 'hpp' },
  callback = function()
    -- Tab settings (4 spaces for CS50)
    vim.opt_local.tabstop = 4        -- Tab width is 4 spaces
    vim.opt_local.shiftwidth = 4     -- Indent by 4 spaces
    vim.opt_local.softtabstop = 4    -- Backspace deletes 4 spaces
    vim.opt_local.expandtab = true   -- Use spaces, not tabs

    -- Auto-indentation behavior
    vim.opt_local.autoindent = true  -- Copy indent from current line

    if INDENT_METHOD == 'cindent' then
      -- ======================================================================
      -- CINDENT CONFIGURATION (Traditional Vim C Indentation)
      -- ======================================================================
      vim.opt_local.cindent = true
      vim.opt_local.smartindent = false -- Disable smartindent (cindent is better)

      -- Ensure indentation is maintained
      vim.opt_local.preserveindent = false
      vim.opt_local.copyindent = false

      -- CRITICAL: Configure cindent options for smooth auto-indentation
      -- See :help cinoptions-values for full documentation
      vim.opt_local.cinoptions = {
        '>4',    -- Shift width for normal indent (4 spaces)
        'e0',    -- Align else with matching if on same column
        'n0',    -- No extra indent for statements inside namespace
        'f0',    -- First opening brace of function aligns with column 0
        '{0',    -- Opening brace indent (0 = same column as statement)
        '}0',    -- Closing brace indent (0 = aligns with opening brace)
        '^0',    -- Extra indent for function return type (0 = none)
        'L0',    -- Jump label indent (0 = column 0)
        ':0',    -- Case label indent (0 = aligned with switch)
        '=0',    -- Statements after case label (0 = no extra indent)
        'l1',    -- Align with case label instead of statement after it
        'b0',    -- Align final semicolon (0 = no extra indent)
        'g0',    -- C++ scope declarations (0 = no extra indent)
        'h0',    -- Statements after C++ scope declarations (0 = no extra)
        'N0',    -- Indent inside C++ namespace (0 = no extra indent)
        'p0',    -- K&R-style function parameters (0 = no extra)
        't0',    -- Function return type indent (0 = no extra)
        'i4',    -- Indent for C++ base class (4 spaces)
        '+4',    -- Continuation line indent (4 spaces)
        'c3',    -- Comment line indent (3 spaces from comment start)
        'C1',    -- Nested comment indent (follow previous line)
        '/0',    -- Comment start indent (0 = no extra)
        '(0',    -- Line up with unclosed parenthesis
        'u0',    -- Same as (0 but one level deeper
        'U1',    -- Don't ignore indent specified by ( or u
        'w1',    -- Align with char after unclosed paren on new line
        'W4',    -- Wrapped paren line uses 4-space indent
        'm1',    -- Line up closing paren with opening paren line
        'M0',    -- Don't consider closing paren on line by itself
        'j1',    -- Properly indent anonymous classes
        ')20',   -- Search 20 lines for unclosed parens
        '*70',   -- Search 70 lines for unclosed comments
        '#0',    -- Preprocessor directives at column 0
      }

    elseif INDENT_METHOD == 'treesitter' then
      -- ======================================================================
      -- TREE-SITTER CONFIGURATION (Modern Context-Aware Indentation)
      -- ======================================================================
      vim.opt_local.cindent = false     -- Disable cindent
      vim.opt_local.smartindent = false -- Disable smartindent
      vim.opt_local.indentexpr = 'nvim_treesitter#indent()'

      -- Tree-sitter will handle indentation via init.lua configuration
      -- Note: You must also enable tree-sitter indent in init.lua by changing:
      --   indent = { enable = true, disable = { 'ruby', 'c', 'cpp' } }
      -- to:
      --   indent = { enable = true, disable = { 'ruby' } }

    end
  end,
})
