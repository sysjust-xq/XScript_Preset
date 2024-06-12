{@type:filter}
value1=GetField("股東權益報酬率","Q");
if GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[1]
and GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[4]
then ret=1; 