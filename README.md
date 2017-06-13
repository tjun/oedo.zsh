# oedo.zsh

__oedo.zsh__ provides a simple prompt for zsh.
Colorshemes are inspired by tokyo trains.

Print time on left prompt, print path and git branch on right prompt.

### Color Schemes


oedo(default):

![oedo](https://github.com/tjun/oedo.zsh/blob/master/img/oedo.png)

mita:

![mita](https://github.com/tjun/oedo.zsh/blob/master/img/mita.png)

shinjuku:

![shinjuku](https://github.com/tjun/oedo.zsh/blob/master/img/shinjuku.png)

oedo-light:

![oedo-light](https://github.com/tjun/oedo.zsh/blob/master/img/oedo-light.png)

mita-light:

![mita-light](https://github.com/tjun/oedo.zsh/blob/master/img/mita-light.png)

shinjuku-light:

![shinjuku-light](https://github.com/tjun/oedo.zsh/blob/master/img/shinjuku-light.png)

## Installation

install with the following commands.
You can specify colorscheme with `OEDO_COLORSCHEME` environment variable.

```
export OEDO_COLORSCHEME=mita # this is optional. use oedo color default.

git clone https://github.com/tjun/oedo.zsh.git ~/path/to/oedo
echo "test -f ~/path/to/oedo/oedo.zsh && source ~/.oedo/oedo.zsh" >> ~/.zshrc
source ~/.zshrc
```

### Install with zplug

```
export OEDO_COLORSCHEME=shinjuku-light # this is optional. use oedo color default.
zplug 'tjun/oedo.zsh', use:oedo.zsh
```

## License

This software is released under the MIT License, see LICENSE.

## TODO

  * add more *train* color schemes

## Contributation

  1. fork this repository (<https://github.com/tjun/oedo.zsh/fork>)
  2. clone your workspace (`git clone https://github.com/<your-name>/oedo.zsh`)
  3. checkout a branch (`git checkout -b <your-feature>`)
  4. commit and push your change (`git commit -a "add mY feature" && git push origin <your-feature>`)
  5. pull request!


