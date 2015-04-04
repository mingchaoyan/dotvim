How to use this repository
==========
1. cd $HOME
2. git clone *repository* .vim
3. cd .vim
4. git submodule init
5. git submodule update

P.S. Help-tags will be generated when first open vim, then submodule will be dirty.
    So you should go to the submodule directory, do a "git add" + "git commit" to get all content tracked within the            submodule one by one. At last, do a "git commit" at the top dicretory(.vim/)
Working with Git submodules
=============
1. To add a new submodule run from the top level directory:

    git submodule add *repository* bundle/*plugin*

2. To pull a submodule repository run from the top level directory:

    git submodule init
    
    git submodule update
