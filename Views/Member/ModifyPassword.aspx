<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModifyPassword</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height: 30px;">
    <%using (Html.BeginForm())
      { %>
    <table>
        <tr>
            <td>
                请输入旧密码:
            </td>
            <td>
                <input type="password" name="oldp" />
            </td>
        </tr>
        <tr>
            <td>
                请输入新密码:
            </td>
            <td>
                <input type="password" name="newp" id="newp1" />
            </td>
        </tr>
        <tr>
            <td>
                请再次输入新密码:
            </td>
            <td>
                <input type="password" id="newp2" onpaste="return false;" oncontextmenu="return false;"
                    oncopy="return false;" oncut="return false;"/><label id="p2"></label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交" />
            </td>
        </tr>
    </table>
    <%} %>
</body>
</html>
