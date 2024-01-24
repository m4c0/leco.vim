vim9script

var def_app = "error"

def Run()
  exe "!" .. expand("out/x86*/" .. def_app)
enddef

export def SetupCppBuffer()
  const base = expand("%:t:r")
  if search('#pragma leco tool', 'nw') > 0
    def_app = base .. ".exe"
  elseif search('#pragma leco app', 'nw') > 0
    def_app = base .. ".app/**/" .. base .. ".exe"
  else
    return
  endif

  command! -nargs=0 LecoRun Run()
  nmap <Leader>v :LecoRun<CR>

  set makeprg="../leco/leco.exe"
  nmap <Leader>b :make<CR>
enddef
