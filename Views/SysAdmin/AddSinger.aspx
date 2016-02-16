<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Singer>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AddSinger</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend class="editor-label">歌手信息添加</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sname) %>
            <%: Html.ValidationMessageFor(model => model.Sname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sphoto) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sphoto) %>
            <%: Html.ValidationMessageFor(model => model.Sphoto) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.TuiJian) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TuiJian) %>
            <%: Html.ValidationMessageFor(model => model.TuiJian) %>
        </div>
        <p>
            <input class="buttonface" type="submit" value="提交" />
        </p>
    </fieldset>
    <% } %>
</body>
</html>
