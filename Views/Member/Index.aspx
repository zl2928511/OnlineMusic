<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人中心</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://www.coolapk.com/favicon.ico" />
    <link href="../../css/Member.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="total">
        <div class="infotop">
            <img src="../../images/logo.gif" alt="" />
        </div>
        <div class="top">
            <%:Html.ActionLink("返回首页","Default","MusicPlay") %>&nbsp;&nbsp;<%:Html.ActionLink("注销登陆","LogOff","Member")%>
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
                        个人资料</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ConfirmMail?uid=<%:Model.Uid %>';">
                        验证邮箱</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ModifyPhoto?uid=<%:Model.Uid%>';">
                        修改头像</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/UserPlaylist?uid=<%:Model.Uid %>';">
                        播放列表</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/ModifyPassword?uid=<%:Model.Uid %>';">
                        修改密码</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/UploadMusic?uid=<%:Model.Uid %>';">
                        上传歌曲</a></li>
                    <li><a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../Member/Tuiguang?uid=<%:Model.Uid %>';">
                        访问推广</a></li>
                    <%if (Model.IsAdmin == true) Writer.Write(@"<li><a href='../SysAdmin/SysIndex'>
                        后台管理</a></li>");%>
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
