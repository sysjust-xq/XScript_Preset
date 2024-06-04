{@type:function|@guid:63d7a17cf80a49098dfc97fc4b986abc|@path:/統計分析/RSquare|@hash:036f6e93c7757b8fe8f37ee446c58527}
SetBarMode(1);

input: Indep(numericseries), Dep(numericseries), Length(numericsimple);

RSquare = Square(CoefficientR(Indep, Dep, Length));
        