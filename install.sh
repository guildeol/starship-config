#!/bin/sh

STARSHIP_CONFIG="${STARSHIP_CONFIG:-$HOME}/.config/"
ZSHRC="$HOME/.zshrc"
STARSHIP_INIT='eval "$(starship init zsh)"'

echo "Copying config to $STARSHIP_CONFIG"
cp -f starship.toml $STARSHIP_CONFIG 2> /dev/null

if [ -f "$ZSHRC" ]; then
  if ! grep -Fq "$STARSHIP_INIT" "$ZSHRC"; then
    echo "Adding Starship init to $ZSHRC"
    printf '\n%s\n' "$STARSHIP_INIT" >> "$ZSHRC"
  else
    echo "Starship already initialized in $ZSHRC"
  fi
else
  echo "Unsupported shell for auto config."
fi

echo "Done!"
