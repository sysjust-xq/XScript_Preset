{@type:indicator|@guid:787f2ea84d9f483a90590760c9ae6259|@path:/大盤指標/大盤多空指標|@hash:3ae55d34283d5c04b51e5aa34b7b9d2e}
{
指標說明
https://xstrader.net/打造自己的大盤多空函數/
}

input:Length(7,"計算天數");
input:LowLimit(5,"外資買超天數");

plot1(tselsindex(Length,LowLimit));