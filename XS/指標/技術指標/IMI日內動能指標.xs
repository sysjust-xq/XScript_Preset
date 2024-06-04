{@type:indicator|@guid:70dd2e611cc34d629989f584b6950b9b|@path:/技術指標/IMI日內動能指標|@hash:e5eb82265513dfb9d14f6fee3a6fcd3a}
input:length(10);		setinputname(1, "天期");
   
variable:up(0),dn(0),upi(0),dni(0),imi(0);   

if close > open then   
  up = close-open   
else   
  up = 0;   

if close < open then   
  dn = open-close   
else   
  dn = 0;   

upi = summation(up,length);   
dni = summation(dn,length);   
if upi+dni = 0 then imi = 0 else imi = upi/(upi+dni)*100;   

plot1(imi, "IMI");  
