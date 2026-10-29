# Repository Guidelines

Atlas is a personal knowledge base and environment-setup repository. It stores study notes, algorithm examples, and cross-machine dotfiles and setup scripts.

## Project Structure

- `knowledge/` — Learning materials and code samples.
  - `langs/` — Language notes and examples (e.g., `python/`, `c_cpp/cpp/`).
  - `computer-science/` — Algorithms and data-structure notes under `algorithms/` and `dataStructures/`.
- `system/` — Environment setup and dotfiles.
  - `system/dotfiles/` — Shell, editor, and tool configs (`.zshrc`, `.tmux.conf`, `.gitconfig`, `config/nvim/`).
  - `system/scripts/` — Setup and maintenance scripts with a usage guide in `system/scripts/README.md`.

Source files are standalone samples; images live alongside related notes (e.g., `knowledge/computer-science/dataStructures/arrays/img/`).

## Build, Test, and Development Commands

This repository has no build system. Run scripts from the repository root.

| Command | Purpose |
|---|---|
| `bash system/scripts/setup-env.sh` | Install packages and back up/apply dotfiles |
| `bash system/scripts/restore.sh` | Restore dotfiles from a backup |
| `bash system/scripts/collect-configs.sh` | Capture current machine configs into `system/dotfiles/` |
| `bash system/scripts/generate-inventory.sh` | Regenerate `package-inventory.md` |

Add new setup steps to the existing scripts or create a new script under `system/scripts/` with an accompanying README section.

## Coding Style

- **Shell**: Use `#!/usr/bin/env bash`, `set -euo pipefail`, 4-space indentation, and clear logging output.
- **C++**: Follow the style already present in `knowledge/` samples: concise, well-named identifiers (e.g., `fibonacci.cpp`).
- **Python**: Use `snake_case` for functions and variables; follow PEP 8.
- **Markdown**: Use descriptive headings and keep notes under their topic directory.

## Testing

There is no automated test suite. Manually verify shell scripts on a supported OS (macOS, Linux/WSL) after changes. Keep language samples runnable in isolation (e.g., `python3 knowledge/langs/python/main.py` or `g++` for `.cpp` files).

## Commit & Pull Request Guidelines

Use descriptive, sentence-style commit messages that summarize the change. Reference the area affected where helpful.

```
Add Python notes on decorators
Refactor setup script to use uv
Restore tmux config from backup
```

Keep commits focused on one change area (knowledge, scripts, or dotfiles). PR descriptions should state the purpose, any scripts affected, and testing performed.
