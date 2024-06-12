{@type:sensor}
input:Length(10); setinputname(1,"n期內");
input:mNewLowTimes(3); setinputname(2,"創幾次以上新低");
 
variable: la(Length-1); //日數與參數調整
variable: QLow(0); QLow=Low[la]; //含當根K棒 最左邊第一筆資料起算
variable: _outputdays(0);　　_outputdays=0; //每跟K要歸0
variable: i(0); //迴圈用數

settotalbar(Length + 3);
 
for i = 1 to la begin  
     if ( Low[la-i]  < QLow ) then
      begin
        _outputdays+=1;　　
      　QLow = Low[la-i];
     end; 
end;

if Low = QLow and _outputdays >= mNewLowTimes then ret=1;