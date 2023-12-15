#!/bin/bash

# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
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

# nixos-unstable
nix run --refresh github:henrirosten/sbomnix?ref=nixmeta#nixmeta -- \
  --flakeref=github:NixOS/nixpkgs?ref=nixos-unstable --out=$OUT_FILE --append --verbose=2

# release-23.11
nix run --refresh github:henrirosten/sbomnix?ref=nixmeta#nixmeta -- \
  --flakeref=github:NixOS/nixpkgs?ref=release-23.11 --out=$OUT_FILE --append --verbose=2

# release-23.05
nix run --refresh github:henrirosten/sbomnix?ref=nixmeta#nixmeta -- \
  --flakeref=github:NixOS/nixpkgs?ref=release-23.05 --out=$OUT_FILE --append --verbose=2

################################################################################
