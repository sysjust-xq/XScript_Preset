{@type:sensor|@guid:17821bca2bf3490bb81307aeaf50e040|@path:/波段操作型/月線連兩個月收紅的小型股}
input:TXT("僅適用日線","使用限制");

settotalbar(120);

if  GetField("總市值","D")<2000000000 //單位是元
and close<40
and getfield("close","M")[1]>getfield("close","M")[2] 
and getfield("close","M")[2]>getfield("close","M")[3]
then ret=1;
