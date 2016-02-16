<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Singer>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModSinger</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend class="editor-label">修改歌手信息</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sid) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sid,new { @disabled = "disabled" }) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sphoto) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sphoto) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.TuiJian) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TuiJian) %>
        </div>
        <p>
            <input class="buttonface" type="submit" value="保存" />
        </p>
    </fieldset>
    <% } %>
</body>
</html>
