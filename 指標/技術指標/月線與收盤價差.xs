{@type:indicator}
{
指標說明
https://xstrader.net/自訂指標/
}

value1=average(close,22);
value2=close-value1;
value3=average(value2,3);

plot1(value3,"月線與收盤價差三日移動平均");
plot2(0);