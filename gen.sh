#!/bin/zsh
emulate -R sh

dir=`pwd`

if find $dir/about.md > /dev/null 2>&1
then
    cat $dir/about.md >> $dir/es_draft.md
fi

files=`find $dir/* -type f -name '*.md'`

for file in $files;
do
    if ! find $dir/es_draft.md > /dev/null 2>&1
    then
        sh_pwd=`where gen.sh`
        tmplt=${sh_pwd%/gen.sh}
        echo $tmplt
        cat $tmplt/template.md > $dir/es_draft.md
    fi
done
