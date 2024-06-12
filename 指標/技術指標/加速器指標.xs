{@type:indicator}
{
指標說明
https://xstrader.net/495/
}

variable:Xslope(0); 

Xslope = linearregslope((H+L)/(H+L)[20],20);

plot1(Xslope,"方向速度" );
plot2(Xslope-Xslope[1],"速度變化");