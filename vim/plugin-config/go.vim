let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet','golint']
let g:go_auto_type_info = 1
let g:go_list_type = 'quickfix'

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Set go guru scope to root of project and ignore vendor directory
functio! s:go_guru_scope_from_git_root()
	let gitroot = system("git rev-parse --show-toplevel | tr -d '\n'")
	let pattern = escape(go#util#gopath() . "/src/", '\ /')
	return substitute(gitroot, pattern, "", "") . "/... -vendor/"
endfunction

au FileType go silent exe "GoGuruScope " . s:go_guru_scope_from_git_root()