#!/bin/bash

# Define the boundary coordinates for the five areas
x1_min=487
x1_max=595
y1_min=44
y1_max=147

x2_min=591
x2_max=844
y2_min=467
y2_max=523

x3_min=196
x3_max=888
y3_min=769
y3_max=880

x4_min=362
x4_max=713
y4_min=1044
y4_max=1123

x5_min=939
x5_max=980
y5_min=359
y5_max=413

# Define function to randomly generate coordinates from bound coordinates
generate_random_coordinate() {
  local x_min=$1
  local x_max=$2
  local y_min=$3
  local y_max=$4

  local x=$(($RANDOM * ($x_max - $x_min + 1) / 32767 + $x_min))
  local y=$(($RANDOM * ($y_max - $y_min + 1) / 32767 + $y_min))

  echo "$x $y"
}

for j in {1..100}
do
	echo -e "\033[1;31mDurchlauf Nr. $j\033[0m"
	for i in {1..5}
	do
		# Calc coord for each point
		if [ $i -eq 1 ]; then
			point=$(generate_random_coordinate $x1_min $x1_max $y1_min $y1_max)
		elif [ $i -eq 2 ]; then
			point=$(generate_random_coordinate $x2_min $x2_max $y2_min $y2_max)
		elif [ $i -eq 3 ]; then
			point=$(generate_random_coordinate $x3_min $x3_max $y3_min $y3_max)
		elif [ $i -eq 4 ]; then
			point=$(generate_random_coordinate $x4_min $x4_max $y4_min $y4_max)
		else
			point=$(generate_random_coordinate $x5_min $x5_max $y5_min $y5_max)
		fi

		# Execute touch event
		adb shell input tap $point
		# Wait random time
		sleep_time=$((RANDOM%3 + 1))
		echo "Touch-Event bei $point ausgeführt nach $sleep_time Sekunden"
		sleep $sleep_time
	done
done
