#!/bin/bash

OUTPUT="DP-2"
MODE="1920x1080"

CURRENT=$(xrandr | awk -v out="$OUTPUT" '
$0 ~ out {found=1; next}
found && /\*/ {
  for (i=1; i<=NF; i++) {
    if ($i ~ /\*/) {
      gsub(/\*/,"",$i)
      print int($i)
      exit
    }
  }
}
')

echo "Current: $CURRENT"

if [ "$CURRENT" = "144" ]; then
    echo "Switching to 60Hz"
    xrandr --output "$OUTPUT" --mode "$MODE" --rate 60.00
else
    echo "Switching to 144Hz"
    xrandr --output "$OUTPUT" --mode "$MODE" --rate 144.00
fi
