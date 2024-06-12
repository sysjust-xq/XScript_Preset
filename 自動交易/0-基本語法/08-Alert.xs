{@type:autotrade}
{
	Alert語法
	
	在交易腳本內也可以透過Alert語法產生'通知'. 	
}

var: alert_condition(false);		{ 何時通知 }

if alert_condition then begin
	{ 呼叫Alert函數, 傳入要通知的訊息 }
	alert("這是我想要顯示的通知訊息");
	
	{ 也可以一次傳入多個參數, 系統會把這些參數串連成一個字串, 用空白字元來分隔 }
	
	alert("目前Bar時間=", FormatTime("HH:mm", Time));
end;

{ 
	
	Alert的通知會出現在以下的畫面內
	
	a. 自動交易中心, 策略執行記錄內(類別為警示)
	b. 即時監控畫面(請記得來源要勾選'自動交易')
	c. 警示提示視窗(請記得來源要勾選'自動交易')
	
	如果自動交易策略啟動推播的話, Alert也會傳送到手機端		
}



	
	
	