<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.Music>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserPlaylist</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5;">
    <table>
        <tr>
            <th>
            操作
            </th>
            <th>
                歌曲名称
            </th>
            <th>
                歌手姓名
            </th>
            <th>
                所属专辑
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink("删除", "DeleteList", new { mid=item.Mid ,uid=ViewData["uid"]})%>
            </td>
            <td>
                <%: item.Mname %>
            </td>
            <td>
                <%: item.Sname %>
            </td>
            <td>
                <%: item.Aname %>
            </td>
        </tr>
        <% } %>
        <tr>
        <td colspan="4" align="center">
         <%: Html.ActionLink("清空", "DeleteListAll", new {uid=ViewData["uid"]})%>
        </td>
        </tr>
    </table>
</body>
</html>
