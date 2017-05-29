#!/bin/bash

clear; date;

project_root="$(git rev-parse --show-toplevel)"

pushd "$project_root" > /dev/null

tests_to_run=$(git ls-files --modified --other --full-name | grep 'spec.rb')

if [ ! -z "$tests_to_run" ]; then
    echo $tests_to_run | xargs bundle exec rspec --format doc --color
else
    echo; echo "No specs modified."; echo
fi;

popd > /dev/null

date; echo;

sleep 3
