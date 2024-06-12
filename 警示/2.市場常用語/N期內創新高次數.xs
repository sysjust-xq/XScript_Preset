{@type:sensor}
input:Length(10); setinputname(1,"N期內");
input:mNewHighTimes(3); setinputname(2,"創M次以上新高");
 
variable: la(Length-1); //日數與參數調整
variable: QHigh(0); Qhigh=high[la]; //含當根K棒 最左邊第一筆資料起算
variable: _outputdays(0);　　_outputdays=0; //每跟K要歸0
variable: i(0); //迴圈用數

settotalbar(Length + 3);
 
for i = 1 to la begin  
     if ( high[la-i]  > QHigh ) then
      begin
        _outputdays+=1;　　
      　QHigh = high[la-i];
     end; 
end;

if high = QHigh and _outputdays >= mNewHighTimes then ret=1;