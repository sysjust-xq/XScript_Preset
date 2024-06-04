{@type:filter|@guid:8b5dde752f6a4fbb94548c3cae719864|@path:/11.選股機器人/毛利率創一年新高}
value1=GetField("營業毛利率","Q");
if value1=highest(value1,12)
then ret=1;