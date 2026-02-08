# RCA: Terminal hangs and repeated "robbyrussell is already installed" on `source ~/.zshrc`

## Summary

Sourcing `~/.zshrc` causes the terminal to hang and repeatedly print a message like **"Seems robbyrussell is already installed!"** (or "robbyrussell/oh-my-zsh is already installed!").

## Root cause

Two factors together produce this behavior:

### 1. Recursive sourcing loop (main cause of hang and repetition)

- **`.zshrc`** sources **`~/.autoenv/activate.sh`** near the top (before Antigen/Oh My Zsh).
- At the end, **`activate.sh`** calls **`enable_autoenv`**, which runs **`cd "${PWD}"`**.
- That triggers **`autoenv_cd` → `autoenv_init`**, which looks for **`.env`** files in the current directory and parents and **sources** them if authorized.
- If any **`.env`** in that path contains **`source ~/.zshrc`** (or equivalent), then:
  1. First pass: `source ~/.zshrc` runs → sources `activate.sh` → `cd $PWD` → `autoenv_init` finds `.env` → `.env` runs `source ~/.zshrc`.
  2. Second pass: same again, and so on → **infinite loop**.

So the **repeated** behavior and **hang** come from this **recursive re-sourcing** of `.zshrc` driven by autoenv + a `.env` that sources `.zshrc`.

### 2. Duplicate-bundle message from Antigen

- The message **"Seems robbyrussell is already installed!"** is printed by **Antigen** in **`antigen-bundle`** when the same bundle is registered twice (`antigen.zsh` around line 819–821).
- On the **first** pass, **`antigen use oh-my-zsh`** runs and registers the **robbyrussell/oh-my-zsh** bundle in **`_ANTIGEN_BUNDLE_RECORD`**.
- On every **subsequent** pass (each time `.zshrc` is re-sourced by the loop), **`antigen use oh-my-zsh`** runs again. The bundle is already in the record, so Antigen prints the duplicate message and returns.
- So you see that message **once per loop iteration** → "repeatedly prints" while the shell is stuck in the loop.

## Contributing factor (optional cleanup)

- **`.zshrc`** uses **Antigen** with **`antigen use oh-my-zsh`** and then also runs **`source $ZSH/oh-my-zsh.sh`**. That loads the Oh My Zsh framework twice (once via Antigen, once directly). It does not by itself cause the hang or the "already installed" message, but it is redundant and can be simplified (e.g. use either Antigen for Oh My Zsh or standalone Oh My Zsh, not both in a conflicting way).

## Fixes applied

1. **Re-entry guard in `.zshrc`**  
   At the top of `.zshrc`, a guard ensures that if `.zshrc` is sourced again while it is already running, the script returns immediately. That **stops the recursive loop** and thus the hang and the repeated "robbyrussell is already installed" message, even if a `.env` still contains `source ~/.zshrc`.

2. **User action recommended**  
   - Check any **`.env`** under your project or home for **`source ~/.zshrc`** (or `source $HOME/.zshrc`). Remove or replace it (e.g. with the specific vars or commands you need) to avoid unnecessary re-sourcing.  
   - Optionally, simplify Antigen vs Oh My Zsh so you are not loading the same framework twice.

## References

- Antigen duplicate check: `antigen.zsh` → `antigen-bundle` (e.g. lines 818–821), message: `"Seems %s is already installed!\n"` with `bundle[name]` (e.g. `robbyrussell/oh-my-zsh`).
- Autoenv: `~/.autoenv/activate.sh` → `enable_autoenv` → `cd "${PWD}"` → `autoenv_cd` → `autoenv_init` → sources authorized `.env` files.
