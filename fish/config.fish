# Environment specific config that you do not want exposed on gitlab
source ~/.environmentrc

# Shell prompt
function fish_prompt
  # Directory
  set_color -o white; echo -n "["
  if test "$PWD" != "$HOME"
    set_color 00D7FF; echo -n (basename $PWD)
  else
    set_color 00D7FF; echo -n "~"
  end

 	# Git
 	if test -e .git
 	  set_color -o white; echo -n ", "
    set BRANCH (git rev-parse --abbrev-ref HEAD)
 	  set_color ff8700; echo -n $BRANCH
	  set STATUS (git status --short)

    if test -n "$STATUS"
 	    set_color white; echo -n ", "
 	    set_color red; echo -n " "
 	  end
 	end

  # Sudo
	set CAN_I_RUN_SUDO (sudo -n uptime 2>&1|grep "load"|wc -l)
	if test $CAN_I_RUN_SUDO -eq 1
	  set_color white; echo -n ", "
	  set_color red; echo -n " "
	end
  set_color -o white; echo -n "]: " 

end

# Terminal colours
switch (uname)
case Darwin
  set -x LSCOLORS "gxGxFxFacxegedabagacad"
case Linux
  set -x LS_COLORS "rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37:mi=01;05;37;41:su=37:sg=30;43:ca=30:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
end


function lg
  set -x LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
  lazygit $argv
  if test -e $LAZYGIT_NEW_DIR_FILE
    cd (cat $LAZYGIT_NEW_DIR_FILE)
    rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  end
end

function ide
  set PWD `pwd`
  tmux splitw -p 35
  cd $PWD
  tmux splitw -h
  cd $PWD
  tmux selectp -U
  vim
end

function ls
  switch (uname)
  case Darwin
		command ls -G $argv
  case Linux
		command ls --color $argv
  end
end

function la
  command ls -a $argv
end

function ll
  command ls -l $argv
end

function lla
  command ls -la $argv
end

function docker
  command sudo docker $argv
end
