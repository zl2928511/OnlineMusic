<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ConfirmMail</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height:30px;">
    <div>
        已绑定邮箱：<label style="color:Red"><%:Model.Email %></label>
    </div>
    <%using (Html.BeginForm())
      { %>
    <div>
        更换新邮箱：<input name="newmail" /></div>
    <div style="margin-left:50px; margin-top:30px">
        <input type="submit" value="确定更换" /></div>
    <%} %>
</body>
</html>
