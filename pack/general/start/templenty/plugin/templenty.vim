"
" Templates Manager for Vim
"

" ----------- Variables -----------{{{1
if exists("g:templenty_plugin_loaded")
    finish
endif
let g:templenty_plugin_loaded = 1

if !exists("g:templenty_autoload")
    let g:templenty_autoload = 1
endif

" Default Directories of templates 
" 1) $HOME/.vim/templenty
" 2) plugin_path/default_templates
let s:template_default_dirs = [$HOME . "/.vim/templenty", expand('<sfile>:h') . "/../default_templates"]

if !exists("g:template_custom_dir")
endif

if !exists("g:templenty_edit_mode")
    let g:templenty_edit_mode = "vertical"
endif

" ----------- Functions -----------{{{1
" Get template directories including the customed directory, if exists.
function Get_template_dirs()
    if !exists("g:template_custom_dir")
        return s:template_default_dirs
    else
        return [g:template_custom_dir] + s:template_default_dirs
    endif
endfunction

function s:ReadTemplate(template_path)
    " Clear the buffer
    execute "%delete"
    " Read the template
    execute "0r " . a:template_path
    " Delete the last blank line left by reading templates
    normal! Gdd
    " Put the cursor
    normal! gg
endfunction

function LoadTemplate(filetype)
    let l:template_dirs = Get_template_dirs()
    for l:template_dir in l:template_dirs
        " The template path
        let l:template_path = l:template_dir . "/" . a:filetype . ".template"
        if filereadable(l:template_path)
            call <SID>ReadTemplate(l:template_path)
            break
        endif
    endfor
endfunction

" ----------- Commands ------------{{{1
command TemplentyEdit call templenty#Edit(&filetype)
command TemplentyLoad call LoadTemplate(&filetype)

" ----------- Autocommands --------{{{1
if g:templenty_autoload
    augroup Autoloading
        autocmd!
        autocmd BufNewFile * call LoadTemplate(&filetype)
    augroup END
endif
