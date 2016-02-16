<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBlIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>注册会员</title>
    <link href="../../css/sys2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/reg.js"></script>
</head>
<body>
    <div class="header"><label class="headerlab">新用户注册</label>
    </div>
    <div class="regbox">
        <div class="regboxtitle">
            欢迎注册成为本站新用户 如果你已经拥有本站账号，请<%:Html.ActionLink("登录", "LogOn")%>。
        </div>
        <form id="Form1" action="" method="post" name="regform" onsubmit="return checkform()"
        runat="server">
        <div>
            <div class="l">
                用户名：</div>
            <div>
                <input type="text" name="username" id="username" class="txts" onfocus="onkeyusername();"
                    onblur="upkeyusername();" />
            </div>
            <div class="msg">
                <span id="u">
                    <%Writer.Write(ViewData["unameconfirm"]);%></span></div>
            <div class="l">
                密 码：</div>
            <div>
                <input name="password" type="password" id="password" class="txts" onfocus="onkeypassword();"
                    onblur="upkeypassword();" />
            </div>
            <div class="msg">
                <span id="p">密码长度为6-20个字符</span></div>
            <div class="l">
                重复密码：</div>
            <div>
                <input type="password" id="pass" class="txts" onfocus="onkeypass();" onblur="upkeypass();"
                    onpaste="return false;" oncontextmenu="return false;" oncopy="return false;"
                    oncut="return false;" />
            </div>
            <div class="msg">
                <span id="p2">请重复输入上面的密码</span></div>
            <div class="l">
                昵称：</div>
            <div>
                <input name="nickname" type="text" id="nickname" class="txts" onfocus="onkeynickname();"
                    onblur="upkeynickname();" />
            </div>
            <div class="msg">
                <span id="n">昵称可以为中文</span></div>
            <div class="l">
                电子邮箱：</div>
            <div>
                <input type="text" name="email" id="email" class="txts" onfocus="onkeyemail();" onblur="upkeyemail();" /></div>
            <div class="msg">
                <span id="e">请输入您常用的电子邮件,用于取回密码</span></div>
            <div class="meph">
                头像：</div>
            <div class="selectbox">
                <select name="selectbox" onchange="avatar.src=this.options[this.selectedIndex].value; ">
                    <option value="../../images/MemberPhoto/1.jpg" selected="selected">个性头像一</option>
                    <option value="../../images/MemberPhoto/2.jpg">个性头像二</option>
                    <option value="../../images/MemberPhoto/3.jpg">个性头像三</option>
                    <option value="../../images/MemberPhoto/4.jpg">个性头像四</option>
                    <option value="../../images/MemberPhoto/5.jpg">个性头像五</option>
                    <option value="../../images/MemberPhoto/6.jpg">个性头像六</option>
                    <option value="../../images/MemberPhoto/7.jpg">个性头像七</option>
                    <option value="../../images/MemberPhoto/8.jpg">个性头像八</option>
                    <option value="../../images/MemberPhoto/9.jpg">个性头像九</option>
                </select>
            </div>
            <img class="imge" src="../../images/MemberPhoto/1.jpg" name="avatar" alt="" />
            <div class="c">
                <input type="submit" value="注册会员" id="registers" />
            </div>
        </div>
        </form>
    </div>
</body>
</html>
