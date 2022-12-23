SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH

mkdir build
cd build
../configure --enable-debug --disable-werror --target-list="arm-softmmu"
make -j10
