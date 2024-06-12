{@type:sensor}
//近三天內ma及macd都發生過死亡交叉
input: FastLength(12); SetInputName(1, "DIF短期期數");
input: SlowLength(26); SetInputName(2, "DIF長期期數");
input: MACDLength(9);  SetInputName(3, "MACD期數");
input: Shortlength(5); setinputname(4,"短期均線期數");
input: Longlength(10); setinputname(5,"長期均線期數");
input: Length(20);     setinputname(6,"設定波段區間"); 
input: Ratio(20);      setinputname(7,"設波段上漲幅度"); 
input: ReactRatio(5);  setinputname(8,"距波段高點的跌幅"); 
input:TXT("建議使用日線"); setinputname(9,"使用說明");

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 11);

if close >= lowest(close,Length)* (1+ Ratio/100) and
   close >= (1-ReactRatio/100)*highest(close,Length) then
begin

variable: price(0);  
price  = WeightedClose();
Value1 = XAverage(price, FastLength) - XAverage(price, SlowLength);//DIF
Value2 = XAverage( Value1, MACDLength ) ;//MACD
Value3 = Value1 - Value2 ;//OSC
{===============================================================}
value4=average(close,5);
value5=average(close,10);
value6=value4-value5;
{===============================================================}

condition1 = TrueAny( value3 crosses under 0 ,3);
condition2 = TrueAny( value6 crosses under 0 ,3);

if condition1 and condition2 
then ret=1;

end;