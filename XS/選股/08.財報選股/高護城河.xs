{@type:filter|@guid:9ea497a85beb421f87c8eaf208f3ca60|@path:/08.財報選股/高護城河}
condition1=false;
condition2=false;
condition3=false;

if trueall(GetField("營業毛利率","Y") >=10,5)
then condition1=true;

if trueall(GetField("來自營運之現金流量","Y")>100,5)
then condition2=true;

if trueall(GetField("股東權益報酬率","Y")>20,5)
then condition3=true;

if condition1 and condition2 and condition3
then ret=1;

outputfield(1,GetField("營業毛利率","Y"),2,"營業毛利率%", order := 1);
