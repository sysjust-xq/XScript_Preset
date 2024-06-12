{@type:function}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArray), Size(numericsimple), N (numericsimple);
variable: _Output(0);

NthExtremesArray(thePriceArray, Size, N, 1, _Output, value2);

NthHighestArray = _Output;
        