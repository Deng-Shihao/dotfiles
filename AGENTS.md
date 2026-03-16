# AGENTS.md

Guidance for autonomous coding agents working in this repository.

## Repository Scope

- This repo is a personal `~/.config` dotfiles repository.
- The primary programmable code is Neovim Lua config under `nvim/`.
- Other tracked config areas include `bash/`, `zsh/`, `tmux/`, `ghostty/`, `karabiner/`, and `yazi/`.
- There is no monolithic application build system (no `package.json`, `pyproject.toml`, `go.mod`, etc. at repo root).

## Rule Files (Cursor / Copilot)

- Checked locations: `.cursor/rules/`, `.cursorrules`, `.github/copilot-instructions.md`.
- Current status: none of these files exist in this repository.
- If any are added later, treat them as higher-priority constraints and update this document.

## Key Paths

- Neovim entrypoint: `nvim/init.lua`
- Neovim options/keymaps/autocmds: `nvim/lua/config/`
- Neovim plugins (lazy specs): `nvim/lua/plugins/`
- Neovim utility modules: `nvim/lua/utils/`, `nvim/lua/globals.lua`, `nvim/lua/icons.lua`
- LSP server configs: `nvim/lsp/*.lua`
- Lua formatter config: `nvim/.stylua.toml`
- Shell config: `bash/.bashrc`, `bash/.bash_aliases`, `zsh/.zshrc`, `zsh/.zsh_aliases`
- Tmux config: `tmux/tmux.conf`, `tmux/tmux.reset.conf`

## Environment Assumptions

- Commands in this file assume repository root: `/Users/dsh/.config`.
- Neovim config in this repo maps to the active user config (`~/.config/nvim`).
- Some checks depend on external tools being installed (`stylua`, `shellcheck`, `nvim`, etc.).

## Build / Sync / Validation Commands

There is no single "build" command. Use targeted validation per subsystem.

### Neovim config validation

- Start and quit headless (basic smoke test): `nvim --headless '+qa'`
- Load config and sync plugins (network + plugin state change): `nvim --headless '+Lazy! sync' '+qa'`
- Update Treesitter parsers: `nvim --headless '+TSUpdateSync' '+qa'`

### Lua formatting/linting

- Format all Neovim Lua files: `stylua nvim`
- Check formatting without changing files: `stylua --check nvim`
- Format a single Lua file: `stylua nvim/lua/plugins/flash.lua`

### Shell validation

- Syntax-check Bash config: `bash -n bash/.bashrc`
- Syntax-check Zsh config: `zsh -n zsh/.zshrc`
- Lint shell files (if `shellcheck` is installed): `shellcheck bash/.bashrc bash/.bash_aliases zsh/.zshrc zsh/.zsh_aliases`
- Lint a single shell file: `shellcheck zsh/.zshrc`

### Tmux config validation

- Parse tmux config in isolated server: `tmux -L agents -f tmux/tmux.conf start-server \; source-file tmux/tmux.conf \; kill-server`

## Test Commands

- Current state: no tracked automated test suite (no `tests/` and no tracked `*test*` files).
- Use smoke/lint checks above as the default verification strategy.

### Single-test guidance (important)

Because there is no formal test runner yet, use one of these "single test" equivalents:

- Single-file Lua parse/execute check in Neovim: `nvim --headless '+luafile nvim/lua/utils/init.lua' '+qa'`
- Single-file format check: `stylua --check nvim/lua/utils/init.lua`
- Single-file shell syntax/lint check: `bash -n bash/.bashrc` or `shellcheck zsh/.zshrc`

If you introduce a real Lua test harness (for example `plenary` + `busted`), add concrete single-test commands here.

## Code Style Guidelines

Follow existing patterns exactly unless explicitly asked to refactor style.

### Lua formatting (authoritative)

- Formatter: Stylua with `nvim/.stylua.toml` (`indent_type=Spaces`, `indent_width=2`, `column_width=160`, `quote_style=AutoPreferSingle`, `call_parentheses=None`).
- Use trailing commas in multiline tables.
- Keep table fields one per line when table is non-trivial.

### Lua imports and module structure

- Prefer `require 'module.path'` style (without parentheses) for simple requires.
- At top of file, alias frequently used modules/functions (for example `local map = vim.keymap.set`).
- For module files, use `local M = {}`, define functions on `M`, and `return M` at end.
- Plugin spec files under `nvim/lua/plugins/` typically `return { ... }` directly.

### Types and annotations

- Use EmmyLua/LuaLS annotations where helpful: `---@param`, `---@return`, `---@type`.
- Add type annotations for public helpers and non-obvious function contracts.
- Keep annotations concise and consistent with existing LuaLS usage.

### Naming conventions

- File names: snake_case for Lua modules (except externally-defined names when required).
- Local variables/functions: `snake_case`.
- Module tables: `M`.
- User-visible command names and component keys can use PascalCase or mixed case when matching Neovim/plugin conventions.
- Keep naming aligned with neighboring code over theoretical purity.

### Error handling and robustness

- Prefer early returns for nil/empty guard cases.
- Use `pcall(require, 'module')` when dependencies are optional at runtime.
- Use `assert(...)` for programmer errors / required invariants.
- Use `error(...)` only for unrecoverable startup failures (example: lazy.nvim clone failure).
- For external command calls (`vim.system`), check exit code and handle stderr.

### Neovim API usage

- Prefer modern Neovim Lua APIs already used in repo: `vim.api.nvim_*`, `vim.lsp.*`, `vim.system(...)`.
- Respect existing keymap style: descriptive `desc`, mode-aware mappings, local aliasing.
- Keep autocommands in explicit augroups.

### Shell config style

- Quote variable expansions unless intentional word-splitting is required.
- Prefer `[[ ... ]]` tests in Zsh/Bash where applicable.
- Keep aliases and exports grouped logically.
- Run syntax checks (`bash -n`, `zsh -n`) after edits.

### Comments and documentation

- Keep comments short and practical.
- Explain "why" for non-obvious behavior.
- Avoid redundant comments that restate obvious code.

## Change Management Expectations for Agents

- Make focused, minimal diffs; do not reformat unrelated files.
- Do not edit ignored/vendor-like paths (for example `tmux/plugins/`, `opencode/`, `mole/`) unless explicitly requested.
- Preserve existing behavior and keybindings unless a task asks for behavior changes.
- When adding tools, LSPs, or plugins, keep names and options consistent with current lazy.nvim spec style.
- After code edits, run the narrowest relevant checks from this file and report results.
