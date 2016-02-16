<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.UserInfo>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModPermission</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <table id="albumsongs">
        <tr>
            <th>
                <label>
                    账号</label>
            </th>
            <th>
                <label>
                    昵称</label>
            </th>
            <th>
                <label>
                    管理员权限</label>
            </th>
        </tr>
        <% foreach (var item in Model.Where(p => p.Uid != null))
           { %>
        <tr>
            <td>
                <label>
                    <%: item.Uid%></label>
            </td>
            <td>
                <label>
                    <%: item.Uname %></label>
            </td>
            <td>
                <label>
                    <%: Html.ActionLink(item.IsAdmin.ToString(), "ModPermission", new { uid = item.Uid })%></label>
            </td>
        </tr>
        <% } %>
    </table>
    <input type="hidden" id="pgsize" value="6" />
    <p align="center" style="color: #5bb7d4">
        <a onclick="showtr(1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
            onmouseout="this.style.color='#5bb7d4'">首页</a> <a onclick="showtr(pages-1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                onmouseout="this.style.color='#5bb7d4'">上一页</a> <a onclick="showtr(pages+1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                    onmouseout="this.style.color='#5bb7d4'">下一页</a> <a onclick="showtr(totlepage);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                        onmouseout="this.style.color='#5bb7d4'">末页</a> 第<span id="currentpage1" style="color: Blue"></span>页
        共<span id="totlepages" style="color: Blue">1</span> 页</p>
    <script type="text/javascript" src="../../js/Page.js"></script>
</body>
</html>
