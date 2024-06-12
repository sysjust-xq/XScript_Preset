{@type:function}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對特定欄位的數值進行排序
// 使用者可以自行替換成需要使用的欄位
//
//

retval = GetField("收盤價");

{
//同理，當日漲跌幅的排行榜就會是：
retval = GetField("漲跌幅");
}