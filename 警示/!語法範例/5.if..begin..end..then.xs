{@type:sensor}
//當我們的條件需要多行敘述才能完成時，
//可以用begin..end來標示。

//=====================範例：累積漲幅達X%並且今日跳空開高超過Y%=======================================

//例如若要找出前N日漲幅超過X%且今天跳空開高超過Y%的股票

//1.宣告參數：利用input宣告輸入的參數。
input:N(3);//前N日
input:X(10);//前n日漲幅%
input:_Y(4);//缺口大小%

if open>high[1] then //跳空開高
//用begin來呈現if 之後要執行的不只一件的事情
begin
value1=(1-close[1]/close[N])*100;//計算前N天的漲幅 
value2=(open-high[1])/close*100;//計算跳空缺口的大小
end;
//最後用end來宣告if之後要執行程式的結束

//6.設定警示條件：if.. then ret=1;
if value1>=X and value2>=_Y
then ret=1;
