<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Music>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>UploadMusic</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height: 30px;">
    <% using (Html.BeginForm("UploadMusic", "Member", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    <div>
        <%: Html.LabelFor(model => model.Url) %>
    </div>
    <div>
        <input type="file" name="FileUpload1" /><br />
    </div>
    <p>
        <input class="buttonface" type="submit" value="提交" />
    </p>
    <% } %>
</body>
</html>
