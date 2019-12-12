all: prepare
	./install.sh -i
	vim -c ':PlugInstall'

help:
	echo "make install	install pulgin"
	echo "make clean	cleanup .vimrc and plugins"
	echo "make backup	backup .vim directory and .vimrc configs"
	echo "make help 	show help information"

prepare:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

backup:
	mv ~/.vim ~/.vim.bak
	mv ~/.vimrc ~/.vimrc.bak
	mv ~/.vimrc.plug ~/.vimrc.plug.bak
	mv ~/.vimrc.sign ~/.vimrc.sign.bak

clean:
	rm -rf  $HOME/.vim
	rm $HOME/.vimrc
	rm $HOME/.vimrc.plug

install:
	mv vimrc ~/.vimrc
	mv vimrc.plug ~/.vimrc.plug
	mv vimrc.sign ~/.vimrc.sign
	mv colors ~/.vim/colors
	mv ycm-plugin ~/.vim/ycm-plugin
	vim -c ':PlugInstall'
