{@type:filter}
input:Leng1(5),Leng2(20),Leng3(60);

variable: ma1(0), ma2(0), ma3(0);

SetInputName(1,"短均線");
SetInputName(2,"中均線");
SetInputName(3,"長均線");

settotalbar(3);

ma1 = average(close, Leng1);
ma2 = average(close, Leng2);
ma3 = average(close, Leng3);

condition1 = close < ma1;
condition2 = ma1 < ma2;
condition3 = ma2 < ma3;

if condition1 and condition2 and condition3 then 
ret = 1;

SetOutputName1("短均線");   
OutputField1(ma1);
SetOutputName2("中均線");   
OutputField2(ma2);
SetOutputName3("長均線");   
OutputField3(ma3);







