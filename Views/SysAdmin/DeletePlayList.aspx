<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.PlayList>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DeletePlayList</title>
</head>
<body>
    <%:Html.ActionLink("清空播放列表", "DePlayList","",new { @onclick = "return confirm('确定清空吗?')" })%>
</body>
</html>
