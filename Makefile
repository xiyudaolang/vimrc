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
	ln -s ./vimrc ~/.vimrc
	ln -s ./vimrc.plug ~/.vimrc.plug
	mkdir -p ~/.vim/autoload
	ln -s ./colors ~/.vim/colors
	ln -s ./ycm-plugin ~/.vim/ycm-plugin
	vim -c ':PlugInstall'
