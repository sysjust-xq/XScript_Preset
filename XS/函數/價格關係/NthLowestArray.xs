{@type:function|@guid:c7355de052fe4bd998b4a6d5ea213d7b|@path:/價格關係/NthLowestArray|@hash:b5201d541680360b71c52f49f35bad3e}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArrayRef), Size(numericsimple), N (numericsimple);                
variable: _Output(0);

NthExtremesArray( thePriceArray, Size, N, -1, _Output, value2) ;

NthLowestArray = _Output ;
        
        