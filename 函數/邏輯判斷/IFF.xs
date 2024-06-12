{@type:function}
SetBarMode(1);

input: Logicoperator(truefalsesimple),
       TrueReturnV(numericsimple),
       FalseReturnV(numericsimple);

if Logicoperator then IFF = TrueReturnV
else IFF = FalseReturnV;
        