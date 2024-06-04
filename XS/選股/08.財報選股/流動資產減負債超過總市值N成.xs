{@type:filter|@guid:a50a3ce6ec844b9d82bba5200eec6355|@path:/08.財報選股/流動資產減負債超過總市值N成}
input:ratio(80,"比率下限");

value1=GetField("流動資產","Q");//單位百萬
value2=GetField("負債總額","Q");//單位百萬
value3=GetField("總市值","D");//單位億

if (value1-value2)>=value3*ratio
then ret=1;