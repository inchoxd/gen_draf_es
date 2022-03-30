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
        cat $tmplt/template.md > $dir/es_draft.md
    else
    fi
    f_name=`basename $file`
    if [ $f_name != 'about.md' ] && [ $f_name != 'es_draft.md' ]
    then
        header1=`gsed -n '11p' $file`
        draft_line=`gsed -n '/## draft/=' $file`
        draft=`gsed -n "$((${draft_line}+1))p" $file`
        gsed -i -e \$a"${header1}"\\n"${draft}"\\n ${dir}/es_draft.md
    else
        continue
    fi
done

# pandoc -F pandoc-crossref es_draft.md -o es_draft.pdf --pdf-engine=lualatex -V documentclass=ltjarticle -N -V geometry:a4paper -V geometry:margin=2.5cm

