
set -e

cd "$SRCROOT"/../../
SRC=`pwd`/Components

cd "$BUILT_PRODUCTS_DIR"
DST=`pwd`/include

echo "$SRC"
echo "$DST"

####

cd "$BUILT_PRODUCTS_DIR"
./HierarchicalHeaderCopier "$SRC" "$DST"