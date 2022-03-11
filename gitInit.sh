#!/bin/sh
git init; git add . ; git commit -m "Init" ; gh repo create $1 --$2 --source=. --remote=upstream --push
