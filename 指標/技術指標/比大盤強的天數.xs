{@type:indicator|@guid:a49778867f7f4cd99c02b20ed1a4cd41|@path:/技術指標/比大盤強的天數|@hash:115faa5755d4cf996ee9f245ceab1e4b}
{
指標說明
https://xstrader.net/股性系列之七-比大盤強的天數/
}

input:day(10,"統計天數");
input:period(20,"平滑天數");

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

value1=GetField("強弱指標");
value2=countif(value1>1,day);
value3=average(value2,period);

plot1(Value2,"比大盤強的天數");
plot2(value3,"移動平均");
