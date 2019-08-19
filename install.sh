# Link ~/.vimrc and other files to ~/dots/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/dots/.zshrc ~/.zshrc
ln -s ~/dots/.vimrc ~/.config/nvim/init.vim
ln -s ~/dots/.tmux.conf ~/.tmux.conf
ln -s ~/dots/.tmuxinator ~/.tmuxinator

# Install and set up libraries such as nerd fonts, base16-shell, etc.
