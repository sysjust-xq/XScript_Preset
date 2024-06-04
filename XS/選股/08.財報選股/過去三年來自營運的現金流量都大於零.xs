{@type:filter|@guid:e4770d0622f34daaa33b1a5181a1f675|@path:/08.財報選股/過去三年來自營運的現金流量都大於零}
value1=GetField("來自營運之現金流量","Y");
if trueall(value1>0,3)
then ret=1;