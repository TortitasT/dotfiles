# Vim/Neovim

This configuration will work with Neovim and Vim.

Neovim has all the plugins I use and works as my IDE and Vim has a minimal
configuration. Both share mappings.

## Installation

```bash
./install.sh
```

## Development

Ensure `luarocks` and `luacheck` is installed

```bash
sudo pacman -S luarocks
sudo luarocks install luacheck
```

Check for lint errors

```bash
luacheck .
```

## Notes

### Replace in current file

`:%s/<search_word>/<replace_word>/g`

### Lint markdown selection

With text selected on visual mode.

`gq`
