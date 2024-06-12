{@type:indicator}
{
指標說明
https://xstrader.net/個股儀表板演化的交易策略/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 330頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

condition1=false;
condition2=false;
condition3=false;
condition4=false;
condition5=false;
condition6=false;
condition7=false;
condition8=false;
condition9=false;
condition10=false;

switch(close)
begin
	case >150: value5=low*0.9;
	case <50 : value5=low*0.98;
	default: value5=low*0.95;
end;

//==========日KD黃金交叉================
input: _TEXT1("===============","KD參數");
input: Length_D(9,"日KD期間");

variable:rsv_d(0),kk_d(0),dd_d(0),c5(0);

stochastic(Length_D, 3, 3, rsv_d, kk_d, dd_d);
c5=barslast(kk_d crosses over dd_d);
if c5=0 and c5[1]>20 then 
	condition1=true;
if condition1 then
	plot1(value5,"月KD高檔鈍化且日KD黃金交叉");

//============內外盤量比差====================
variable:c3(0);
value6=GetField("內盤量");//單位:元
value7=GetField("外盤量");//單位:元
if volume<>0 then begin
	value8=value7/volume*100;//外盤量比
	value9=value6/volume*100;//內盤量比
end;
value10=average(value8,5);
value11=average(value9,5);
value7=value10-value11+5;
c3=barslast(value7 crosses over 0);
if c3=0 and c3[1]>20 then
	condition2=true;
if condition2 then
	plot2(value5*0.99,"內外盤量比差");

//===========淨力指標==============
input: _TEXT2("===============","淨力指標參數");
input:period2(10,"長期參數");

variable:c4(0);

value12=summation(high-close,period2);//上檔賣壓
value13=summation(close-open,period2); //多空實績
value14=summation(close-low,period2);//下檔支撐
value15=summation(open-close[1],period2);//隔夜力道
if close<>0 then
	value16=(value13+value14+value15-value12)/close*100;
c4=barslast(value16 crosses over -4);
if c4=0 and c4[1]>20 then
	condition3=true;
if condition3 then
	plot3(value5*0.98,"淨力指標");

//===========多頭起漲前的籌碼收集================
variable:c2(0);
//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。
if getfieldDate("date") <> getfieldDate("分公司買進家數") and GetField("成交量") = 0 then value1=GetField("分公司買進家數");
if getfieldDate("date") <> getfieldDate("分公司賣出家數") and GetField("成交量") = 0 then value2=GetField("分公司賣出家數");
value3=value2-value1;
value4=countif(value3>20,10);
c2=barslast(value4>6);
if c2=0 and c2[1]>20 then
	condition4=true;
if condition4=true then
	plot4(value5*0.97,"籌碼收集");

//===========法人同步買超====================
variable: v1(0),v2(0),v3(0),c1(0);
v1=GetField("外資買賣超");
v2=GetField("投信買賣超");
v3=GetField("自營商買賣超");
c1= barslast(maxlist2(v1,v2,v3)>100);
if c1=0 and c1[1]>20 then
	condition5=true;
if condition5=true then
	plot5(value5*0.96,"法人同步買超");

//========DIF-MACD 翻正=============
input: _TEXT3("===============","MACD參數");
input: FastLength(12,"DIF短天數"), SlowLength(26, "DIF長天數"), MACDLength(9, "MACD天數");
variable: difValue(0), macdValue(0), oscValue(0);
MACD(weightedclose(), FastLength, SlowLength,MACDLength, difValue, macdValue, oscValue);
variable:c6(0);
c6=barslast(oscValue Crosses Above 0);
if c6=0 and c6[1]>20 then
	condition6=true;
if condition6 then
	plot6(value5*0.95,"DIF-MACD 翻正");

//========資金流向======================
variable: m1(0),ma1(0),c7(0);
m1=GetField("資金流向");
ma1=average(m1,20)*1.5;
c7=barslast(m1 crosses over ma1 and close>close[1]);
if c7=0 and c7[1]>20 then
	condition7=true;
if condition7 then
	plot7(value5*0.94,"資金流向");
	
//=========總成交次數================
variable: t1(0),mat1(0),c8(0);
t1=GetField("總成交次數","D");
mat1=average(t1,20)*1.5;
c8=barslast(t1 crosses over mat1 and close>close[1]);
if c8=0 and c8[1]>20 then
	condition8=true;
if condition8 then 
	plot8(value5*0.93,"成交次數");
	
//=========強弱指標==================
variable:s1(0),c9(0);
s1=GetField("強弱指標","D");
c9=barslast(trueall(s1>0,3));
if c9=0 and c9[1]>20 then
	condition9=true;
if condition9 then
	plot9(value5*0.92,"強弱指標");
	
//============開盤委買================
variable:b1(0),mab1(0),c10(0);
b1=GetField("主力買張");
mab1=average(b1,10);
c10=barslast(b1 crosses over mab1);
if c10=0 and c10[1]>10 then
	condition10=true;
if condition10 then 
	plot10(value5*0.91,"主力買張");