#!/bin/bash

key=$(
	ansible-vault view --vault-password-file="$HOME"/password.txt "$HOME"/secure-vault.json |
		jq ".openai.key" | sed s/\"// | sed s/\"//
)
export OPENAI_API_KEY="$key"
"$HOME"/go/bin/mods -M -f
