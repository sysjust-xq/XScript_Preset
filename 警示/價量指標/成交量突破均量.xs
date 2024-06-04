{@type:sensor|@guid:b20b5fa767e241f1ae96d5fcf8eb5800|@path:/價量指標/成交量突破均量|@hash:3c9f27b39407abab26ef29c186196bc5}
input: length(20);  setinputname(1,"均量期數");
input: confirmVolume(500);  setinputname(2,"突破均量張數");

settotalbar(3);
setbarback(Length);

if volume > Average( volume[1],length) +confirmVolume then ret=1;



        