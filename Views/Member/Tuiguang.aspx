<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.UserInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tuiguang</title>
</head>
<body style="border: 0 solid; background-color: #CAD1D5; line-height: 30px;">
    <div align="center">
        <input type="button" name="Submit" onclick='copyToClipBoard()' value="复制本页地址，传给QQ/MSN上的好友" />
        <script language="javascript" type="text/javascript">
            function copyToClipBoard() {
                var clipBoardContent = this.location.href;
                window.clipboardData.setData("Text", clipBoardContent);
                alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友 ");
            }
        </script>
    </div>
</body>
</html>
