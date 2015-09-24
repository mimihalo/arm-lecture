#!/bin/bash

falsecnt=0;
i=1;
fib=1;
fibp1=0;
fibp2=1;
res=0;
while [ $i -le 40 ]; do
	#echo $fib;
	res=`yes $i | qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &`;
	res=`echo $res | cut -d ' ' -f 3`;
	#echo $res;
	
	if [ $fib != $res ];
	then
		falsecnt=`expr $falsecnt + 1`;
	fi

	fib=`expr $fibp1 + $fibp2`;
        fibp1=$fibp2;
        fibp2=$fib;

	i=`expr $i + 1`;
done


#echo $falsecnt;
if [ "$falsecnt" -eq "0" ];
then
	echo "all correct";
else
	echo "something wrong";
fi
