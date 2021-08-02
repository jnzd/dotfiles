<<<<<<< HEAD
ln -s -f ~/dotfiles/.config/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s -f ~/dotfiles/.config/vimrc ~/.config/nvim/init.vim
ls ~/.i3 && ln -s -f ~/dotfiles/.config/i3config ~/.i3/config
=======
#!/bin/bash

# next line from: https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# link vimrc to home directory
ln -sf $SCRIPT_DIR/.config/vimrc ~/.vimrc 

if ! [ -d "~/.config/nvim" ]; then
	mkdir -p ~/.config/nvim
fi

ln -sf $SCRIPT_DIR/.config/vimrc ~/.config/nvim/init.vim

test -f ~/.i3/config && { 
	rm ~/.i3/config; 
	ln -sf $SCRIP_DIR/.config/i3config ~/.i3/config 
}
>>>>>>> 2283b006f506b01f88ff49a673de69aea50d359e
