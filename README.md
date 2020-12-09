# dotfiles

## Pre-requisites

- [Java][1]
- [Go][2]
- [Node][3]
- [Yarn][4]
- [Maven][5]
- [Gradle][6]
- [Vim][7]
- [Fish][9]
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

Execute the command below to source the config in this project.

```bash
echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc
```

[Vim Plug][8] uses commands to build certain language server binaries which is why it is
important that you install Java, Go, Node, Yarn, Maven and Gradle before attempting to
execute `:PlugInstall`

Execute the command below to source the config in this project.

### Fish

Fish is the chosen shell for this setup.
To install, navigate to your current OS/Distribution [here][9].

Execute the command below to source the config in this project.

```bash
echo "source ~/dotfiles/fish/config.fish" > ~/.config/fish/config.fish`
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
[9]: https://fishshell.com/
[10]: https://github.com/tmux/tmux/wiki
