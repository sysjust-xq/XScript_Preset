{@type:indicator}
{
指標說明
https://xstrader.net/雙k棒可以延伸的多空趨勢指標/
}

array:k[22](0);
if close<>0 then begin
	//最近一日與前一日的多空力道總差額
	k[1]=(open-open[1])/close;
	k[2]=(high-high[1])/close;
	k[3]=(low-low[1])/close;
	k[4]=(close-close[1])/close;
	//當日
	k[5]=(high-low)/close;
	k[6]=(high-close)/close;
	k[7]=(high-open)/close;
	k[8]=(open-low)/close;
	k[9]=(close-open)/close;
	k[10]=(close-low)/close;
	k[11]=(open-high[1])/close;
	k[12]=(open-low[1])/close;
	k[13]=(open-close[1])/close;
	k[14]=(high-open[1])/close;
	k[15]=(high-low[1])/close;
	k[16]=(high-close[1])/close;
	k[17]=(low-open[1])/close;
	k[18]=(low-high[1])/close;
	k[19]=(low-close[1])/close;
	k[20]=(close-open[1])/close;
	k[21]=(close-high[1])/close;
	k[22]=(close-low[1])/close;
end;

array: v1[8](0);
v1[1]=k[1]+k[11]+k[12]+k[13];//隔日開盤多空總力道
v1[2]=k[1]+k[2]+k[3]+k[4];//隔日多空總力道
v1[3]=k[20]+k[21]+k[22];//隔日收盤多空結果
v1[4]=k[9]+k[10]-k[6];//當日收盤多空結果
v1[5]=k[14]+k[15]+k[16];//多頭最大力量
v1[6]=(k[17]+k[18]+k[19])*-1;//空頭最大力量
v1[7]=k[7]+k[9]+k[10];//當日多頭最大力量
v1[8]=k[6]+k[8]-k[10];//當日空頭最大力量

value1=v1[1]+v1[2]+v1[3]+v1[4];
value2=v1[5]+v1[7];
value3=v1[6]+v1[8];
plot1(average(value1,5),"多空淨力");
plot2(average(value2,5),"多頭總力");
plot3(average(value3,5),"空頭總力");

