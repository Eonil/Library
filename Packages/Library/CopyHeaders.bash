
set -e

cd "$SRCROOT"/../../
SRC=`pwd`/Components

cd "$BUILT_PRODUCTS_DIR"
DST=`pwd`/include

####

cd "$BUILT_PRODUCTS_DIR"
rm -rf "$DST"
./HierarchicalHeaderCopier "$SRC"/Common/FoundationExtras/FoundationExtras "$DST"/FoundationExtras
./HierarchicalHeaderCopier "$SRC"/Common/AppKitSanitizer/AppKitSanitizer "$DST"/AppKitSanitizer
./HierarchicalHeaderCopier "$SRC"/Common/UIKitSanitizer/UIKitSanitizer "$DST"/UIKitSanitizer
./HierarchicalHeaderCopier "$SRC"/Common/CommonStuffsForC++/Eonil/Common "$DST"/Common
./HierarchicalHeaderCopier "$SRC"/CommonRealtimeGameAlgorithms/Sources/Eonil "$DST"/
./HierarchicalHeaderCopier "$SRC"/Aliens/Aliens/Eonil "$DST"/
./HierarchicalHeaderCopier "$SRC"/CocoaSQLite/CocoaSQLite "$DST"/CocoaSQLite
find "$DST" -type d -empty -delete


