# Code Formatting Guide for CS50x

## Quick Reference

### Format Entire File
```vim
<Space>f       - Full professional formatting (clang-format)
gg=G           - Quick indentation fix (cindent)
```

### Format Selected Lines
```vim
V              - Enter visual line mode
j/k            - Select lines up/down
=              - Format selected lines (cindent)
<Space>f       - Format selection (clang-format)
```

### Format Current Block
```vim
=ip            - Format current paragraph/block
=i{            - Format inside current braces
```

## When to Use Each

### `<Space>f` (clang-format) - Recommended
- **Use when**: You want full professional formatting
- **Does**: Indentation + spacing + style consistency
- **Result**: Professional, CS50-compliant formatting
- **Speed**: Slower (processes entire file)

### `gg=G` (cindent) - Quick Fix
- **Use when**: You just need indentation fixed quickly
- **Does**: Indentation only
- **Result**: Properly indented code
- **Speed**: Very fast

## Common Scenarios

### Scenario 1: Code Inside Loop Not Indented
**Problem**: Just added code inside while/for loop, not indented properly

**Solution**:
1. Visual select the lines: `V` + `jjj` (select 3 lines down)
2. Press `=`
3. Done!

**Or**: `<Space>f` to format entire file

### Scenario 2: Entire File Messy
**Problem**: Code all over the place, inconsistent spacing

**Solution**:
1. Press `<Space>f`
2. Wait 1-2 seconds
3. Done! Professional formatting applied

### Scenario 3: Just Fix Current Function
**Problem**: Only want to format the function you're in

**Solution**:
1. Move cursor anywhere in function
2. Press `=i{` (format inside braces)
3. Done!

## Configuration Details

### What Was Set Up
- **clang-format**: Professional C formatter (industry standard)
- **CS50 Style**: 4-space indent, K&R/Linux braces, CS50-compliant
- **Manual Control**: Format-on-save disabled (you control when)
- **Location**: `~/.clang-format` (configuration file)

### Format-on-Save Status
**Currently**: DISABLED (manual control)

If you want to enable auto-format on save:
1. Open `~/.config/nvim/init.lua`
2. Find line 765: `local disable_filetypes = { c = true, cpp = true }`
3. Change to: `local disable_filetypes = {}`
4. Restart Neovim

**Recommendation**: Keep it disabled during learning. Format manually when ready.

## Troubleshooting

### "clang-format not found"
Check if clang-format is installed:
```bash
which clang-format
```

If not found, install:
```bash
brew install clang-format
```

### Formatting doesn't match expectations
Your `~/.clang-format` file controls the style. It's configured for CS50 standards.

### Want to see what will change before formatting
No preview available, but:
1. Save your file first (`:w`)
2. Format (`<Space>f`)
3. If you don't like it: undo (`u`)

## Pro Tips

1. **Save before formatting**: `:w` then `<Space>f` (can undo if needed)
2. **Format often**: Don't wait until code is messy - format as you go
3. **Visual mode is your friend**: Select lines, press `=` for quick indent
4. **Muscle memory**: `<Space>f` becomes second nature after a few uses

## Your Current Workflow

1. Write C code (focus on logic)
2. When ready to format: `<Space>f`
3. Code becomes readable
4. Compile: `<Space>cc`
5. Run and test

**Focus on**: C programming, algorithms, problem-solving
**Don't worry about**: Manual spacing, counting indents, style debates

---

Last Updated: 2025-01-12
Configuration: CS50-compatible professional formatting
