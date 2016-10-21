# vim-crlfmt

Vim plugin for `crlfmt`, a `gofmt`-style linter for Go code that enforces the
CockroachDB Style Guide found
[here](https://github.com/cockroachdb/cockroach/blob/master/STYLE.md).

The plugin by default will format `*.go` files on save, ignoring `*.pb.go` and
`*.pb.gw.go`. Under the hood it uses
[crlfmt](https://github.com/cockroachdb/crlfmt) to process the files.

## Usage

Save the file or call `:Crlfmt`. 

By default vim-crlfmt automatically formats _*.go_ files, ignoring _*.pb.go_ and
_*.pb.gw.go_ files, tab width for column calculations used is 2.

```vim
" Turn off autosave formatting
g:crlfmt_autosave = 0 [default = 1]

" Options to pass to crlfmt
g:crlfmt_options = '' [default = '-ignore ".*.pb(.gw)?.go -tab 2"']

" Display error message if crlfmt fails
g:crlfmt_fail_silently = 1 [default = 0]
```

## Install

Vim-crlfmt follows the standard runtime path structure. For Pathogen just clone
the repo. For other plugin managers add the appropriate lines and execute the
plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/irfansharif/vim-crlfmt.git ~/.vim/bundle/vim-crlfmt`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'irfansharif/vim-crlfmt'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'irfansharif/vim-crlfmt'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'irfansharif/vim-crlfmt'`
