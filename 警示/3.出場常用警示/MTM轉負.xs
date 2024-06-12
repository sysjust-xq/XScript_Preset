{@type:sensor}
input: Length(10); SetInputName(1, "期數");

settotalbar(maxlist(Length,6) + 8);

if momentum(close,Length) crosses under 0 then ret=1;
