{@type:autotrade}
// 宣告參數
input: Length(9, "計算期數"), RSVt(3, "RSVt權數"), Kt(3, "Kt權數"), LowBound(25, "低檔區"), HighBound(75, "高檔區");
variable: _rsv(0), _k(0), _d(0);

// 資料讀取筆數設定
SetTotalBar(maxlist(Length,6) * 3 + 8);

Stochastic(Length, RSVt, Kt, _rsv, _k, _d);
		
// 空方進場策略：K在高檔區由上往下穿越D值。出場策略：K由下往上突破D值。
if _k > HighBound and _k crosses under _d then setposition(-1);
if _k < LowBound and _k crosses above _d then setposition(0);