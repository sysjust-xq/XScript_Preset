{@type:indicator}
{
指標說明
https://xstrader.net/漲勢加速的股票怎麼寫順便介紹angle這個函數/
}

input: periods(5, "期數");
 
Value1 = Angle(Date[periods], Date);

Plot1(Value1, "角度");