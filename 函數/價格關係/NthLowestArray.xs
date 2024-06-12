{@type:function}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArrayRef), Size(numericsimple), N (numericsimple);                
variable: _Output(0);

NthExtremesArray( thePriceArray, Size, N, -1, _Output, value2) ;

NthLowestArray = _Output ;
        
        