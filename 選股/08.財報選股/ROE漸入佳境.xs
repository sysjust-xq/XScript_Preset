{@type:filter|@guid:44c440011e794bb0a539bf6cddfee0e3|@path:/08.財報選股/ROE漸入佳境}
value1=GetField("股東權益報酬率","Q");
if GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[1]
and GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[4]
then ret=1; 