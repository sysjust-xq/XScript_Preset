{@type:sensor}
input:v1(2000,"委買五檔總金額(萬)");
input:v2(500,"委賣五檔總金額(萬)");
input:v3(1500,"委買委賣總差額(萬)");
input:v4(400,"單一價位委買金額下限");
input:v5(100,"單一價位委賣金額上限");

variable:bidtv(0),asktv(0),tb(0),ta(0),b1(0),b2(0),b3(0),b4(0),b5(0),s1(0),s2(0),s3(0),s4(0),s5(0);
condition1=false;
condition2=false;
condition3=false;

bidtv=q_SumBidSize;//總委買
asktv=q_SumAskSize;//總委賣

value1=q_BestBidSize1;//委買一
value2=q_BestBidSize2;
value3=q_bestbidsize3;
value4=q_bestbidsize4;
value5=q_bestbidsize5;

value6=q_bestasksize1;//委賣一
value7=q_bestasksize2;
value8=q_bestasksize3;
value9=q_bestasksize4;
value10=q_bestasksize5;

tb=bidtv*close/10;
ta=asktv*close/10;

if tb>v1 and ta<v2 and tb-ta>v3
then condition1=true;

b1=value1*close/10;
b2=value2*close/10;
b3=value3*close/10;
b4=value4*close/10;
b5=value5*close/10;
s1=value6*close/10;
s2=value7*close/10;
s3=value8*close/10;
s4=value9*close/10;
s5=value10*close/10;

if minlist(b1,b2,b3,b4,b5)>v4
then condition2=true;

if maxlist(s1,s2,s3,s4,s5)<v5
then condition3=true;

if close<>GetField("漲停價", "D") then begin
	if  condition1 
	or (condition2 and condition3)
	then ret=1; 
end;



