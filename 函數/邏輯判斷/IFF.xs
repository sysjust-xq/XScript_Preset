{@type:function|@guid:8c2d025a23c548d3a76fba10c22527b4|@path:/邏輯判斷/IFF|@hash:96fe2936c8c3e4ecad22145bcf572583}
SetBarMode(1);

input: Logicoperator(truefalsesimple),
       TrueReturnV(numericsimple),
       FalseReturnV(numericsimple);

if Logicoperator then IFF = TrueReturnV
else IFF = FalseReturnV;
        