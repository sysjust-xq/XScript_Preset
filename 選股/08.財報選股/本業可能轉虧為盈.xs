{@type:filter}

SetTotalbar(3);

// 計算最新一期月營收的日期(mm=月份)
//
variable: mm(0);
mm = datevalue(getfielddate("月營收","M"),"M");

// 預估最新一季的季營收(單位=億)
//
if mm=1 or mm=4 or mm=7 or mm=10
then value1=GetField("月營收","M") * 3;
if mm=2 or mm=5 or mm=8 or mm=11
then value1=GetField("月營收","M") * 2 + GetField("月營收","M")[1];
if mm=3 or mm=6 or mm=9 or mm=12
then value1=GetField("月營收","M")+GetField("月營收","M")[1]+GetField("月營收","M")[2];

// 預估獲利(單位=百萬) = 季營收 * 毛利率 - 營業費用
//
value2 = value1 * GetField("營業毛利率","Q") - GetField("營業費用","Q");

if value2 > 0 and GetField("營業利益","Q") < 0 then
ret = 1;

SetOutputName1("預估單季營收(億)");
OutputField1(value1);

SetOutputName2("預估單季本業獲利(億)");
OutputField2(value2 / 100);



