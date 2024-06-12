{@type:indicator}
{
指標說明
https://xstrader.net/亂世中最佳投資組合/
}

array:ValueArray[6](0);

valuearray[1]=GetSymbolField("LMT.US","收盤價");
valuearray[2]=GetSymbolField("BA.US","收盤價");
valuearray[3]=GetSymbolField("RTN.US","收盤價");
valuearray[4]=GetSymbolField("GD.US","收盤價");
valuearray[5]=GetSymbolField("NOC.US","收盤價");
valuearray[6]=GetSymbolField("UTX.US","收盤價");

value1=array_sum(valuearray,1,6);

plot1(value1);