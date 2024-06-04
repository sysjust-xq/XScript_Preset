{@type:sensor|@guid:4d42a7632dca425b83919dff693e87f0|@path:/價量指標/當期成交量倍增|@hash:d052baf814f324a62018e727f3107d41}
input: VolumeXtime(3);   setinputname(1,"量增倍數");
settotalbar(3);
if volume > volume[1] * VolumeXtime then ret=1;
