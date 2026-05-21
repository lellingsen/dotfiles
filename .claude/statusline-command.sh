#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
base=$(printf "\033[01;34m%s\033[00m" "$cwd")
if [ -n "$cost" ] && [ "$(echo "$cost > 0" | bc -l 2>/dev/null)" = "1" ]; then
  cost_fmt=$(printf "%.2f" "$cost")
  if [ "$(echo "$cost >= 25" | bc -l 2>/dev/null)" = "1" ]; then
    cost_color="1;31"
  elif [ "$(echo "$cost >= 10" | bc -l 2>/dev/null)" = "1" ]; then
    cost_color="1;33"
  else
    cost_color="2;33"
  fi
  printf "%s \033[%sm\$%s\033[00m" "$base" "$cost_color" "$cost_fmt"
else
  printf "%s" "$base"
fi
