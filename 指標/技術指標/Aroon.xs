{@type:indicator}
input:length(25); setinputname(1, "計算週期");
   
variable: aroon_up(0), aroon_down(0), aroon_oscillator(0);   

aroon_up = (length-nthhighestbar(1,high,length))/length*100;   
aroon_down = (length-nthlowestbar(1,low,length))/length*100;   
aroon_oscillator=aroon_up-aroon_down;   

plot1(aroon_up,"aroon_up");   
plot2(aroon_down,"aroon_down");   
plot3(aroon_oscillator,"aroon_oscillator");  
