vim9script

import autoload 'leco.vim'

augroup Leco
  au!
  au BufRead,BufWritePost *.cpp,*.cppm leco.SetupCppBuffer()
augroup END
