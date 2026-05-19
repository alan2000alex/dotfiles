# Dotfiles

These are my system configurations, scripts, and preferences, managed seamlessly using [chezmoi](https://www.chezmoi.io/).

You can bootstrap a new machine with a single command. This will install `chezmoi`, initialize the repository, and apply the configurations.

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply alan2000alex

```

## Structure

- `dot_config/`: Configurations that map to `~/.config/` (e.g., Neovim, Alacritty, Starship).
- `dot_zshrc` / `dot_bashrc`: Shell configuration files.
- `run_onchange_before_install-packages.sh`: Scripts that execute automatically to install necessary system packages, programming languages, and CLI tools.
- `run_once_install-tools.sh`: Scripts that run exactly once during the first initialization.
- `.chezmoi.toml.tmpl`: The configuration template for `chezmoi` itself, often used to prompt for machine-specific variables (like email, name, or system type).

## Secrets Management

- To configure later on.
