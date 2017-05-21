#!/bin/bash

set -e

root_dir=`pwd`

cd $root_dir

rm -rf tmp
rm -rf results

mkdir -p tmp
mkdir -p results

for book in books/*; do
    work_dir="tmp/$(basename $book)"
    result_file="$root_dir/results/$(basename $book)"

    mkdir -p $work_dir

    unzip $book -d $work_dir > /dev/null

    perl -pi -e 's/Цири/Сири/g' `find $work_dir -name "*.xhtml"`

    pushd $work_dir > /dev/null
    zip -r $result_file * > /dev/null
    popd > /dev/null
    echo "Created $result_file"
done

echo

echo "Цири: "
grep -rI "\<Цири\>" tmp/ | wc -l

echo "Цирила: "
grep -rI "\<Цирила\>" tmp/ | wc -l

echo "Сири: "
grep -rI "\<Сири\>" tmp/ | wc -l

echo "Сирила: "
grep -rI "\<Сирила\>" tmp/ | wc -l

rm -rf tmp
