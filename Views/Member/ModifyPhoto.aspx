<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModifyPhoto</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height: 30px; text-align: center">
    <%using (Html.BeginForm())
      { %>
    <div>
        <img src="../../images/MemberPhoto/1.jpg" name="avatar" alt="" /></div>
    <div style="margin-top: 20px;">
        <select id="selectbox" name="selectbox" onchange="avatar.src=this.options[this.selectedIndex].value; ">
            <option value="../../images/MemberPhoto/1.jpg" selected="selected">个性头像一</option>
            <option value="../../images/MemberPhoto/2.jpg">个性头像二</option>
            <option value="../../images/MemberPhoto/3.jpg">个性头像三</option>
            <option value="../../images/MemberPhoto/4.jpg">个性头像四</option>
            <option value="../../images/MemberPhoto/5.jpg">个性头像五</option>
            <option value="../../images/MemberPhoto/6.jpg">个性头像六</option>
            <option value="../../images/MemberPhoto/7.jpg">个性头像七</option>
            <option value="../../images/MemberPhoto/8.jpg">个性头像八</option>
            <option value="../../images/MemberPhoto/9.jpg">个性头像九</option>
        </select></div>
    <div style="margin-top: 20px">
        <input type="submit" value="提交" id="registers" />
    </div>
    <%} %>
</body>
</html>
