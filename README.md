#Usage

## How to use this repository

1. cd $HOME
2. git clone *repository* .vim
3. cd .vim
4. git submodule init
5. git submodule update

P.S. Help-tags will be generated when first opening vim, then some submodules will be dirty.
    So you should create a global gitignore https://help.github.com/articles/ignoring-files/#create-a-global-gitignore

## Working with Git submodules

1. To add a new submodule run from the top level directory:

    git submodule add *repository* bundle/*plugin*

2. To pull a submodule repository run from the top level directory:

    git submodule init
    
    git submodule update
    
3. To remove a submodule;
    
    delete entry in .gitmodule
    
    delete entry in .git/modules/bundle/xxx

    rm -rf bundle/xxx
    
    gca

