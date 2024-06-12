{@type:function}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArray),ArraySize(numericsimple);
variable: _Output(0);

ExtremesArray(thePriceArray, ArraySize, 1, _Output, value2);

HighestArray = _Output;
        