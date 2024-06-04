{@type:function|@guid:b3b330c5ea4e4b9c8e988ce259b3ac28|@path:/技術指標/DIF}
SetBarMode(1);

{
傳回XQ: MACD指標中DIF值
FastLength: 短期期數
SlowLength: 長期期數
}
input: FastLength(numeric), SlowLength(numeric);
variable: price(0);

price = WeightedClose();

DIF = XAverage(price, FastLength) - XAverage(price, SlowLength);

		