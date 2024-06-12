{@type:function}
SetBarMode(1);

input:Date1(numeric),Date2(numeric);

variable:Date1Bar(0),Date2Bar(0),Date1Price(0),Date2Price(0),_Slope(0);

Date1Bar = getbaroffset(date1); Date1Price =Open[Date1Bar];
Date2Bar = getbaroffset(date2); Date2Price =Close[Date2Bar];


if Date1Bar > Date2Bar then 
   _Slope = (Date2Price/Date1Price-1)*100 / (Date1Bar-Date2Bar);


Angle = arcTangent(_Slope);