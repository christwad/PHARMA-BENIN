#!/bin/bash

WATCH_DIR="./"

echo "🕵️‍♂️ Surveillance de $WATCH_DIR pour changements Git (avec confirmation YES/NO)..."

while inotifywait -r -e modify,create,delete $WATCH_DIR; do
  echo "🔍 Des fichiers ont été modifiés."
  read -p "Souhaites-tu push sur GitHub ? (YES/NO) : " confirm
  if [[ "$confirm" == "YES" ]]; then
    git add .
    git commit -m "🛠 MàJ automatique - $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin master
    echo "✅ Modifications poussées sur GitHub à $(date)"
  else
    echo "❌ Push annulé. Tu peux corriger les erreurs avant d’envoyer."
  fi
done
