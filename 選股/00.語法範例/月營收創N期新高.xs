{@type:filter|@guid:6461078a80404771b68c2700849d9a27|@path:/00.語法範例/月營收創N期新高}
input:N(13); setinputname(1, "期別"); 

SetTotalBar(3); 

if GetField("月營收", "M") >= Highest(GetField("月營收", "M"),N) then ret=1; 

SetOutputName1("月營收"); 
OutputField1(GetField("月營收", "M")); 
