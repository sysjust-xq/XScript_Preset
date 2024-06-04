{@type:filter|@guid:79f4d0db73a4432587b4096f7be4734e|@path:/00.語法範例/月營收創N期新低}
input:N(13); setinputname(1, "期別"); 

SetTotalBar(3); 

if GetField("月營收", "M") <= Lowest(GetField("月營收", "M"),N) then ret=1; 

SetOutputName1("月營收"); 
OutputField1(GetField("月營收", "M")); 
