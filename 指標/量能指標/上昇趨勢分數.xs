{@type:indicator}
{
指標說明
https://xstrader.net/上昇趨勢分數/
}

input:length(10,"期數");

variable: count1(0),count2(0),count3(0),count4(0),x1(0);

count1=0;
count2=0;
count3=0;
count4=0;

for x1=0 to length-1
	if h[x1]>h[x1+1] then count1=count1+1;

for x1=0 to length-1
	if o[x1]>o[x1+1] then count2=count2+1;

for x1=0 to length-1
	if low[x1]>low[x1+1] then count3=count3+1;

for x1=0 to length-1
	if close[x1]>close[x1+1] then count4=count4+1;

value1=count1+count2+count3+count4;
value2=value1-20;

plot1(value2,"趨勢分數");
