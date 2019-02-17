#!/usr/bin/env bash

main () {
  if [[ "$TRAVIS" != "true" ]]; then
    echo "This script is only meant to be used as a part of CI pipeline" >&2
    return 1
  fi

  if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    echo "Pull request, ignoring"
    return 0
  fi

  clone_fonts &&
  install_nix_google_fonts_gen &&
  update_overlay &&
  push_changes
}

clone_fonts () {
  echo "Cloning Google Fonts repository"
  git clone https://github.com/google/fonts.git ~/fonts >/dev/null 2>&1
}

install_nix_google_fonts_gen () {
  echo "Installing nix-google-fonts-gen"
  git clone https://github.com/Soft/nix-google-fonts-gen.git ~/nix-google-fonts-gen >/dev/null 2>&1 &&
  pushd ~/nix-google-fonts-gen &&
  ./setup.py install &&
  popd
}

update_overlay () {
  echo "Updating overlay contents"
  rm -rf default.nix pkgs
  nix-google-fonts-gen ~/fonts .
  update_readme
}

update_readme () {
  local font_count
  echo "Updating README.md"
  font_count="$(ls pkgs | wc -l)" &&
  sed -iE "s/\\*\\*[[:digit:]]+ high-quality fonts packaged for Nix\\*\\*/\\*\\*$font_count high-quality fonts packaged for Nix\\*\\*/" README.md
}

push_changes () {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"

  git add -A >/dev/null 2>&1

  if git diff-index --quiet HEAD >/dev/null 2>&1; then
    echo "No changes since the last commit, exiting"
    return 0
  fi

  echo "Committing changes"

  git commit -m "[skip ci] Automatic update $(date "+%Y-%m-%d") (Build $TRAVIS_BUILD_NUMBER)" >/dev/null 2>&1

  echo "Pushing"

  git remote rm origin >/dev/null 2>&1
  git remote add origin "${GITHUB_OAUTH_TOKEN}@github.com/Soft/nix-google-fonts-overlay.git" >/dev/null 2>&1
  git push origin master --quiet >/dev/null 2>&1
  git remote rm origin >/dev/null 2>&1

  echo "Done"
}

main "$@"
