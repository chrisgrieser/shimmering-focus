> [!WARNING]
> Don't save `.css` files at this level.

## Explanation
- On `bash`, `**` globbing works the same as `*`, thus `./source/**/*.css` only
  matches two levels deep (as opposed to any level deep in `zsh`).
- This can be changed via `shopt -s globstar`, however, `globstar` is only
  available with version 4 of `bash`, and macOS ships with version 3.2 (as of
  2024-11-19).
- GitHub actions, used for building remotely, however, [do not support `zsh` as
  option for the shell, and default to
  bash](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#jobsjob_iddefaultsrunshell).
- Thus, for `./source/**/*.css` to behave consistently on `zsh` (local macOS)
  and on `bash` (used by GitHub Actions), we save all `.css` files **exactly two
  levels deep**.
