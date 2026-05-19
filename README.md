# Dotfiles

These are my system configurations, scripts, and preferences, managed with [chezmoi](https://www.chezmoi.io/).

## Structure

- `dot_config/`: Configurations that map to `~/.config/` (e.g., Neovim, Alacritty, Starship).
- `dot_zshrc` / `dot_bashrc`: Shell configuration files.
- `run_onchange_before_install-packages.sh`: Scripts that execute automatically to install necessary system packages, programming languages, and CLI tools.
- `run_once_install-tools.sh`: Scripts that run exactly once during the first initialization.
- `.chezmoi.toml.tmpl`: The configuration template for `chezmoi` itself, often used to prompt for machine-specific variables (like email, name, or system type).

## Secrets Management

- To configure later on.
