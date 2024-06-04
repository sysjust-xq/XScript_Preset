{@type:sensor|@guid:a66ff41772f24ffb8e4b8e94aa095014|@path:/3.出場常用警示/乖離過大|@hash:945d8bf9ef8bdd50957d0200a8b67602}
input:Length(200); setinputname(1,"計算期數");
input:Ratio(70); setinputname(2,"正向乖離門檻%");

settotalbar(Length + 3);

if close/average(close,Length)>= 1+Ratio/100
then ret=1;