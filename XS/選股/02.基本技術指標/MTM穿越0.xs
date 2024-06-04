{@type:filter|@guid:bf7963fc26fd42499c6cfc88026fa2d6|@path:/02.基本技術指標/MTM穿越0|@hash:8584dd0c101fca43982c466a7ff01ada}
// MTM往上穿越0軸
//
Input: Length(10);

SetInputName(1, "期數");

settotalbar(maxlist(Length,6));

Ret = Momentum(Close, Length) Crosses Above 0;
