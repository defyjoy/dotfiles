# eza themes

Themes from [eza-themes](https://github.com/eza-community/eza-themes). The install script clones the repo to `~/Documents/repos/eza-themes` and links **catppuccin-latte** by default.

## Available themes

| Theme | Description |
|-------|-------------|
| `default` | Replicates eza's default look |
| `frosty` | Bright and icy tones |
| `black` | All black everything |
| `white` | All white everything |
| `gruvbox-dark` | Classic bright theme, warm retro groove colors |
| `gruvbox-light` | Gruvbox for light mode |
| `catppuccin-latte` | Smooth pastel, latte flavor (default after install) |
| `catppuccin-frappe` | Smooth pastel, frappe flavor |
| `catppuccin-macchiato` | Smooth pastel, macchiato flavor |
| `catppuccin-mocha` | Smooth pastel, mocha flavor |
| `onedark` | OneDark (Atom-style) |
| `dracula` | Dracula theme |
| `tokyonight` | Tokyonight theme |
| `rose-pine` | Rosé Pine main palette |
| `rose-pine-dawn` | Rosé Pine Dawn |
| `rose-pine-moon` | Rosé Pine Moon |
| `solarized-dark` | Solarized dark palette |

Theme files live in `~/Documents/repos/eza-themes/themes/*.yml`.

## Switch theme

Point eza’s config at the theme you want:

```bash
ln -sf ~/Documents/repos/eza-themes/themes/<theme-name>.yml ~/.config/eza/theme.yml
```

Example (catppuccin-mocha):

```bash
ln -sf ~/Documents/repos/eza-themes/themes/catppuccin-mocha.yml ~/.config/eza/theme.yml
```

`EZA_CONFIG_DIR` can override the config directory; `LS_COLORS` and `EZA_COLORS` override the theme file if set.
