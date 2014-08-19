
set -e

cd "$SRCROOT"/../../
SRC=`pwd`/Components

cd "$BUILT_PRODUCTS_DIR"
DST=`pwd`/include

echo "$SRC"
echo "$DST"

####

cd "$BUILT_PRODUCTS_DIR"
./HierarchicalHeaderCopier "$SRC"/Common/FoundationExtras/FoundationExtras "$DST"/Eonil/Library/Common/FoundationExtras
./HierarchicalHeaderCopier "$SRC"/Common/AppKitSanitizer/AppKitSanitizer "$DST"/Eonil/Library/Common/AppKitSanitizer
./HierarchicalHeaderCopier "$SRC"/Common/UIKitSanitizer/UIKitSanitizer "$DST"/Eonil/Library/Common/UIKitSanitizer
./HierarchicalHeaderCopier "$SRC"/Common/CommonStuffsForC++/Eonil/Common "$DST"/Eonil/Library/Common/C++
./HierarchicalHeaderCopier "$SRC"/CommonRealtimeGameAlgorithms/Sources/Eonil "$DST"/Eonil/Library/CommonRealtimeGameAlgorithms
./HierarchicalHeaderCopier "$SRC"/Aliens/Aliens/Eonil "$DST"/Eonil/Library/Aliens
./HierarchicalHeaderCopier "$SRC"/CocoaSQLite/CocoaSQLite "$DST"/Eonil/Library/CocoaSQLite
find "$DST" -type d -empty -delete