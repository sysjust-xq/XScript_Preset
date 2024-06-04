{@type:sensor|@guid:39bfd582bdf640fcacbc7dc4f95e7ab0|@path:/價量指標/成交量突破N倍均量|@hash:38511ea707cd22a5a10dc70d96076684}
input: length(20);  setinputname(1,"均量期數");
input: VolumeXtime(3);  setinputname(2,"量增倍數");

settotalbar(3);
setbarback(Length);

if volume > Average( volume[1],length)* VolumeXtime then ret=1;



