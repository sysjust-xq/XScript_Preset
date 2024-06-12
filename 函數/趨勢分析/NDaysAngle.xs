{@type:function}
{
	計算股價N日走勢的角度

	上漲趨勢回傳值 = 0 ~ 90
	下跌趨勢回傳值 = 0 ~ -90
}

input: Length(numericsimple, "天期");

{
                      | y=<Close/Close[N]-1>
					  |
	------------------+ y=0
	
	- Y軸的數值, 是Close/Close[N]-1, 
	- 第一筆的數值是0, 如果上漲50%, 則數值 = 0.5, 如果上漲100%, 則數值=1
	
	- consider: X邊如果是N, Y邊如果是0.5(上漲50%), 那算出來的斜率 x 2N之後, 表示這是一個x=1/y=1的三角形, 角度=45度角

	上漲跟下跌的差異
	
	- 上漲100%, 例如4元漲到8元 => y = 1
	- 下跌50%, 例如8元跌到4元 => y = -0.5

}

array: thePriceArray[](0);
var: idx(0);

var: angle45(0), factor45(0);

// 定義N日上漲 x% = 45度
//
if Length <= 5 then angle45 = 30
else if Length <= 10 then angle45 = 50
else if Length <= 20 then angle45 = 75
else if Length <= 60 then angle45 = 100
else if Length <= 120 then angle45 = 150
else angle45 = 200;

// 底邊 = Length
// 高度 = 上漲%
//
factor45 = Length / (0.01 * angle45);

Array_SetMaxIndex(thePriceArray, Length);
for idx = 1 to Length begin
	thePriceArray[idx] = (Close[idx-1] / Close[Length-1] - 1) * factor45;
end;

value1 = ArrayLinearRegSlope(thePriceArray, Length);
value2 = arctangent(value1);

// 因為下跌最多就是100%, 所以算出來最多角度=-45度, 所以下跌角度會 x 2, 希望上漲角度/下跌角度可以在同一個scale內
//
if value2 < 0 then value2 = value2 * 2;
retval = value2;