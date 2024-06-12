{@type:sensor}
input: Length(20);       setinputname(1,"計算期數");
input: VLength(10);      setinputname(2,"均量期數");
input: volpercent(50);   setinputname(3,"爆量增幅%");
input: Rate(5);          setinputname(4,"離低點幅度%");

settotalbar(3);
setbarback(maxlist(Length,VLength));

if Close >  Close[1] and
   Volume >=  average(volume,VLength) *(1+ volpercent/100) and
   Close <= lowest(close,Length) * (1+Rate/100)
then ret=1;

