#!/bin/zsh
emulate -R sh

dir=`pwd`

if `find $pwd/about.md >>&1` && true
then
    `cat $pwd/about.md >> $pwd/es_draft.md`
fi

files=`find $dir/* -maxdepth 0 -type f -name '*.md'`

for file in $files;
do
    echo $file
done
