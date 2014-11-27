#!/bin/bash



find . -depth -name '*openSUSE*' -execdir bash -c 'for f; do mv -i "$f" "${f//openSUSE/RadicOS}"; done' bash {} +