#!/bin/bash
# Program:     convert-start-to-submodules
# Author:      Oskar Voldbakken Hesle
# Date:        2025-12-15

set -euo pipefail

ROOT="${1:-$HOME/.config/nvim}"
PLUGDIR="$ROOT/pack/plugins/start"
BACKUP_DIR="$ROOT/.submodule-migration-backup-$(date +%Y%m%d-%H%M%S)"

if [[ ! -d "$PLUGDIR" ]]; then
  echo "ERROR: $PLUGDIR does not exist"
  exit 1
fi

cd "$ROOT"

# Ensure we're inside a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: $ROOT is not a git repository"
  exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "Root:    $ROOT"
echo "Plugins: $PLUGDIR"
echo "Backup:  $BACKUP_DIR"
echo

# Helper: get origin url from an existing plugin checkout
get_origin_url() {
  local dir="$1"
  git -C "$dir" config --get remote.origin.url 2>/dev/null || true
}

# Helper: get current commit from existing plugin checkout
get_head_sha() {
  local dir="$1"
  git -C "$dir" rev-parse HEAD 2>/dev/null || true
}

# Helper: get current branch (may be empty if detached)
get_branch() {
  local dir="$1"
  git -C "$dir" symbolic-ref --quiet --short HEAD 2>/dev/null || true
}

# Iterate all dirs in pack/plugins/start
shopt -s nullglob
for d in "$PLUGDIR"/*/; do
  d="${d%/}"
  name="$(basename "$d")"

  # Only convert actual git repos
  if [[ ! -d "$d/.git" ]]; then
    echo "SKIP (not a git repo): $name"
    continue
  fi

  url="$(get_origin_url "$d")"
  sha="$(get_head_sha "$d")"
  br="$(get_branch "$d")"

  if [[ -z "$url" || -z "$sha" ]]; then
    echo "SKIP (missing origin/sha): $name"
    continue
  fi

  echo "==> Converting: $name"
  echo "    url:   $url"
  echo "    sha:   $sha"
  [[ -n "$br" ]] && echo "    branch:$br" || echo "    branch:(detached)"

  # If the plugin dir is tracked as normal files in your repo, untrack it first.
  # (Does NOT delete files on disk; just removes it from git index if present.)
  if git ls-files --error-unmatch "$d" >/dev/null 2>&1; then
    echo "    - removing tracked files from index: $d"
    git rm -r --cached "$d" >/dev/null
  fi

  # Move existing checkout to backup so we can re-add cleanly
  echo "    - moving existing dir to backup"
  mv "$d" "$BACKUP_DIR/$name"

  # Add as submodule
  echo "    - adding submodule"
  git submodule add "$url" "$d" >/dev/null

  # Pin to the exact commit you had before
  echo "    - pinning submodule to previous commit"
  git -C "$d" fetch --all --tags >/dev/null 2>&1 || true
  git -C "$d" checkout -q "$sha"

  # (Optional) If you prefer to keep branch checked out instead of detached,
  # uncomment this block. Pinning by sha is more reproducible though.
  #
  # if [[ -n "$br" ]]; then
  #   git -C "$d" checkout -q "$br" || true
  # fi

  echo
done

echo "Done."
echo
echo "Next steps:"
echo "  1) Review: git status"
echo "  2) Commit: git commit -m \"Convert pack/plugins/start plugins to submodules\""
echo "  3) On new machines: git submodule update --init --recursive"
echo
echo "Backup of previous plugin dirs is in:"
echo "  $BACKUP_DIR"
