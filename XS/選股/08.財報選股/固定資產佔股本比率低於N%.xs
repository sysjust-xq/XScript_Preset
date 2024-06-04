{@type:filter|@guid:e0a91104b3734e5d91395fdcb276d47b|@path:/08.財報選股/固定資產佔股本比率低於N%}
input:r1(10,"固定資產佔股本比例(單位%)");

value1=GetField("最新股本");//單位億
value2=GetField("固定資產","Q");
value3=value2/(value1*100);

if value3<r1/100
then ret=1;