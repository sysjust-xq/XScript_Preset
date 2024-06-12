{@type:indicator}
{
	XQ量能指標。
	支援日頻率。支援上市櫃普通股商品。
}

value1 = GetField("新聞正向分數") - GetField("新聞負向分數"); 
//新聞總分=正向分數－負向分數。來判斷目前的新聞聲量為正向或者負向。

plot1(value1,"新聞總分");//正向分數-負向分數
plot2(GetField("新聞聲量分數"),"新聞總量",checkbox:=1);//正向分數+負向分數
plot3(GetField("新聞正向分數"),"新聞正總量",checkbox:=0);
plot4(GetField("新聞負向分數"),"新聞負總量",checkbox:=0);