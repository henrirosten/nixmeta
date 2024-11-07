#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023-2024 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0

################################################################################

set -x # debug
set -e # exit immediately if a command fails
set -u # treat unset variables as an error and exit
set -o pipefail # exit if any pipeline command fails

################################################################################

# Script's directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Output file path
OUT_FILE="$SCRIPT_DIR/data/nixmeta.csv"
# Pin to the following sbomnix revision
REV="eec92a9735fd5a9ab345f1e870c71ccd9343a13f"

# nixos-unstable
nix run --refresh "github:tiiuae/sbomnix?rev=$REV#nixmeta" -- \
  --flakeref="github:NixOS/nixpkgs?ref=nixos-unstable" --out="$OUT_FILE" \
  --append --verbose=2

# release-24.05
nix run --refresh "github:tiiuae/sbomnix?rev=$REV#nixmeta" -- \
  --flakeref="github:NixOS/nixpkgs?ref=release-24.05" --out="$OUT_FILE" \
  --append --verbose=2

# release-23.11
nix run --refresh "github:tiiuae/sbomnix?rev=$REV#nixmeta" -- \
  --flakeref="github:NixOS/nixpkgs?ref=release-23.11" --out="$OUT_FILE" \
  --append --verbose=2

################################################################################
