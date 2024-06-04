{@type:function|@guid:d605f69234764acf8713c2137ba09729|@path:/排行/收盤價排行榜|@hash:54db5b7b5a64e1a65ce5f2616cd0f897}
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