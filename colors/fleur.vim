" Determine the terminal background.
" Initialize a colors dictionary.
let s:active_bg=(&background)
let s:colors = {}

let g:colors_name = "fleur"

" Color definitions.
let s:colors.black       = ['#000000', 000] 
let s:colors.densegrey   = ['#121212', 233]
let s:colors.deepgrey    = ['#1c1c1c', 234]
let s:colors.darkgrey    = ['#262626', 235]
let s:colors.grey        = ['#949494', 246]
let s:colors.skyblue     = ['#87afff', 68]
let s:colors.navy        = ['#00005f', 21]
let s:colors.apache      = ['#ff5f5f', 203]
let s:colors.white       = ['#ffffff', 231]
let s:colors.orchid      = ['#d75fd7', 170]

" Highlighting function
" Cribbed from badwolf, guvbox.
function! s:highlight(target, fg, ...)
  " ... = bg, style.
  let histring = 'hi ' . a:target . ' '
  let fcolor = get(s:colors, a:fg)
 
  if strlen(a:fg)
    let histring .= 'guifg=' . fcolor[0] . ' ctermfg=' . fcolor[1] . ' '
  end
  
  if a:0 >= 1 && strlen(a:1)
    let bcolor = get(s:colors, a:1)
    let histring .= 'guibg=' . bcolor[0] . ' ctermbg=' . bcolor[1] . ' '
  endif 
  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  " Check that we actually got arguments.
  if histring != 'hi ' . a:target . ' '
    exe histring
  endif
endfunction

" TODO: Complete dark implementation.
function! s:setDark()
  " Base colors.
  call s:highlight('Normal', 'navajo', 'darkgrey')
  call s:highlight('NonText', 'orchid')
  call s:highlight('comment', 'grey')
  call s:highlight('constant', 'orchid')
  call s:highlight('string', 'grey')
  call s:highlight('identifier', 'navajo', 'darkgrey', 'bold')
  call s:highlight('statement', 'lightpink')
  call s:highlight('define', 'apache')
  call s:highlight('preproc', 'skyblue') 
  call s:highlight('type', 'lightorchid')
  call s:highlight('special', 'apache')
  call s:highlight('Underlined', '')
  call s:highlight('label', 'lightorchid')
  call s:highlight('operator', 'lightpink')
  call s:highlight('delimiter', 'navajo')
  
  " Inline notifications. 
  call s:highlight('Todo', 'orchid', 'darkgrey', 'bold')
  call s:highlight('Search', 'orchid', 'navajo', 'bold')
  call s:highlight('IncSearch', '')
  call s:highlight('title', '')
 
  " Cursor
  call s:highlight('Cursor', 'darkmagenta', 'orchid')
  
  " Status line
  call s:highlight('StatusLine', 'darkgrey', 'orchid')
  call s:highlight('StatusLineNC', 'darkgrey', 'grey')
  
  " Windows
  call s:highlight('VertSplit', 'densegrey', 'densegrey')

  " Diff 
  call s:highlight('DiffChange', 'navajo', 'densegrey')
  call s:highlight('DiffText', '')
  call s:highlight('DiffAdd', 'orchid', 'densegrey')
  call s:highlight('DiffDelete', 'apache', 'densegrey')

  " Folds
  call s:highlight('Folded', '')
  call s:highlight('FoldColumn', '')
  
  " Visual
  call s:highlight('Visual', 'salmon', 'orchid')
  
  " Command window
  call s:highlight('ErrorMsg', 'apache', 'darkgrey', 'bold')
  call s:highlight('WarningMsg', 'salmon')
  call s:highlight('ModeMsg', 'lightorchid')
  call s:highlight('MoreMsg', 'skyblue')
  call s:highlight('Error', '')

  " Spelling
  call s:highlight('SpellLocal', '', '', 'italic')
  call s:highlight('SpellBad', '', 'darkgrey', 'underline')
  call s:highlight('SpellCap', '', 'darkgrey', 'underline')

  " Line gutter
  call s:highlight('LineNr', 'orchid', 'darkgrey')
  call s:highlight('SignColumn', '', 'densegrey')

endfunction

" TODO: Implement light theme.
function! s:setLight()
  " Base colors.
  call s:highlight('Normal', 'black', 'white')
  call s:highlight('NonText', 'darkgrey')
  call s:highlight('comment', 'skyblue')
  call s:highlight('constant', 'black', 'white', 'bold')
  call s:highlight('string', 'grey')
  call s:highlight('identifier', 'darkgrey', 'white')
  call s:highlight('statement', 'black', '', 'bold')
  call s:highlight('define', 'darkgrey')
  call s:highlight('preproc', 'skyblue')
  call s:highlight('type', 'orchid')
  call s:highlight('special', 'black', '', 'bold')
  call s:highlight('Underlined', 'darkgrey')
  call s:highlight('label', 'darkgrey')
  call s:highlight('operator', 'navy')
  call s:highlight('delimiter', 'darkgrey')
  
  " Inline notifications. 
  call s:highlight('Todo', 'skyblue', 'white', 'bold')
  call s:highlight('Cursor', 'darkgrey')
  call s:highlight('Search', 'white', 'skyblue')
  call s:highlight('IncSearch', 'white', 'skyblue')
  call s:highlight('title', 'darkgrey')
  
  " Status line
  call s:highlight('StatusLine', 'black', 'white')
  call s:highlight('StatusLineNC', 'white', 'black')
  
  " Windows
  call s:highlight('VertSplit', 'white')

  " Diff 
  call s:highlight('DiffChange', 'darkgrey')
  call s:highlight('DiffText', 'darkgrey')
  call s:highlight('DiffAdd', 'darkgrey')
  call s:highlight('DiffDelete', 'darkgrey')

  " Folds
  call s:highlight('Folded', 'darkgrey')
  call s:highlight('FoldColumn', 'darkgrey')
  
  " Visual
  call s:highlight('Visual', 'darkgrey')
  
  " Sign Column
  call s:highlight('LineNr', 'black', 'white')
  call s:highlight('SignColumn', 'skyblue', 'white')

  " Command window
  call s:highlight('ErrorMsg', 'apache')
  call s:highlight('WarningMsg', 'apache')
  call s:highlight('ModeMsg', 'deepgrey')
  call s:highlight('MoreMsg', 'darkgrey')
  call s:highlight('Error', 'apache')

  " Spelling
  call s:highlight('SpellLocal', '', 'white', 'italic')
  call s:highlight('SpellBad', '', 'white', 'underline')
  call s:highlight('SpellCap', '', 'white', 'underline')

endfunction

" Set base colors.
if s:active_bg == 'dark'
  call s:setDark()
else
  call s:setLight()
endif

