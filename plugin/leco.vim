vim9script

import autoload 'leco.vim'

augroup Leco
  au!
  au BufRead,BufWritePost *.c,*.cpp,*.cppm leco.SetupCppBuffer()
augroup END
