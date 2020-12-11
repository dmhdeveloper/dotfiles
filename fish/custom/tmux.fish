function ide
  set PWD `pwd`
  tmux splitw -p 35
  cd $PWD
  tmux splitw -h
  cd $PWD
  tmux selectp -U
  vim
end
