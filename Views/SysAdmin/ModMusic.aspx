<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Music>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModMusic</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% using (Html.BeginForm())
       {%>
    <fieldset class="editor-label">
        <legend class="editor-label">修改歌曲信息</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Mid) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Mid,new { @disabled = "disabled" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Mname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Mname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Url) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Url) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Lyric) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Lyric) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Ranking) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Ranking) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Area) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Area) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Aname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Aname) %>
        </div>
        <p>
            <input class="buttonface" type="submit" value="保存" />
        </p>
    </fieldset>
    <% } %>
</body>
</html>
