#!/bin/bash

export LD_LIBRARY_PATH=/root/hpl-2.2/usr/lib/
if [ "$#" -eq 0 ] ; then
	echo "Running default test"
	/root/hpl-2.2/usr/bin/mpirun --report-bindings --mca btl vader,self --map-by socket --bind-to hwthread -np 64 --allow-run-as-root /root/hpl-2.2/bin/THUNDERX2T99/xhpl
else
	case $1 in
		bash)
			exec bash 
			;;
		test)
			/root/hpl-2.2/usr/bin/mpirun --report-bindings --mca btl vader,self --map-by socket --bind-to hwthread -np 64 --allow-run-as-root /root/hpl-2.2/bin/THUNDERX2T99/xhpl
			;;
		*)
			echo "Check Args" 
			;;
	esac
fi

