# polka-dots
Awesome neovim and iterm2 settings


## Installation Instructions
### Install Iterm2
* Install [iterm2](https://www.iterm2.com/)
* `git clone git@github.com:mhartington/oceanic-next-iterm.git`
* Update color scheme to `oceanic-next-iterm` in the profiles section of iterm2

### Install neovim
* `brew tap neovim/neovim`
* `brew install neovim`
* `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### Clone this repo and set it up
* `git clone git@github.com:meiaalsup/polka-dots.git`
* `./new_setup.sh`

### 
* `nvim`
* `:PlugInstall`
* Add `alias vim='nvim'` to bash profile
* `pip3 install --user neovim`

### Add Powerline fonts
* `git clone git@github.com:artofrawr/powerline-fonts.git`
* `./install.sh` (inside powerline)
