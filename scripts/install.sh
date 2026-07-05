#!/usr/bin/env bash
# Context Kit installer — copies templates and skills to the right places
# Usage: bash scripts/install.sh [--skills-only] [--templates-only] [--dry-run]
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONTEXT_DIR="${HOME}/.claude/context"
SKILLS_DIR="${HOME}/.claude/skills"
DRY_RUN=0
SKILLS_ONLY=0
TEMPLATES_ONLY=0

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --skills-only) SKILLS_ONLY=1 ;;
    --templates-only) TEMPLATES_ONLY=1 ;;
  esac
done

say() { echo "  $*"; }
run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  [dry-run] $*"
  else
    "$@"
  fi
}

echo ""
echo "Context Kit Installer"
echo "====================="
[ "$DRY_RUN" -eq 1 ] && echo "  (DRY RUN — no files will be written)"
echo ""

# --- Templates ---
if [ "$SKILLS_ONLY" -eq 0 ]; then
  echo "Installing PCA templates → ${CONTEXT_DIR}/"
  run mkdir -p "$CONTEXT_DIR"

  for template in "$REPO_DIR"/templates/*.md "$REPO_DIR"/templates/*.template; do
    [ -e "$template" ] || continue
    fname="$(basename "$template")"
    dest="${CONTEXT_DIR}/${fname}"

    if [ -e "$dest" ]; then
      say "SKIP (exists): ${fname} — not overwriting your data"
    else
      run cp "$template" "$dest"
      say "INSTALLED: ${fname}"
    fi
  done
  echo ""
fi

# --- Skills ---
if [ "$TEMPLATES_ONLY" -eq 0 ]; then
  echo "Installing skills → ${SKILLS_DIR}/"
  run mkdir -p "$SKILLS_DIR"

  for skill in "$REPO_DIR"/skills/*.md; do
    [ -e "$skill" ] || continue
    fname="$(basename "$skill")"
    skill_name="${fname%.md}"
    dest_dir="${SKILLS_DIR}/${skill_name}"

    if [ -d "$dest_dir" ]; then
      say "UPDATE: ${skill_name}/ (overwriting skill file)"
      run cp "$skill" "${dest_dir}/SKILL.md"
    else
      run mkdir -p "$dest_dir"
      run cp "$skill" "${dest_dir}/SKILL.md"
      say "INSTALLED: ${skill_name}/"
    fi
  done
  echo ""
fi

# --- Next steps ---
if [ "$DRY_RUN" -eq 0 ]; then
  echo "Done! Next steps:"
  echo ""
  echo "  1. Fill in your PCA templates:"
  echo "     ${CONTEXT_DIR}/pca-wiki.md"
  echo "     ${CONTEXT_DIR}/pca-mental-models.md"
  echo "     ${CONTEXT_DIR}/pca-voice.md"
  echo "     ${CONTEXT_DIR}/pca-protocols.md"
  echo ""
  echo "  2. Add this to your ~/.claude/CLAUDE.md (or copy the template):"
  echo "     Read these files at session start:"
  echo "       ~/.claude/context/pca-wiki.md"
  echo "       ~/.claude/context/pca-mental-models.md"
  echo "       ~/.claude/context/pca-voice.md"
  echo "       ~/.claude/context/pca-protocols.md"
  echo ""
  echo "  3. Test a skill by starting Claude Code and typing:"
  echo "     /crm-everything"
  echo "     /morning-briefing"
  echo "     /open-loops"
  echo ""
  echo "  See README.md for full documentation."
  echo ""
  echo "  ---"
  echo "  If Context Kit saves you time, a GitHub star helps others find it:"
  echo "  https://github.com/JDDavenport/context-kit"
  echo "  ---"
  echo ""
fi
