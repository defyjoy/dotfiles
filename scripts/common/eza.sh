#!/usr/bin/env bash
# eza: modern ls replacement (https://github.com/eza-community/eza)
# Common: distro-agnostic (cargo install; requires cargo/rust)

export PATH="$HOME/.cargo/bin:$PATH"
cargo install eza
