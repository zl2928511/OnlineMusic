<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����̨</title>
    <link href="../../css/sysadmin.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        var navUserAgent = navigator.userAgent;
        function loadlady() {
            if (navUserAgent.indexOf("Firefox") >= 0 || navUserAgent.indexOf("Opera") >= 0) {
                document.getElementById("mainright").style.height = document.documentElement.clientHeight - 65 + 'px';
                document.getElementById("main").style.height = document.documentElement.clientHeight - 47 + 'px';
                document.getElementById("mainright").style.width = document.documentElement.clientWidth - 156 + 'px';
            }
            else {
                document.getElementById("mainright").style.height = ((document.documentElement.clientHeight == 0) ? document.body.clientHeight : document.documentElement.clientHeight) - 65 + 'px';
                document.getElementById("main").style.height = ((document.documentElement.clientHeight == 0) ? document.body.clientHeight : document.documentElement.clientHeight) - 47 + 'px';
                document.getElementById("mainright").style.width = ((document.documentElement.clientWidth == 0) ? document.body.clientWidth : document.documentElement.clientWidth) - 156 + 'px';
            }
            //document.getElementById("right").style.height=document.getElementById("left").scrollHeight+"px"
        }
        function $(DIVID) { return document.getElementById("menu" + DIVID); }
        function ms(DIVID) { return document.getElementById("m" + DIVID); }
        function f(DIVID) { return document.getElementById(DIVID); }
        function openclose(id) {
            if ($(id).style.display == "block") {
                $(id).style.display = "none";
            }
            else {
                $(id).style.display = "block";
            }
        }
        function onclass(id) {
            if (ms(id).className == "upmenu") {
                ms(id).className = "downmenu";
            }
            else {
                ms(id).className = "upmenu";
            }
        }
    </script>
</head>
<body scroll="no" onload="loadlady();" onresize="loadlady();">
    <div class="top">
        <div class="ico">
            �������</div>
        <div class="topright">
            <%:Html.ActionLink("��վ��ҳ","../MusicPlay/Default") %>
            <%:Html.ActionLink("ע����¼","LogOff","Member")%></div>
    </div>
    <div class="clearfloat">
    </div>
    <div class="main" id="main">
        <div class="mainleft" id="mainleft">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="upmenu" id="m1" onclick="openclose(1);onclass(1);">
                        ���
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="menu1" class="menulist">
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/AddMusic';">
                                ��Ӹ�����Ϣ</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/AddSinger';">
                                ��Ӹ�����Ϣ</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/AddAlbum';">
                                ���ר����Ϣ</a><br />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="upmenu" id="m2" onclick="openclose(2);onclass(2);">
                        �޸�
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="menu2" class="menulist">
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/ModifyMusic';">
                                �޸ĸ�����Ϣ</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/ModifySinger';">
                                �޸ĸ�����Ϣ</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/ModifyAlbum';">
                                �޸�ר����Ϣ</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/Permission';">
                                �޸Ļ�ԱȨ��</a><br />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="upmenu" id="m3" onclick="openclose(3);onclass(3);">
                        ɾ��
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="menu3" class="menulist">
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/DeleteMusic';">
                                ɾ������</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/DeleteSinger';">
                                ɾ������</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/DeleteAlbum';">
                                ɾ��ר��</a><br />
                            <a href="javascript:void(0);" onclick="javascript:document.getElementById('mainiframe').src='../SysAdmin/DeletePlayList';">
                                ��ղ����б�</a><br />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="mainright" id="mainright">
            <iframe id="mainiframe" frameborder="0" scrolling="auto" height="100%" width="100%"
                src=""></iframe>
        </div>
    </div>
</body>
</html>
