{@type:function}
SetBarMode(1);

if Close[1] < Low then TrueLow = Close[1]
else TrueLow = Low;
        