<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Music>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AddMusic</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% using (Html.BeginForm("UploadMusic", "Member", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend class="editor-label">歌曲信息添加</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Mname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Mname) %>
            <%: Html.ValidationMessageFor(model => model.Mname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Sname) %>
            <%: Html.ValidationMessageFor(model => model.Sname) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Url) %>
        </div>
        <div class="editor-field">
            <input type="file" name="FileUpload1" /><br />
            <%: Html.ValidationMessageFor(model => model.Url) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Lyric) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Lyric) %>
            <%: Html.ValidationMessageFor(model => model.Lyric) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Ranking) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Ranking) %>
            <%: Html.ValidationMessageFor(model => model.Ranking) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Area) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Area) %>
            <%: Html.ValidationMessageFor(model => model.Area) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Aname) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Aname) %>
            <%: Html.ValidationMessageFor(model => model.Aname) %>
        </div>
        <p>
            <input class="buttonface" type="submit" value="提交" />
        </p>
    </fieldset>
    <% } %>
</body>
</html>
