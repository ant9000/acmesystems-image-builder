fixterm() {
  local IFS='[;' saved escape geometry x y
  saved=$(stty -g)
  stty -echo
  printf '\e7\e[r\e[999;999H\e[6n\e8'
  read -sd R escape geometry
  stty $saved
  x=${geometry##*;} y=${geometry%%;*}
  if [[ ${COLUMNS} -eq ${x} && ${LINES} -eq ${y} ]]; then
    echo "${TERM} ${x}x${y}"
  else
    echo "${TERM} ${COLUMNS}x${LINES} -> ${x}x${y}"
    stty cols ${x} rows ${y}
  fi
}

if [ "x$TERM" == "xvt220" ]; then
  fixterm
fi
