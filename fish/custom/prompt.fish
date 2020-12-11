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
