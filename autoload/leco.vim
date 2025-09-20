vim9script

def Run()
  const ars = " " .. get(g:, 'leco_args', "")
  exe "!" .. expand("../leco/leco.exe") .. ars .. " run " .. g:leco_app
enddef

export def SetupCppBuffer()
  const base = expand("%:t:r")
  if search('^\s*#pragma leco \(tool\|test\|app\)$', 'nw') > 0
    g:leco_app = base
  else
    return
  endif

  command! -nargs=0 LecoRun Run()
  nmap <Leader>v :LecoRun<CR>

  const ars = " " .. get(g:, 'leco_args', "")
  &makeprg = expand("../leco/leco.exe") .. ars
  nmap <Leader>b :make<CR>
enddef
