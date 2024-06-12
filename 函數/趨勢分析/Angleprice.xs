{@type:function}
input:Date1(numeric),ang(numeric);

variable:Date1Price(0);
 
Date1Price =Open[Date1];

value1=tan(ang);
value2=date1price*(1+value1*date1/100);
angleprice=value2;