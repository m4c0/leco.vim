# leco.vim

Vim plugin with shortcuts for editing LECO™ modules

This should be compatible with most plugin loaders. I personally use Vim's
pack. So it is as easy as cloning this repo inside
`$MYVIMRC/pack/m4c0/start/leco.vim`.
 
It requires some extra plugin boilerplate, but as an easy hacky plugin, it
works fine.

Features (so far):
* Whenever a `cpp` or `cppm` file is loaded/saved and its buffer contains a
  line with `#pragma leco`, then the plugin
  * creates a `LecoRun` command and a corresponding `nmap <Leader>v`. That
    command will run the latest tool/app loaded.
  * sets `makeprg` to Leco and add a `nmap <Leader>b` to run make.

Those leader commands are a personal preference. If you are actually using both
LECO™ and this plugin, feel free to open an issue or a pull-request to disable
those via a global. I'll be more than glad to code it if someone **actually**
uses all that shenanigans.
