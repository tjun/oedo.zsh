OEDO_COMPONENTS+=(
  username "%n"
  hostname "%M"
  current_path "%~"
  current_directory "%."
  jobs "%j"
  date "%D"
  time "%*"
  datetime "%d %*"
  git_prompt "\$(git_prompt_info)"
  kube_prompt "($ZSH_KUBECTL_PROMPT)"
  lprompt "$"
)

ZSH_THEME_GIT_PROMPT_PREFIX="≫ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✝"
