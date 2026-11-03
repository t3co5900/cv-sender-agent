#!/usr/bin/env bash
# Instala el agente job-hunter en Claude Code y prepara ~/job-hunter.
# No pisa archivos existentes sin avisar.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$HOME/.claude/agents"
WORK_DIR="$HOME/job-hunter"

mkdir -p "$AGENTS_DIR" "$WORK_DIR/cv/adaptados"

dest="$AGENTS_DIR/job-hunter.md"
if [ -e "$dest" ] && ! cmp -s "$REPO_DIR/agents/job-hunter.md" "$dest"; then
  cp "$dest" "$dest.bak"
  echo "Ya había un job-hunter.md distinto: copia de seguridad en $dest.bak"
fi
cp "$REPO_DIR/agents/job-hunter.md" "$dest"
echo "Agente instalado en $dest"

for f in perfil.md postulaciones.md; do
  if [ -e "$WORK_DIR/$f" ]; then
    echo "Se mantiene $WORK_DIR/$f (ya existe)"
  else
    cp "$REPO_DIR/plantillas/$f" "$WORK_DIR/$f"
    echo "Creado $WORK_DIR/$f"
  fi
done

cat <<EOF

Listo. Próximos pasos:
  1. Copiá tu CV a $WORK_DIR/cv/
  2. Completá $WORK_DIR/perfil.md
  3. Conectá Gmail en Claude (claude.ai > Configuración > Conectores)
  4. Abrí Claude Code y pedí: "usá el agente job-hunter para buscar puestos"
EOF
