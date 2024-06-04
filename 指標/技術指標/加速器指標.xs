{@type:indicator|@guid:f9fdac082ed24235b962555ab5b9edd1|@path:/技術指標/加速器指標|@hash:ad11c31c92e5ee81141782871c3c7307}
{
指標說明
https://xstrader.net/495/
}

variable:Xslope(0); 

Xslope = linearregslope((H+L)/(H+L)[20],20);

plot1(Xslope,"方向速度" );
plot2(Xslope-Xslope[1],"速度變化");