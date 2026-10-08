# Drakthon loader

Prints the two paste lines for the Drakthon scripts. It runs nothing itself:
nothing executes a script until you paste one of the lines it prints.

## Use

Paste into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fisal-new/drakthon-loader/main/drakthon-loader.lua"))()
```

It reads `manifest.json`, prints the current version and both script links, and
falls back to the URLs compiled into it if the fetch fails. So it still works
with networking blocked.

## Files

| file | what |
|---|---|
| `drakthon-loader.lua` | the loader |
| `manifest.json` | version and both script URLs |

## Changing a script URL

Edit `manifest.json`, commit, done. The loader picks it up on the next run. The
URLs baked into the loader are only a fallback, so update those too if you want
them to match.

## Moving this to another account

```bash
gh repo create <new-account>/drakthon-loader --public
cd drakthon-loader
git remote add new git@github.com:<new-account>/drakthon-loader.git
git push new main
```

Then update `manifest.json` in the new location if the loader path changed, and
point your users at the new raw URL.
