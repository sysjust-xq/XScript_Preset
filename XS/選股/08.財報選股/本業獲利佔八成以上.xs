{@type:filter|@guid:f4ae9803d26148e68e8be3a5ca1e9b46|@path:/08.財報選股/本業獲利佔八成以上}
value1=GetField("營業利益","Q");//單位百萬
value2=GetField("稅前淨利","Q");//單位百萬
if value2>0
then begin
if value1/value2*100>80
then ret=1;
end;