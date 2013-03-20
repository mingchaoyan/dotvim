# How to use this repository
* 1 cd $HOME
* 2 git clone *repository* .vim
* 3 cd .vim
* 4 git submodule init
* 5 git submodule update
* 6 ln -s ~/.vim/vimrc ~/.vimrc

# Working with Git submodules
* To add a new submodule run from the top level directory:

    git submodule add *repository* bundle/*plugin*

* To pull a submodule repository run from the top level directory:

    git submodule init
    git submodule update

* To update all the submodule repositories in one shot run from the top
  level directory, commit afterwards:

    git submodule foreach 'git pull'
