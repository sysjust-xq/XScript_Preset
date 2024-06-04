{@type:indicator|@guid:8777e88a9afe4eb19a3fd128d229e78b|@path:/技術指標/價量齊揚天數|@hash:2ca528c28fadfa9fa568fc021c39073a}
{
指標說明
https://xstrader.net/從相對的角度尋找真正價量齊揚的股票-2/
}

input:sp(10,"短計算區間");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

variable:count1(0) ;

value1=GetField("資金流向");
value2=GetField("強弱指標");
count1=countif(value2>0and value1>value1[1],sp);
value3=average(count1,5);

plot1(value3/SP*100,"短期價量齊揚天數");