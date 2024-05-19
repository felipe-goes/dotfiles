# Can Git ignore just one line?

Git does not have built-in support for ignoring individual lines within a file.
Git's `.gitignore` file is used to specify patterns for files or directories to
be ignored by Git, rather than specific lines of content within a file.

If you need to ignore a specific line within a file, you have a few options:

1. **Manually Manage Changes**: You can manually avoid staging or committing
   the specific line you want to ignore. This requires discipline to review and
   manage changes on a line-by-line basis.

2. **Use Git Attributes**: Git has a feature called "smudge" and "clean"
   filters that can process files on checkout and commit. While these can be used
   to modify the content of files, it is a complex and uncommon solution.

3. **Use a Separate Configuration File**: Depending on your use case, you might
   consider storing the line you want to ignore in a separate configuration file.
   This configuration file can then be ignored in Git by adding it to your
   `.gitignore`.

Remember that ignoring individual lines can lead to complications when
collaborating with others or maintaining a project. It's generally better
practice to manage your codebase in a way that doesn't require ignoring
specific lines.

# How to migrate a repo

Clone the repo to your machine. We will bare clone with `git clone --bare repo_to_be_copied`
to only get the history, if you already have it cloned, cd into it. Then go to
the directory of the repo you just cloned using the `--bare` option and run the
command `git push --mirror new_copied_repo`.

# How to commit with a placeholder?

You can open the commit editor with a pre-filled message by using the `-m` flag
for `git commit` or by creating a commit message file. Here are two
straightforward methods to achieve this:

## Method 1: Using the `-m` Flag

When you commit changes, you can supply the commit message directly using the
`-m` flag. However, if you want to open the editor with a specific text
pre-filled, you can use the `-e` flag along with `-m`. For example:

```
git commit -m "Initial placeholder message" -e
```

This command will open your default text editor with the message "Initial
placeholder message" already filled in, allowing you to edit it further.

## Method 2: Using a File for the Commit Message

1. Create a temporary file with the message:

Create a file (e.g., `commit_message.tmp`) and write your placeholder message
in it.

```
echo "Initial placeholder message" > commit_message.tmp
```

2. Open the commit editor with the file:

Use the `-t` flag with `git commit` to open the editor with the content of the
file.

```
git commit -t commit_message.tmp
```

This command will open your default editor with the contents of
`commit_message.tmp`.

## Example for Method 2:

1. Create a file with a placeholder message:

```
echo "Initial placeholder message" > /tmp/commit_message.txt
```

2. Use the file to pre-fill the commit message in the editor:

```
git commit -t /tmp/commit_message.txt
```

This opens your editor with the contents of `/tmp/commit_message.txt`, allowing
you to modify the message before committing.

## Setting Up a Template for Commit Messages

You can also set up a commit message template that will be used for all your
commits. To do this, follow these steps:

1. Create a template file with your placeholder message:

```
echo "Initial placeholder message" > ~/.gitmessage.txt
```

2. Configure git to use this template file:

```
git config --global commit.template ~/.gitmessage.txt
```

Now, whenever you run `git commit` without the `-m` flag, the editor will be
opened with the contents of `~/.gitmessage.txt` pre-filled.

By using one of these methods, you can easily open your commit editor with a
specific placeholder text.

# commitlint

https://github.com/conventional-changelog/commitlint

To use the repo, you need both `NodeJS` and `yarn` installed. There already some
configuration already available in the repository. In order to import the
conventional commit pattern, run the following command in the root directory of
the project: `yarn add -D @commitlint/cli @commitlint/config-conventional`.

After that, create a file in the root directory of the project called
`commitlint.config.js` and put the following inside of it:

```
module.exports = {
    extends: [
        "@commitlint/config-conventional"
    ],
}
```

Now you can pipe the commit text to the commitlint script and it will give you
the log.

# [Translated from - Conventional Commits Pattern](https://medium.com/linkapi-solutions/conventional-commits-pattern-3778d1a1e657)

The rules are very simple. Like it is shown below, we have the commit _type_,
the _scope_ of the commit which tells the context of it and the _subject_ of the
commit.

```
!type(?scope): !subject
<?body>
<?footer>
```

This way, `!` indicates which attributes are mandatory and `?` the ones that are
optional. We are not getting into details regarding `body` and `footer` but you
can check that [in this link](https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4/#especifica%C3%A7%C3%A3o).

Which are the commit types?

The type is responsible to tell which kind of change or iteration is being done.
These are the rules of convention we have:

- `test:` indicates any type of creation or update on the tests.

**Example:** New unit tests

- `feat:` indicates the development of a new feature to the project.

**Example:** Add new service, functionality, endpoint, etc.

- `refactor:` used when there is a refactoring on the code that has no impact
  in the logic or in the business rules of the system.

**Example:** Code changes after core review

- `style:` used when there are formatting and style changes to the code that
  does not change the system behavior whatsoever.
  não alteram o sistema de nenhuma forma.

**Example:** Style guide change, changed the linter, fix identations, remove
trailing whitespaces, remove comments, etc.

- `fix:` used when there is a fix that were causing issues to the system.

**Example:** Update function which was not behaving properly or update the code
that was not building.

- `chore:` indicates a change in the project that does not affect the system or
  the test files. These are changes in the project organization.

**Example:** Update linting rules, add a linter, add more extension files to the
.gitignore

- `docs:` used when there are documentation changes to the project.

**Example:** add new api documentation, update README, etc.

- `build:` used to indicate changes that affect the build process of the of the
  project or external dependencies.

**Example:** Gulp, add/remove npm/pip dependencies, etc.

- `perf:` indicate change that unhanced the system performance.

**Example:** update ForEach for while, update bank query, etc.

- `ci:` used for changes in the CI configuration files.

**Example:** Circle, Travies, BrowserStack, etc.

- `revert:` indicates a git revert was made to the repo.

Summarize:

- Only one _type_ is allowed per commit;
- The _type_ is **mandatory**;
- If you are not sure about which _type_ to choose, probably it means that you
  are making a big change that could be separeted in 2 or more commits;
- The difference between `build` and `chore` can be a little tricky and lead to
  confusion. This is why we need to pay attention about the correct type. Using
  Noje.js as an example, we can think that when there is an update/addition of
  a development dependency present in `devDependencies`, we use `chore`. In other
  hand, for update/addition of dependencies that are common to the project, and
  there is a real and direct impact to the system, we use `build`.
