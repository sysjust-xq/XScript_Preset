{@type:sensor|@guid:0ea38424f60e40d0a529f5c830e1a15f|@path:/價量指標/多方人氣表態|@hash:732835d269ea44e98b53d298da59641c}
settotalbar(3);
if Close > highD(1) and GetField("Volume", "D")>  GetField("Volume", "D")[1] then ret=1;  