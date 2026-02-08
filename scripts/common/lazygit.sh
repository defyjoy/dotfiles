#!/usr/bin/env bash
# lazygit: terminal UI for git (https://github.com/jesseduffield/lazygit)
# Common: distro-agnostic (go install; requires go)

export PATH="$HOME/go/bin:$PATH"
go install github.com/jesseduffield/lazygit@latest
