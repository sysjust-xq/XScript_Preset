{@type:sensor}
//透過switch..case的語法，可以在一個變數的數值不一樣時，往不同的流程進行
//例如要計算外資過去十天買超超過七天時，可以運用以下的語法來寫腳本 

//==============================範例：外資近日買超天數比例======================

//1.宣告參數：利用input宣告輸入的參數。
input:day(10);//過去幾天 
input:ratio(0.7);//外資買超的天數佔多少比例

//2.宣告變數，利用variable
value1=GetField("Fdifference");//外資買賣超
variable:count(0);
variable:xi(0);

for xi= 1 to day
begin
	//============================================
	switch(value1[xi])
	begin
		case >0:
			count=count+1;
		case <0:
			count=count;
		case 0:
			count=count;
	end;//所有case都表達完之後，最後必須加end;來表示各種數值選項已結束
	//============================================
end;

//6.設定警示條件：if.. then ret=1;
if day<>0 and count/day>=ratio
then ret=1;
