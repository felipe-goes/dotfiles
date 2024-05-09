#!/bin/bash

key=$(
	ansible-vault view --vault-password-file="$HOME"/password.txt secure-vault |
		cut -d ':' -f 2 |
		sed -n '1p'
)
export OPENAI_API_KEY="$key"
"$HOME"/go/bin/mods -M -f
