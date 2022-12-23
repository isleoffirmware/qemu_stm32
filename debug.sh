SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH

# TODO: combine with run.sh as an option
# listen for GDB connection on port 1234 and stop execution on startup
(build/qemu-system-arm -machine netduino2 -kernel ../output/output.elf -gdb tcp::1234 -S &)

# TODO: building the wrong platform!!! need stm32f205
# (gdb-multiarch ../output/output.elf &)

gdb-multiarch -q --nh \
  -ex 'set architecture arm' \
  -ex 'file ../output/output.elf' \
  -ex 'target remote tcp::1234' \
  -ex 'break main' \
  -ex continue \
;

# TODO: configure gdbinit on server
# warning: File "/home/kiron/Documents/simulator/qemu_stm32/.gdbinit" auto-loading has been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".
# To enable execution of this file add
# 	add-auto-load-safe-path /home/kiron/Documents/simulator/qemu_stm32/.gdbinit
# line to your configuration file "/home/kiron/.config/gdb/gdbinit".
# To completely disable this security protection add
# 	set auto-load safe-path /
# line to your configuration file "/home/kiron/.config/gdb/gdbinit".
# For more information about this security protection see the
# "Auto-loading safe path" section in the GDB manual.  E.g., run from the shell:
# 	info "(gdb)Auto-loading safe path"
