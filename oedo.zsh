# set shell varibles

# oedo.zsh installed directory's path
OEDO_HOME="$(cd "$(dirname ${0})"; pwd)"

# oedo.zsh prompt's separatos (left right)
OEDO_SEPARATOR=('' '')
OEDO_SUBSEPARATOR=('|' '|')

typeset -A OEDO_COMPONENTS
# load components
(){
  local component_file
  for component_file ($OEDO_HOME/components/*.zsh); do
    source $component_file
  done
}

# oedo.zsh default prompt
# number of left prompt line
OEDO_LEFT_LINE=1
# left prompt groups (max 4)
OEDO_LEFT1_1=(time)
OEDO_LEFT1_2=(lprompt)
# right prompt groups (max 4)
#OEDO_RIGHT1=(time)
OEDO_RIGHT1=(current_path)
OEDO_RIGHT2=(git_prompt)
OEDO_RIGHT3=(kube_prompt)


# oedo.zsh find colorscheme using this pathes
OEDO_COLORSCHEME_PATH=''
typeset -U OEDO_COLORSCHEME_PATH oedo_colorscheme_path
oedo_colorscheme_path=(
  $OEDO_HOME/colorschemes
)

# colorscheme using oedo.zsh
if [[ "$OEDO_COLORSCHEME" == "" ]]; then
  OEDO_COLORSCHEME="oedo"
fi

# setup zsh options
-oedo-setup() {
  setopt prompt_subst
  autoload -Uz colors; colors
}

# find and load colorscheme file
-oedo-load-colorscheme() {
  local flag=''
  local path

  for path in $oedo_colorscheme_path; do
    if [[ -f "$path/$OEDO_COLORSCHEME.zsh" ]]; then
      source "$path/$OEDO_COLORSCHEME.zsh"
      flag='true'
      break
    fi
  done
  if [[ "$flag" = '' ]]; then
    echo "$OEDO_COLORSCHEME is not found."
    return 1
  fi
  return 0
}

-oedo-initialize() {
  -oedo-setup
  -oedo-load-colorscheme || return 1

  # alias global variables
  local sepl=$OEDO_SEPARATOR[1]
  local sepr=$OEDO_SEPARATOR[2]
  local subsepl=$OEDO_SUBSEPARATOR[1]
  local subsepr=$OEDO_SUBSEPARATOR[2]
  local target content flag i j left right
  local -a prompts color

  # initialize prompts
  PROMPT=''
  RPROMPT=''

  # set left prompt
  for j in {1..$OEDO_LEFT_LINE}; do
    content=''
    flag=''
    for i in {1..4}; do
      target=(${(z)$(eval "echo \$OEDO_LEFT${j}_${i}")})
      if [[ 0 < $#target ]]; then
        # set color
        color=(${(z)$(eval "echo \$OEDO_COLOR_LEFT${j}_${i}")})
        content+="%{"
        content+=$'\e'"[48;5;${color[2]}m%}"
        content+="$flag %{"
        content+=$'\e'"[38;5;${color[1]}m%}"

        # set content
        prompts=()
        for left in $target; do
          prompts+=(${OEDO_COMPONENTS[$left]})
        done
        content+=$(eval "echo \${(j: $subsepl :)prompts}")

        content+="%{"$'\e'"[38;5;${color[2]}m%} "
        flag="$sepl"
      fi
    done
    if [[ "$content" != '' ]]; then
      content+="%{%k%}"
      content+="$sepl"
      PROMPT+=$'\n'"$content%{%f%} "
    fi
  done

  # set right prompt
  for i in {1..4}; do
    target=(${(z)$(eval "echo \$OEDO_RIGHT${i}")})
    if [[ 0 < $#target ]]; then

      # set color
      color=(${(z)$(eval "echo \$OEDO_COLOR_RIGHT${i}")})
      RPROMPT+="%{"$'\e'"[38;5;${color[2]}m%}"
      RPROMPT+="$sepr"
      RPROMPT+="%{"
      RPROMPT+=$'\e'"[38;5;${color[1]}m"
      RPROMPT+=$'\e'"[48;5;${color[2]}m"
      RPROMPT+="%}"
      RPROMPT+=" "

      prompts=()

      prompts=(${OEDO_COMPONENTS[$target]})
      RPROMPT+="${(j: ${subsepr} :)prompts}"
      RPROMPT+=" "
    fi
  done
  if [[ "$RPROMPT" != '' ]]; then
    RPROMPT+="%{%f%k%}"
  fi
}

-oedo-initialize
