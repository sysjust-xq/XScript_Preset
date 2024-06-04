{@type:indicator|@guid:364c78cce1d04a4eb5aa9b6da296b962|@path:/大盤指標/本土天王平均|@hash:ee384dd2952ebb66d0332cbe5710f770}
{
指標說明
https://xstrader.net/亂世中最佳投資組合/
}

array:ValueArray[12](0);

valuearray[1]=GetSymbolField("1216.tw","收盤價");
valuearray[2]=GetSymbolField("2201.tw","收盤價");
valuearray[3]=GetSymbolField("2412.tw","收盤價");
valuearray[4]=GetSymbolField("1707.tw","收盤價");
valuearray[5]=GetSymbolField("2207.tw","收盤價");
valuearray[6]=GetSymbolField("2905.tw","收盤價");
valuearray[7]=GetSymbolField("2912.tw","收盤價");
valuearray[8]=GetSymbolField("5530.tw","收盤價");
valuearray[9]=GetSymbolField("8454.tw","收盤價");
valuearray[10]=GetSymbolField("1507.tw","收盤價");
valuearray[11]=GetSymbolField("9933.tw","收盤價");
valuearray[12]=GetSymbolField("9941.tw","收盤價");
value1=array_sum(valuearray,1,12);

plot1(value1);