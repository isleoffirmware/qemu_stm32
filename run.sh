SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH

build/qemu-system-arm -machine netduino2 -kernel ../output/output.elf
