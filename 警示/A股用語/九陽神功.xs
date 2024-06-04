{@type:sensor|@guid:8e69759dd9d1488f9ed7b986a9bf6bbe|@path:/A股用語/九陽神功|@hash:c2cb55b49b9fe9dcd10f37c8801a9a55}
// 連續9筆上漲
settotalbar(10);
Ret = TrueAll(Close > Close[1], 9);
