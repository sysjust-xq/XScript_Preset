{@type:filter|@guid:a796fafc7ab641c8ae010c7abb4dcc62|@path:/04.價量選股/總市值跌到歷年低點}
setbarfreq("Y");
settotalbar(8);

value1=GetField("總市值","Y");
value2=lowest(value1,8);
if value1<value2*1.1
then ret=1;