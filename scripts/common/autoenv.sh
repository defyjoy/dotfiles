#!/usr/bin/env bash
# autoenv: directory-based environments (https://github.com/hyperupcall/autoenv)
# Common: distro-agnostic

[ -d "${HOME}/.autoenv" ] || curl -#fLo- 'https://raw.githubusercontent.com/hyperupcall/autoenv/main/scripts/install.sh' | sh
