{@type:indicator}
input:Period(22,"期數");

variable:VSTD(0);
VSTD=standarddev(VOLUME,Period,1);

PLOT1(VSTD,"VSTD");
