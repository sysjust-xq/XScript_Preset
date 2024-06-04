{@type:function|@guid:c361287a10cf477d9932c8a6742330cf|@path:/價格關係/HighestArray|@hash:f7251401c984a837e93318a04c1a6b89}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArray),ArraySize(numericsimple);
variable: _Output(0);

ExtremesArray(thePriceArray, ArraySize, 1, _Output, value2);

HighestArray = _Output;
        