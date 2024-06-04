{@type:indicator|@guid:32faa5a1ec9f4684b68073c082bbc836|@path:/技術指標/月線與收盤價差|@hash:4f4d9b4f7be3c399e038c180239e9149}
{
指標說明
https://xstrader.net/自訂指標/
}

value1=average(close,22);
value2=close-value1;
value3=average(value2,3);

plot1(value3,"月線與收盤價差三日移動平均");
plot2(0);