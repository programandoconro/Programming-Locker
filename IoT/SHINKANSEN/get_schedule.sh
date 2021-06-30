# Get today's schedule for Shinkansen trains from Hakata-minami to Hakata station.

#!/bin/bash

hakataminami_hakata="https://www.navitime.co.jp/diagram/depArrTimeList?departure=00007421&arrival=00007420&line=00000089&updown=0"
hakata_hakataminami="https://www.navitime.co.jp/diagram/depArrTimeList?departure=00007420&arrival=00007421&line=00000089&updown=1"

get_schedule() {
	curl $1 | 
	grep "time dep" |
	awk '{print substr($3,6,5)}'
}

from_hakataminami_to_hakata() {
	get_schedule "$hakataminami_hakata"
}

from_hakata_to_hakataminami() {
	get_schedule "$hakata_hakataminami"
}



"$@"



