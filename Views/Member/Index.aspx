<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<����֮��.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>��������</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://www.coolapk.com/favicon.ico" />
    <link href="../../css/Member.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="total">
        <div class="infotop">
            <img src="../../images/logo.gif" alt="" />
        </div>
        <div class="top">
            <%:Html.ActionLink("������ҳ","Default","MusicPlay") %>&nbsp;&nbsp;<%:Html.ActionLink("ע����½","LogOff","Member")%>
        </div>
        <div class="left">
            <div class="photo">
                <img src="<%:Model.Photo %>" alt="" />
            </div>
            <div class="name">
                <%:Model.Uname %>
            </div>
            <div class="sideinner">
                <ul>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/UserInfo?uid=<%:Model.Uid %>';">
                        ��������</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ConfirmMail?uid=<%:Model.Uid %>';">
                        ��֤����</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ModifyPhoto?uid=<%:Model.Uid%>';">
                        �޸�ͷ��</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/UserPlaylist?uid=<%:Model.Uid %>';">
                        �����б�</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ModifyPassword?uid=<%:Model.Uid %>';">
                        �޸�����</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/UploadMusic?uid=<%:Model.Uid %>';">
                        �ϴ�����</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/Tuiguang?uid=<%:Model.Uid %>';">
                        �����ƹ�</a></li>
                    <%if (Model.IsAdmin == true) Writer.Write(@"<li><a href='../SysAdmin/SysIndex'>
                        ��̨����</a></li>");%>
                </ul>
            </div>
        </div>
        <div class="right">
            <iframe id="mainiframe" frameborder="0" scrolling="auto" height="100%" width="100%"
                src="../Member/UserInfo?uid=<%:Model.Uid %>"></iframe>
        </div>
    </div>
</body>
</html>
