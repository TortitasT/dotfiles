# Vim

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

- :%s/<search_word>/<replace_word>/g Replace in current file
