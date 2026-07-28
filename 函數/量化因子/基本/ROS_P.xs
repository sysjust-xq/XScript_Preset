{@type:function}
// ROS_P

// 設定
Var: ratio(0);
Var: ROS(0);
settotalBar(120);

// 因子
Value99 = GetField("稅後淨利率", "Q") / GetField("收盤價", "AD");
If Value99<>0 Then retVal = Value99;