{@type:function|@guid:d2d538b9b20a4dae9f84299151855149|@path:/價格關係/LowestArray|@hash:c275cc0df7719100eab24be15ea5f3e9}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArray),ArraySize(numericsimple);
variable: _Output(0);

ExtremesArray(thePriceArray, ArraySize, -1, _Output, value2);
LowestArray = _Output;
        