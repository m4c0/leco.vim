vim9script

var def_app = "error"

def DefaultRunner(exe: string)
  exe "!" .. exe
enddef

def Run()
  const Runner = get(g:, 'LecoRunner', DefaultRunner)
  Runner(expand("out/x86*/" .. def_app))
enddef

export def SetupCppBuffer()
  const base = expand("%:t:r")
  if search('^\s*#pragma leco tool$', 'nw') > 0
    def_app = base .. ".exe"
  elseif search('^\s*#pragma leco app$', 'nw') > 0
    def_app = base .. ".app/**/" .. base .. ".exe"
  else
    return
  endif

  command! -nargs=0 LecoRun Run()
  nmap <Leader>v :LecoRun<CR>

  &makeprg = expand("../leco/leco.exe")
  nmap <Leader>b :make<CR>
enddef
