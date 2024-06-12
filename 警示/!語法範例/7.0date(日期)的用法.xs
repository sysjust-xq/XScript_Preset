{@type:sensor}
//系統用date來表示每根bar的日期，其回傳值為yyyymmdd，例如2013年3月20日為20130320

//=========================範例：大單買進========================

//1.宣告參數：利用input宣告輸入的參數。
input: atVolume(100); //最少要求的量
input: LaTime(10); //至少要有幾次

//2.宣告變數，利用variable
value1=GetField("內外盤","Tick");//內外盤標記  內盤為-1 外盤為1

variable: Xtime(0);//計數器
variable: intrabarpersist XDate(0);

//3.引用時間序列的回傳值﹙包括開高低收成交量等﹚
//日期函數應用
if Date > XDate then Xtime =0; //開盤那根要歸0次數
XDate = Date;

if q_tickvolume > atVolume and value1>0 then  Xtime=Xtime+1; //外盤且單量夠大就加1次

//6.設定警示條件：if.. then ret=1;
if Xtime > LaTime  then ret=1; 
