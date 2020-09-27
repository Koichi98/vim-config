function templenty#Edit(filetype)
    let l:template_dir = Get_template_dirs()[0]
    " Make the directory containing templates, if not exist.
    if !isdirectory(l:template_dir)
        call mkdir(l:template_dir, "p")
    endif
    let l:template_path = l:template_dir . "/" . a:filetype . ".template"
    let l:mode = "e"
    if exists("g:templenty_edit_mode")
        if g:templenty_edit_mode ==# "vertical"
            let l:mode = "vs"
        elseif g:templenty_edit_mode ==# "horizontal"
            let l:mode = "sp"
        elseif g:templenty_edit_mode ==# "edit"
            let l:mode = "e"
        endif
    endif
    " Open the buffer
    execute l:mode . " " . l:template_path
    " Read the template which already exists
    call LoadTemplate(a:filetype)
endfunction
