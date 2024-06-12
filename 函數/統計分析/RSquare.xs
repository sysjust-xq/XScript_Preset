{@type:function}
SetBarMode(1);

input: Indep(numericseries), Dep(numericseries), Length(numericsimple);

RSquare = Square(CoefficientR(Indep, Dep, Length));
        