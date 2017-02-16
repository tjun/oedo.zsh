#oedo.zsh

__oedo.zsh__ provides a simple prompt for zsh.
Colorshemes are inspired by tokyo trains.

###Color Schemes


oedo(default):

mita:

shinjuku:

oedo-light:

mita-light:

shinjuku-light:


##Installation

install with the following commands.
You can specify colorscheme with `OEDO_COLORSCHEME` environment variable.

```
OEDO_COLORSCHEME=mita # this is optional. use oedo color default.

git clone https://github.com/tjun/oedo.zsh.git ~/path/to/oedo
echo "test -f ~/path/to/oedo/oedo.zsh && source ~/.oedo/oedo.zsh" >> ~/.zshrc
source ~/.zshrc
```

### Install with zplug

```
OEDO_COLORSCHEME=shinjuku-light # this is optional. use oedo color default.
zplug 'tjun/oedo.zsh'
```

##License

This software is released under the MIT License, see LICENSE.

##TODO

  * add more *train* color schemes

##Contributation

  1. fork this repository (<https://github.com/tjun/oedo.zsh/fork>)
  2. clone your workspace (`git clone https://github.com/<your-name>/oedo.zsh`)
  3. checkout a branch (`git checkout -b <your-feature>`)
  4. commit and push your change (`git commit -a "add mY feature" && git push origin <your-feature>`)
  5. pull request!


