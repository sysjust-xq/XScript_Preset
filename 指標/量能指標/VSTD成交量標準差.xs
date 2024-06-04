{@type:indicator|@guid:c5c57261729a44bba9a061e52b1b5aaa|@path:/量能指標/VSTD成交量標準差|@hash:b99719210aac1eddbf807d062f39e33b}
input:Period(22,"期數");

variable:VSTD(0);
VSTD=standarddev(VOLUME,Period,1);

PLOT1(VSTD,"VSTD");
