# dotfiles

## Pre-requisites

- [Java][1]
- [Go][2]
- [Node][3]
- [Yarn][4]
- [Maven][5]
- [Gradle][6]
- [Vim][7]
- [ZSH][9]
- [Tmux][10]

## Install

You need a configuration file in your home directory called `~/.environmentrc`.
This is where you can put environment settings you don't want public.

### Fonts

This setup uses icons from NerdFonts, you can choose whichever one you want but remember
to update the font in ~/dotfiles/vim/.vimrc and the terminal app you are using.

_NOTE_: A restart may be required.

### Vim

The chosen package manager for vim is [Vim Plug][8]. You must install this manually first.
Follow the instructions on the `README.md` of the [Vim Plug][8] repo.

[Vim Plug][8] uses commands to build certain language server binaries which is why it installed
important that you install Java, Go, Node, Yarn, Maven and Gradle before attempting to
execute `:PlugInstall`

### ZSH

ZSH is the chosen shell for this setup.
A few plugins are installed by adding submodules to this repo and then
referencing those plugins.
So to enable those plugins:

```bash
# In the dotfiles directory
git submodule init

git submodule update
```

### Tmux

Tmux only has a very lightweight setup, it only takes advantage of some default apps
in scripts so there shouldn't be any changes or dependencies required.

[1]: https://jdk.java.net/java-se-ri/11
[2]: https://golang.org/
[3]: https://nodejs.org/en/
[4]: https://yarnpkg.com/
[5]: https://maven.apache.org/
[6]: https://gradle.org/
[7]: https://www.vim.org/
[8]: https://github.com/junegunn/vim-plug
[9]: https://www.zsh.org/
[10]: https://github.com/tmux/tmux/wiki
