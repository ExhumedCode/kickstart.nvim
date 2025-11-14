# C/C++ Indentation Toggle Instructions

## Current Method: cindent (Traditional Vim)

You can easily switch between two indentation methods for C/C++ files:

## Method 1: cindent (Currently Active)
**Traditional Vim C indentation - Predictable and configurable**

- More predictable behavior
- Highly configurable via `cinoptions`
- Proven, stable indentation
- Good for structured learning (CS50x)

## Method 2: treesitter
**Modern context-aware indentation - Intelligent and adaptive**

- More intelligent, context-aware
- Better for complex nested structures
- Less configuration needed
- Modern approach

---

## How to Switch Methods

### Quick Toggle (Recommended)

**Option A: Use the Toggle Command (In Neovim)**
```vim
:ToggleCIndent
```

This will switch between methods and reload your config automatically.

### Manual Toggle

**Step 1:** Open `c_indent.lua`
```vim
:e ~/.config/nvim/lua/custom/c_indent.lua
```

**Step 2:** Change line 11 from:
```lua
local INDENT_METHOD = 'cindent'  -- Current
```

To:
```lua
local INDENT_METHOD = 'treesitter'  -- Switch to tree-sitter
```

**Step 3:** If switching to treesitter, also update `init.lua` line 967:

Change:
```lua
indent = { enable = true, disable = { 'ruby', 'c', 'cpp' } },
```

To:
```lua
indent = { enable = true, disable = { 'ruby' } },
```

**Step 4:** Reload config
```vim
:source ~/.config/nvim/init.lua
```

**Step 5:** Reopen your C file to apply changes

---

## Testing Your Indentation

After switching, test with this code:

```c
#include <stdio.h>

int main(void) {
    if (condition)
    {
        printf("Test\n");
    }
    else if (other_condition)
    {
        printf("Another test\n");
    }
}
```

**What to check:**
1. After typing `}` and pressing Enter, does the cursor indent properly?
2. Does `else if` align correctly with the previous `if`?
3. Do nested braces maintain proper indentation?

---

## Which Should You Use?

### Use **cindent** if you want:
- ✓ Predictable, consistent behavior
- ✓ CS50-style formatting
- ✓ Traditional Vim experience
- ✓ Maximum control via configuration

### Use **treesitter** if you want:
- ✓ More intelligent, context-aware indentation
- ✓ Modern editing experience
- ✓ Better handling of complex nested code
- ✓ Less manual configuration

**Recommendation:** Start with cindent (current default), try treesitter if you want more "intelligence."

---

## Troubleshooting

**Indentation not working after switch?**
1. Make sure you reloaded the config (`:source ~/.config/nvim/init.lua`)
2. Close and reopen your C file
3. Check that tree-sitter is enabled in init.lua if using treesitter method

**Still having issues?**
Run `:checkhealth` to verify tree-sitter is working correctly.

---

Last Updated: 2025-01-12
