{@type:function|@guid:0e068023f7ec4fefb4d58c2da29c3f8f|@path:/價格關係/NthHighestArray|@hash:0794d8ce35074dea290af8b0557a8d6b}
SetBarMode(1);

input:  thePriceArray[MaxSize](NumericArray), Size(numericsimple), N (numericsimple);
variable: _Output(0);

NthExtremesArray(thePriceArray, Size, N, 1, _Output, value2);

NthHighestArray = _Output;
        