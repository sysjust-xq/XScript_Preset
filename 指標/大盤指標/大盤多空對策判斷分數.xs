{@type:indicator}
{
指標說明
https://xstrader.net/大盤多空對策訊號/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 265頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

if barfreq <> "D" then raiseruntimeerror("僅支援日頻率");

variable: XData(0),YData(0),ZData(0),Z(0),count(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;

//每天的分數都先歸零
if date <> date[1] then 
	count=0;

//外資買超
XData = GetField("外資買賣超金額")[Z];
if xdata > 0 then 
	count=count+1;

//投信買超
YData = GetField("投信買賣超金額")[Z];
if ydata > 0 then
	count=count+1;

//自營商買超
ZData = GetField("自營商買賣超金額")[Z];
if zdata > 0 then 
	count=count+1;

//上漲量超過一半
value6 = GetField("上漲量");
if value6/volume > 0.5 then
	count=count+1;

//外盤量超過一半
value7 = GetField("外盤量");
if value7/volume>0.5 then
	count=count+1;

//RSI多頭
value8=rsi(close,5);
value9=rsi(close,10);
if value8 > value9 and value8 < 90 then
	count=count+1;

//MACD 多頭
variable:Dif_val(0), MACD_val(0), Osc_val(0);
MACD(Close, 12, 26, 9, Dif_val, MACD_val, Osc_val);
if osc_val > 0 then
	count=count+1;

//MTM  多頭
value10=mtm(10);
if value10 > 0 then
	count=count+1;

//KD多頭
variable:rsv1(0),k1(0),d1(0);
stochastic(9,3,3,rsv1,k1,d1);
if k1 > d1 and k1 < 80 then
	count=count+1;

//+DI>-DI
variable:pdi_value(0),ndi_value(0),adx_value(0);
DirectionMovement(14,pdi_value,ndi_value,adx_value);
if pdi_value > ndi_value then
	count=count+1;

//AR趨勢向上
value14=ar(26);
value15=linearregslope(value14,5);
if value15 > 0 then 
	count=count+1;

//ACC大於零
value16=acc(10);
if value16 > 0 then 
	count=count+1;

//TRIX多頭
value17=trix(close,9);
value18=trix(close,15);
if value17 > value18 then
	count=count+1;

//SAR多頭
value19=SAR(0.02, 0.02, 0.2);
if close > value19 then
	count=count+1;

//週線大於月線
if average(close,5) > average(close,20) then
	count=count+1;

//計算平均分數
value11=average(count,10);
plot1(value11,"分數");
Plot2(10,"多");
plot3(5,"空");