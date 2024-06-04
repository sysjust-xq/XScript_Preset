{@type:filter|@guid:f3edc34151b948bdafcb025fce093e83|@path:/01.常用過濾條件/過濾低價股票|@hash:c2db4e13c82f9f61a32e39b084924072}
input:PriceLimit(5);

SetInputName(1, "最小股價");

SetTotalBar(3);

Ret = close > PriceLimit;
