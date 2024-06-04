{@type:indicator|@guid:3d28b6f8a7294911ba93307b2d5c9b37|@path:/量能指標/BBI多空指數|@hash:f14972f656d6e8836e7a0c2b017bff66}
{
指標說明
https://xstrader.net/用自訂指標來看a股後市/
}

input:
a1(3,"第一根均線天期"),
a2(6,"第二根均線天期"),
a3(12,"第三根均線天期"),
a4(24,"第四根均線天期");

variable:BBI(0);

BBI=(average(close,a1)+average(close,a2)+average(close,a3)+average(close,a4))/4;
plot1(close-bbi,"多空線");



