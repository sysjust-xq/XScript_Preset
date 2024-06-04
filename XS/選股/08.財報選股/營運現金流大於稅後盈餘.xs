{@type:filter|@guid:670abc9cb5e84a109fe1fc5edccefb85|@path:/08.財報選股/營運現金流大於稅後盈餘}
settotalbar(3);

value1=GetField("來自營運之現金流量","Q");
value2=GetField("本期稅後淨利","Q");
if value1 > value2
then ret=1;
