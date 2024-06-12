{@type:autotrade}
// 宣告參數
Input: Length(20, "期數"), UpperBand(2, "通道上緣"), LowerBand(2, "通道下緣");
variable: mid(0), up(0), down(0);

// 資料讀取筆數設定
settotalbar(Length + 3);

up = bollingerband(Close, Length, UpperBand);
down = bollingerband(Close, Length, -1 * LowerBand);
mid = (up + down) / 2;

// 多方包寧傑通道進場策略：最低價觸碰下軌道。出場策略：最高價觸碰上軌道。
if low cross under down then setposition(1);
if high cross over up then setposition(0);		