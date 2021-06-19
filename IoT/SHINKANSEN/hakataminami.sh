curl "https://www.navitime.co.jp/diagram/depArrTimeList?departure=00007421&arrival=00007420&line=00000089&updown=0"| grep "time dep" | awk '{print substr($3,6,5)}' > schedule.txt

