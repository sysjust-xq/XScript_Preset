{@type:function}
SetBarMode(1);

{
XQ心理線:人氣指標心理線，計算特定期間內，行情上漲期數的比例
Length: 計算期數
}
input: Length(numeric);

PSY = 100 * CountIf(Close > Close[1], Length) / Length;


