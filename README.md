# Dotfiles

This repository holds my personal configuration files for the majority of applications that I use along with setup scripts
that automatically install the configurations with a a single command on Windows (Git Bash) and Unix environments.

## Included configurations

| Application        | Description                                                                                                     |
| ------------------ | --------------------------------------------------------------------------------------------------------------- |
| `NeoVim`           | A highly configurable text editor that enhances Vim with extensibility features and improved user experience    |
| `Bash`             | The standard Unix shell and command language interpreter                                                        |
| `tig`              | A TUI for Git that acts as a repository browser                                                                 |
| `zellij`           | An extensible terminal multiplexer featuring session management, panes, tabs, and layouts                       |
| `Windows Terminal` | Microsoft's terminal application                                                                                |
| `vscode-neovim`    | VS Code extension that integrates Neovim's editing capabilities into Visual Studio Code                         |
| `IdeaVim`          | Plugin for JetBrains IDEs that emulates Vim keybindings and functionality within their development environments |

## Setup

The setup scripts set up symlinks for the configuration files to the appropriate locations where applications look for them.
Which files to symlink where is defined in the maps at the top of the setup scripts.  
After successful installtion, changes to the configuration files (which can be opened through the symlinks as well)
are reflected in the original files in the git repository. By pushing the changes to this GitHub repository, they
can be made available to other machines by executing a simple `git pull`.  
The setup requires no external dependencies.

### Linux/Mac

Run `setup.sh` as a regular user.

### Windows

Run `setup_win_git_bash.sh` as administrator and enter your user name in the prompt. Windows
requires admin privileges to setup symlinks.
