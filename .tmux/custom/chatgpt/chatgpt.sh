#!/bin/bash

set -e

key=$(
	ansible-vault view --vault-password-file="$HOME"/password.txt "$HOME"/secure-vault.json |
		jq ".openai.key" | sed s/\"// | sed s/\"//
)
export OPENAI_API_KEY="$key"
mods -M -f
