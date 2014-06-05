self=$0
DIR=$(dirname $(pwd)/$self)
OLDDIR=$DIR/old
EXCLUDES="$self $OLDDIR "

excluded(){
    for f in $EXCLUDES; do
        if [ "$1" = "$f" ]; then
            return 1
        fi
    done
    return 0
}

SCRIPTPATH=$(pwd)/${0}
SCRIPTDIR=$(dirname $SCRIPTPATH)
echo $SCRIPTPATH
echo $SCRIPTDIR
for f in $(ls $SCRIPTDIR); do
    if ! excluded $f; then
    echo $f
fi
done
