{@type:filter}
condition1=false;
condition2=false;
condition3=false;

//每年毛利率都大於10%
if trueall(GetField("營業毛利率","Y")>=10,4) then condition1=true;

//每年來自營運的現金流量都大於1億
if trueall(GetField("來自營運之現金流量","Y")>100,4) then condition2=true;

//股東權益報酬率大於15%
if trueall(GetField("股東權益報酬率","Y")>15,4) then condition3=true;

if condition1 and condition2 and condition3
then ret=1;