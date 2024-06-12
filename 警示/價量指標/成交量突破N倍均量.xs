{@type:sensor}
input: length(20);  setinputname(1,"均量期數");
input: VolumeXtime(3);  setinputname(2,"量增倍數");

settotalbar(3);
setbarback(Length);

if volume > Average( volume[1],length)* VolumeXtime then ret=1;



