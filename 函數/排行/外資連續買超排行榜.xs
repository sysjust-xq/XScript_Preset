{@type:function|@guid:24cfc3267d7e4a4484c1de9a82b9a67c|@path:/排行/外資連續買超排行榜|@hash:6389f9d0ac205e1d8f4f0e6953c9a9d8}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何依外資連續N期買超的張數進行排序
// 使用者可以自行替換成需要使用的欄位
//
// Length是期數
//

input:
	Length(10, numericsimple, "計算期間");

if TrueAll(GetField("外資買賣超") > 0, Length) Then
   retval = Summation(GetField("外資買賣超"), Length)
Else
   return;

{ 
//如果要排序投信連續買超，可以改用"投信買賣超"的欄位:
if TrueAll(GetField("投信買賣超") > 0, Length) Then
   retval = Summation(GetField("投信買賣超"), Length)
Else
   return;

//如果要排序自營商連續買超，可以改用"自營商買賣超"的欄位:
if TrueAll(GetField("自營商買賣超") > 0, Length) Then
   retval = Summation(GetField("自營商買賣超"), Length)
Else
   return;
   
//可以依需要自行更換欄位
}