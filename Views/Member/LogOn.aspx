<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../css/sysadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%Html.EnableClientValidation(); %>
    <%using (Html.BeginForm())
      { %>
    <div class="syslogin">
        <div class="formcon">
            <p>
                <label>
                    账号:</label></p>
            <p>
                <%:Html.TextBox("account") %>
                <%:Html.ValidationMessage("account") %>
            </p>
            <p>
                <label>
                    密码：</label></p>
            <p style="color: Red">
                <%:Html.Password("password") %>
                <%:Html.ValidationMessage("password") %>
            </p>
            <p class="btn">
                <input type="submit" class="btncss" id="syslogins" value="" /></p>
            <p class="btn">
                如果你没有账号，请先<%:Html.ActionLink("注册", "Register")%>。</p>
        </div>
    </div>
    <div class="syscopyright">
        Powered by Tianlai &copy; 2008, TianLai Inc.</div>
    <%} %>
</body>
</html>
