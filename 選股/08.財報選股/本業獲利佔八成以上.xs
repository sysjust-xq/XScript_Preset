{@type:filter}
value1=GetField("營業利益","Q");//單位百萬
value2=GetField("稅前淨利","Q");//單位百萬
if value2>0
then begin
if value1/value2*100>80
then ret=1;
end;