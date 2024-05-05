# git add --patch

- `git add --path` - select each changed hunk in a file for commiting
- `y` - Yes, add this hunk
- `n` - No, don’t add this hunk
- `d` - No, don’t add this hunk and all other remaining hunks. Useful if you’ve
already added what you want to, and want to skip over the rest
- `s` - Split the hunk into smaller hunks. This only works if there is unchanged
lines between the changes in the displayed hunk, so this wouldn’t have any
effect in the example above
- `e` - Manually edit the hunk. This is probably the most powerful option. As
promised, it will open the hunk in a text editor and you can edit it to your
hearts content

# git bisect

https://www.youtube.com/watch?v=capyZ2D9Yz0

This is used to find a bug (for example) in a repo. Start with `git bisect start`
and give a range of commits where the bug is somewhere in the middle. Then start
telling git which commits are *good* and which ones are *bad*. Everytime you run
`git bisect good` or `git bisect bad`, git will use the binary search algorithm
to jump to the next commit. If you keep going throw this process, at some point
git will find the commit which introduces the bug.

Down below you can see a somewhat example on how the process should look like.

```
git bisect start
git bisect bad <current_commit>
git bisect good <first_commit>

git bisect good
git bisect bad
git bisect good
```

# stash

- `git stash` - save current state of the repo for further work without
committing any change
- `git stash list` - lists everything there is in the stash stack
- `git stash pop` - apply last stash to the repo
- `git stash apply <number>` - apply chosen stash
- `git stash drop <stash_id>` - delete a specific stash
- `git stash clear` - delete all stash

# reset

- `git reset --hard HEAD` - going back to HEAD
- `git reset --hard HEAD^` - going back to the commit before HEAD
- `git reset --hard HEAD~1` - equivalent to "^"
- `git reset --hard HEAD~2` - going back two commits before HEAD

# revert

- `git revert <commit_hash>` - revert commit by using the hash as reference
- `git revert HEAD` - revert commit in HEAD

# clean

- `git clean -n` - show untracked files that `git clean` will remove
- `git clean -df` - remove untracked files recursivly
- `git clean -fX` - remove ignored files

# log

- `git log <filename>` - show the history of commits of the file
- `git log -p <filename>` - same as above but also show the changes from each
commit
- `git log branch1..branch2` - show the difference between branch2 and branch1.
this will show only the commits, not the difference in files. when using to
review PR, you can put branch1='branch on the left' and branch2='branch on the
right' of the GitHub PR interface.

# GitK

- `gitk --follow <filename>` - open the GitK interface with the history of the
file

# ls-files

- `git ls-files . --exclude-standard --others` - list untracked files
- `git ls-files . --modified` - list not staged files

# fetch

- `git fetch -a` - get changes from all branches from the remote but does not
merge automatically
- `git fetch -p` - update branches on local repo. remove the ones that not exist
anymore in the remote

# merge

- `git merge --allow-unrelated-histories` - The default behavior has changed
since Git 2.9. https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories-on-rebase

# push

- `git push -u origin HEAD` - push local branch and link it with the remote
- `git push --set-upstream origin <branch_name>` - link branch with the remote
- `git push origin --delete <branch>` - delete remote branch
- `git branch -d -r origin/<branch>` - remove tracking to remote branch that was
already removed

# cherry-pick

Go to the branch you want to receive the commit.

- `git cherry-pick <hash>` - cherry-pick and add a commit for the change
- `git cherry-pick <hash> -x` - cherry-pick and add a reference to the original
commit
- `git cherry-pick <hash> -n` - cherry-pick and do not commit straight away

# worktree

- `git worktree add <path>` - add new worktree inside the directory `<path>`.
This will automatically checkout to the master branch
- `git worktree add <path> <branch>` - same as above but choosing the branch
- `git worktree list` - lists all active worktrees
- `git worktree remove` - delete a specific worktree
- `git worktree prune` - delete from git list the worktrees that do not exist
anymore. This is useful when the path was removed but the worktree was not
removed from the git repository

# checkout

- `git checkout origin/<branch_name> <filename>` - revert file to the state in
`<branch_name>`

# diff

- `git diff --name-only <branch_name>` - show only the name of the files
modified compared to the `<branch_name>`. you can replace `<branch_name>` by
other target like `HEAD~3` or something like that
- `git diff-tree --no-commit-id --name-only -r <commit_hash>` - show only the
files of a specific commit
- `git show --pretty="" --name-only <commit_hash>` - [same as above] show only
the files of a specific commit
  - The `--no-commit-id` suppresses the commit ID output.
  - The `--pretty` argument specifies an empty format string to avoid the cruft
  at the beginning.
  - The `--name-only` argument shows only the file names that were affected
  (Thanks Hank). Use `--name-status` instead, if you want to see what happened
  to each file (Deleted, Modified, Added)
  - The `-r` argument is to recurse into sub-trees

# clone

- `git clone <repo_url>` - clone repository
- `git clone --recurse-submodules <repo_url>` - clone and automatically
initialize and update each sumodule in the repository, including nested ones,
if any
- `git clone <repo_url> --no-checkout` - clone only the repo history

# submodules

- `git clone --recursive <repo_url>` - clone repo with submodules
- `git submodule update --init --recursive` - initialize submodules if you have
already cloned the repo. the `recursive` flag is used if there are nested
submodules
- `git submodule update --init --recursive --jobs 8` - can create up to 8
jobs to download the submodules
- `git submodule foreach --recursive '<command>'` - run shell command in each
submodule including nested submodules
- More about submodules
  - https://www.vogella.com/tutorials/GitSubmodules/article.html#:~:text=2.3.-,Pulling%20with%20submodules,in%20the%20git%20pull%20command%20.

# tag

- `git tag <name_tag>` - this create a lightweight tag

# sparse (We are not going to use this functionality anymore)

- `git sparse-checkout init --cone` - initialize sparse
- `git sparse-checkout set <folder_name>/` - download only the folder specified.
The `/` is mandatory for getting also all the content inside the folder.

WARNING: Using a sparse index requires modifying the index in a way that is not
completely understood by external tools. If you have trouble with this
compatibility, then run git sparse-checkout init --no-sparse-index to rewrite
your index to not be sparse. Older versions of Git will not understand the
sparse directory entries index extension and may fail to interact with your
repository until it is disabled.

# others

- `git commit --no-verify` - ignore git hooks
- `git show <hash>` - show commit according to the hash
- `git gc` - runs a number of housekeeping tasks within the current repository
- `git fetch -p` - remove tracking branches no longer on remote
- `git for-each-ref` - list all branches (heads, origin, tags)

# configuration

- `git config --global core.longpaths true` - avoid future problems with files
that have a long path
- `git config --global feature.manyFiles true` - makes `git status` command run
faster. It may also increase performance of other commands.
- `sed -i 's/worktreeConfig = true/ /g' .git/config` - command to delete
`worktreeConfig = true` from the config file. Workaround for enabling some
functionalities for TortoiseGit (do not know which ones).
- `git config --global init.defaultBranch main` -

