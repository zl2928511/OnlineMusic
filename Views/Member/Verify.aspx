﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Refresh" content="3;URL=../MusicPlay/Default" />
    <title>邮箱验证</title>
</head>
<body>
    <div>
        <h3>
            验证成功！3秒后自动跳转</h3>
        <%:Html.ActionLink("如果没有跳转，请点", "Default", "MusicPlay")%>
    </div>
</body>
</html>
