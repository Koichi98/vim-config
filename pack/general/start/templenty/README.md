templenty.vim
=============

This plugin gives you managemet of templates for Vim. It makes it easy to use, customize, and reload templates.

![Semantic description of image](/doc/demo.gif "Demo")

Quick Start
-----------

In Vim 8 or NeoVim, you can use the built-in package manager without installing extra one.

    " Plugin Location
    cd $HOME/.vim/foo/start/templenty

    " Clone this repo
    git clone https://gitlab.com/tatsuya_rf46/templenty.vim.git

The name "foo" is arbitrary. Details in `:help package`.  
Once you add this plugin, the default templates (in templenty/default-templates dir) will be automatically read when you create a new buffer, depending on its filetype.  
If you want to customize it, issue the following command.

    :TemplentyEdit

Edit and close the opened template file. Then you can reload it in your writing file.

    :TemplentyLoad

Templates Location
------------------

When you first issue `:TemplentyEdit` and save the file, a new directory is created (default: $HOME/.vim/templenty) which has priority to the old one (templenty/default-templates).  
It is possible to change the location where customized templates are stored by setting the variable in your ~/.vimrc file.

    let g:templenty_custom_dir = path/you/would/like
