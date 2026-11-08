# Guiding principles: calledtoconstruct/devbuntu

## Purpose and scope
Shell scripts that build a custom Ubuntu live image (with Cubic) and set up a development environment: toolchains, Kubernetes, service mesh and related tools.

## Stack and layout
Bash scripts at the root: `dev-iso.sh` (run inside the Cubic chroot), `setup.sh`, `linkerd.sh`, `mongodb.sh`, `remote.sh`, `repos.sh`, `move-home.sh`, `rotate-docked.sh`, `atomist.sh`, plus `aliases`, `daemon.json`, `Xwrapper.config`. Older material is in `original/`.

## Commands
| Check | Command | Evidence |
|---|---|---|
| Setup / use | Follow README: clone, `chmod +x ./devbuntu/*.sh`, `./devbuntu/dev-iso.sh` inside Cubic | README.md |
| Build | Not applicable | - |
| Lint | None configured; `bash -n <script>` is a safe syntax check that runs nothing | - |
| Tests | None | repository tree |
| CI | None (only `.github/FUNDING.yml`) | repository tree |

Commands marked as not written down come from the build files, not from project docs; confirm them before relying on them.

## Before every push
Before every push: run the build and type-check/lint that exist here, plus only the tests for the files or feature you changed (team rule, ideas #14 note 6797). Do not run the full suite locally as a routine gate; this repository has no CI that runs the full suite, so run the full suite only when the change is broad, and say in the PR that CI coverage is missing. Merge needs a positive review. Explain any new failure your change caused. Never weaken a valid test to make it pass, and never invent a command this file does not list.

## Project rules
- These scripts install packages and change system configuration. Never run them on a development host to 'test' a change; only read, syntax-check, or run them in a throwaway live session or VM.
- Keep scripts for Debian/Ubuntu; do not mix in other distributions' package managers.
- One script per concern, as the root layout shows.

## What to avoid
- Committing to the default branch; work on a branch and open a pull request.
- Deleting files, branches or history, or changing repository settings.
- Adding tooling, CI or dependencies that the change does not need.
- Rules copied from other projects (file-size limits, clocks, quotas) that this repository never adopted.

## Delivery and safety
- Output is a live ISO built by the user with Cubic; nothing is published automatically.

## Open questions
- No tests or CI; which Ubuntu release the scripts currently target is not stated.

## Sources
Read from the `master` branch on 2026-11-08 ET: `README.md`, repository tree.

## Instruction updates
Check `guiding-principles.version` at the start of each turn and when you enter this project; reload this file when the version changes. Change this file, its version and date, and `PRINCIPLES_HISTORY.md` in the same commit. Team-wide role instructions are versioned separately in the team-process repository.
