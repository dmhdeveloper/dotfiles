# Disable fish shell greeting
set fish_greeting

# Environment specific config that you do not want exposed on gitlab
source ~/.environmentrc

for file in ~/dotfiles/fish/custom/*.fish;
  source $file;
end
