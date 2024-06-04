{@type:indicator|@guid:9b1de816b31b4055abd11c36f7ea5eab|@path:/技術指標/上漲下跌角度線|@hash:d788aa9825c77bf3e76a02a37e9e3fc0}
{
指標說明
https://xstrader.net/漲勢加速的股票怎麼寫順便介紹angle這個函數/
}

input: periods(5, "期數");
 
Value1 = Angle(Date[periods], Date);

Plot1(Value1, "角度");