<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserInfo</title>
    <style type="text/css">
        .right
        {
            color:Red;
            padding-left: 50px;
        }
    </style>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height:40px;">
    <table>
        <tr>
            <td>
                头像：
            </td>
            <td class="right">
                <img src="<%: Model.Photo %>" alt="" />
            </td>
        </tr>
        <tr>
            <td>
                账号：
            </td>
            <td class="right">
                <%: Model.Uid %>
            </td>
        </tr>
        <tr>
            <td>
                昵称：
            </td>
            <td class="right">
                <%: Model.Uname %>
            </td>
        </tr>
        <tr>
            <td>
                邮箱：
            </td>
            <td class="right">
                <%: Model.Email %>
            </td>
        </tr>
        <tr>
            <td>
                创建时间：
            </td>
            <td class="right">
                <%: String.Format("{0:g}", Model.Createdata) %>
            </td>
        </tr>
    </table>
</body>
</html>
