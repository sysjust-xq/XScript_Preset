{@type:autotrade}
{
此為 CancelAllOrders 的範例腳本
腳本將會在啟動時直接下出委託價為跌停價的買進委託 (只會委託一次)，若委託未成交的話則在N分鐘以後刪除委託。
需注意會依照策略設定和商品洗價而有所差異，並不一定會準時在N分鐘後刪除
}

Input: _n(5, "幾分鐘後刪除委託");

if _n < 0 then RaiseRunTimeError("設定分鐘需要大於0");

var: IntraBarPersist _time(0);

//啟動後進入交易指令可執行的區間後下單並計算出場時間
Once(Position = 0 and Filled = 0 and GetInfo("TradeMode") = 1) begin   
    SetPosition(1, GetField("跌停價", "D"), label:="跌停價買進委託");
    _time = TimeAdd(CurrentTime, "M", _n);
	end;    

//當洗價時
if CurrentTime > _time and Position <> Filled then CancelAllOrders(label:="跌停價買進委託");
