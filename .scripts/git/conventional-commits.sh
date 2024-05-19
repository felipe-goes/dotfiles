#!/bin/bash

set -e

choose=$(
	echo -e \
		"test: indicates any type of creation or update on the tests.\n\
feat: indicates the development of a new feature to the project.\n\
refactor: used when there is a refactoring on the code that has no impact in the logic or in the business rules of the system.\n\
style: used when there are formatting and style changes to the code that does not change the system behavior whatsoever.\n\
fix: used when there is a fix that were causing issues to the system.\n\
chore: indicates a change in the project that does not affect the system or the test files. These are changes in the project organization.\n\
docs: used when there are documentation changes to the project.\n\
build: used to indicate changes that affect the build process of the of the project or external dependencies.\n\
perf: indicate change that unhanced the system performance.\n\
ci: used for changes in the CI configuration files.\n\
revert: indicates a git revert was made to the repo." |
		gum filter --indicator=">"
)
choose=$(echo "$choose" | cut -d ':' -f 1)

scope=$(gum input --placeholder "scope")
test -n "$scope" && scope="($scope)"

/usr/bin/git --git-dir="$HOME"/.dotfiles --work-tree="$HOME" \
	commit -m "$choose$scope: " -e
