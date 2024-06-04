{@type:indicator|@guid:ccd02a0e9b794eb390504dc3fbdcba5b|@path:/技術指標/DMI|@hash:862fcead35610754a96bc2128496cafd}
{
指標說明
https://xstrader.net/787/
}

input:length(10,"期數");

variable: pdi_value(0), ndi_value(0), adx_value(0);

DirectionMovement(Length, pdi_value, ndi_value, adx_value);
value1=pdi_value-ndi_value;

plot1(pdi_value,"向上力量");
plot2(ndi_value,"向下力量");
plot3(value1,"多空力道差");

