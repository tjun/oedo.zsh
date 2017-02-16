(){
  local i
  for i in {1..$OEDO_LEFT_LINE}; do
    eval "OEDO_COLOR_LEFT${i}_1=(15 34)"
    eval "OEDO_COLOR_LEFT${i}_2=(15 16)"
#    eval "OEDO_COLOR_LEFT${i}_3=(15 238)"
#    eval "OEDO_COLOR_LEFT${i}_4=(15 240)"
  done
}

OEDO_COLOR_RIGHT1=(15 235)
OEDO_COLOR_RIGHT2=(41 16)
#OEDO_COLOR_RIGHT3=(15 236)
#OEDO_COLOR_RIGHT4=(15 234)
