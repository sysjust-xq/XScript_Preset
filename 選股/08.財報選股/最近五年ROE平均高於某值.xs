{@type:filter}
input:r1(15,"平均報酬率");

if average(GetField("股東權益報酬率","Y"),5)>r1
then ret=1;

outputfield(1,GetField("股東權益報酬率","Y"),1,"最近一年");
outputfield(2,GetField("股東權益報酬率","Y")[1],1,"前一年");
outputfield(3,GetField("股東權益報酬率","Y")[2],1,"前兩年");
outputfield(4,GetField("股東權益報酬率","Y")[3],1,"前三年");
outputfield(5,GetField("股東權益報酬率","Y")[4],1,"前四年");
outputfield(6,average(GetField("股東權益報酬率","Y"),5),1,"平均");
