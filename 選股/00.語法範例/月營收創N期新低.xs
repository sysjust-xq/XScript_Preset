{@type:filter}
input:N(13); setinputname(1, "期別"); 

SetTotalBar(3); 

if GetField("月營收", "M") <= Lowest(GetField("月營收", "M"),N) then ret=1; 

SetOutputName1("月營收"); 
OutputField1(GetField("月營收", "M")); 
