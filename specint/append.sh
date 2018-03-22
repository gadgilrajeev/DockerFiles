#!/usr/bin/env bash

cp -r /mnt/nas/benchmark/specjbb/c-generator-files/scripts .
hw_cpu_name=$(sudo dmidecode -s processor-version | head -n 1)
processor_freq=$(sudo dmidecode -s processor-frequency | head -n 1)
echo "hw_cpu_name = ${hw_cpu_name} @ ${processor_freq}" >> $1
hw_cpu_nominal_mhz=$(sudo /usr/lib/lmbench/bin/mhz)
echo "hw_cpu_nominal_mhz = ${hw_cpu_nominal_mhz}" >> $1
hw_cpu_max_mhz=$(echo ${hw_cpu_nominal_mhz} | numfmt --from-unit='M' --to-unit='G' --format="%.2f" --round=nearest)
echo "hw_cpu_max_mhz = ${hw_cpu_nominal_mhz}" >> $1
hw_disk=$(./scripts/disks.sh)
echo "hw_disk = ${hw_disk}" >> $1
hw_model=$(sudo dmidecode -s processor-version | head -n 1)
echo "hw_model = ${hw_model}" >> $1
hw_nchips=$(lscpu | grep "Socket(s)" | awk -F ':' '{print $2}' | xargs)
echo "hw_nchips = $hw_nchips" >> $1
hw_ncores=$(lscpu | grep "Core(s)" | awk -F ':' '{print $2}' | xargs)
echo "hw_ncores = $hw_ncores" >> $1
hw_nthreadspercore=$(lscpu | grep "Thread(s)" | awk -F ':' '{print $2}' | xargs)
echo "hw_nthreadspercore = $hw_nthreadspercore" >> $1
echo "hw_other = none" >> $1
hw_memory_str_1=$(./scripts/memory_count.sh)
hw_memory_str_2=$(sudo dmidecode -t memory | grep Rank | head -n 1 | awk -F ":" '{print $2}')
hw_memory_str_3=$(sudo dmidecode -t memory | grep Speed | head -n 1 | awk -F " " '{print $2}')
echo "hw_memory = ${hw_memory_str_1}${hw_memory_str_2}RX4, PC4-21333R-V ,running at ${hw_memory_str_3} MHz)" >> $1
hw_pcache=$(./scripts/l1_cache_size.sh)
echo "hw_pcache = $hw_pcache on chip per core" >> $1
hw_scache=$(./scripts/l2_cache_size.sh)
echo "hw_scache = $hw_scache on chip per core" >> $1
hw_tcache=$(./scripts/l3_cache_size.sh)
echo "hw_tcache = $hw_tcache on chip per chip" >> $1
fw_bios_1=$(sudo dmidecode -s bios-version)
fw_bios_2=$(sudo dmidecode -s bios-release-date)
echo "fw_bios = $fw_bios_1 Released on: $fw_bios_2" >> $1
echo "sw_state = default" >> $1
sw_compiler=$(gcc --version | head -n 1)
echo "sw_compiler=${sw_compiler}" >> $1

