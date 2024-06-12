{@type:sensor}
//陣列可以用來存放多個相同屬性的變數值，而不需重複宣告

//2.宣告變數，利用variable
variable: i(0); //用來做迴圈的
//宣告陣列，名稱ValueArray，內含100個元素，索引值從0到99，初始值為0
array:ValueArray[99](0);

//利用迴圈將陣列的每個元素填入對應的值，
//例如：把過去1~99的High指到ValueArray裡
//使得 ValueArray[1] =High[1] ,ValueArray[2] =High[2],
//     ValueArray[3] =High[3] ... ValueArray[99] =High[99]
for  i = 1 to 99
begin
	ValueArray[i] = High[i] ;
end;

//陣列可以透過內建函數做運算
//如果要全部加總
value1 = Array_Sum(ValueArray,1,99);
//或是從第 7個加到第20個
value1 = Array_Sum(ValueArray,7,20);

//6.設定警示條件：if.. then ret=1;
if value1 >= close * 14
then ret=1;
