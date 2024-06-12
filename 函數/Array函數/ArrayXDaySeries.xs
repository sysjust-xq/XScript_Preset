{@type:function}
{
	以Array儲存跨頻率的序列值，傳入一個序列
	

	範例:
	
	Array: CloseArray[](0);
	
	ArrayXDaySeries(GetField("收盤價","D"),SBB_length,_DayValue);
}

Input: TheSeries(numericseries, "序列");
Input: SBB_length(NumericSimple, "SetBackBar的筆數");
Input: TargetArray[X](NumericArrayRef);
Var: idx(0),_length(0),_xf_CurrentBar(0);
_length = GetBarBack("D");
_xf_CurrentBar = xf_GetCurrentBar("D");

if _length < SBB_length then raiseRunTimeError("新上市櫃商品資料引用筆數不足，所以不允計算");

if currentBar = 1 then begin
	Array_SetMaxIndex(TargetArray, _length);
	for idx = 0 to _length - 1 begin
		TargetArray[idx + 1] = TheSeries[idx];
	end;
end else begin
	if _xf_CurrentBar > _xf_CurrentBar[1] then begin
		Array_Copy(TargetArray, 1, TargetArray, 2, _length - 1);
	end;
	TargetArray[1] = TheSeries[0];
end;


