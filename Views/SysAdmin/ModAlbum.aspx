<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Album>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModAlbum</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend class="editor-label">修改专辑信息</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Aid) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Aid, new { @disabled = "disabled" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Aname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Aname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CreatTime) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.CreatTime, String.Format("{0:g}", Model.CreatTime)) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.APicture) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.APicture) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Area) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Area) %>
        </div>
        <p>
            <input class="buttonface" type="submit" value="保存" />
        </p>
    </fieldset>
    <% } %>
</body>
</html>
