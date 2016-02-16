<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Music>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div style="color: #5bb7d4; height: 20px; width: 980px;">
            <div style="float: left">
                正在播放：<label id="1" style="color: Orange"><%=Model.Mname %></label></div>
            <div style="float: right">
                <%if (Convert.ToInt32(Model.Mid) + 1 <= Convert.ToInt32(ViewData["count"]))
                  {%>
                <%=Html.ActionLink("下一首歌", "Index", new { mid = Convert.ToInt32(Model.Mid) + 1 })%>
                <%}
                  else
                  {%>
                <%=Html.ActionLink("下一首歌", "Index", new { mid = 1 })%><%} %>
            </div>
        </div>
        <div style="width: 298px">
            <div>
                <input id="a_u" type="hidden" value="<%=Model.Url %>"/>
                <!-- 播放器代码开始 -->
                <object id="MediaPlayer" name="MediaPlayer" width="296" height="64" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"
                    type="application/x-oleobject">
                    <param name="ShowControls" value="1" />
                    <param name="ShowPositionControls" value="1" />
                    <param name="ShowAudioControls" value="1" />
                    <param name="ShowTracker" value="1" />
                    <param name="ShowDisplay" value="0" />
                    <param name="ShowStatusBar" value="1" />
                    <param name="AutoSize" value="0" />
                    <param name="ShowGotoBar" value="0" />
                    <param name="ShowCaptioning" value="0" />
                    <param name="CurrentPosition" value="0" />
                    <param name="AutoStart" value="1" />
                    <param name="PlayCount" value="100000" />
                    <param name="AnimationAtStart" value="0" />
                    <param name="TransparentAtStart" value="0" />
                    <param name="AllowScan" value="0" />
                    <param name="EnableContextMenu" value="0" />
                    <param name="ClickToPlay" value="0" />
                    <param name="InvokeURLs" value="1" />
                    <param name="DefaultFrame" value="datawindow" />
                    <param name="volume" value="100" />
                    <embed name="MediaPlayer_embed" pluginspage="http://www.microsoft.com/windows/windowsmedia/download/"
                        type="application/x-mplayer2" src="" width="296" height="64" showcontrols="1"
                        showdisplay="0" showstatusbar="0" autostart="1" autorewind="0" showpositioncontrols="1"
                        showtracker="0"> </embed></object><!-- 播放器代码结束 -->
            </div>
            <!-- 歌词开始 -->
            <div>
                <div id="list" style="height:470px">
                </div>
                <div id="lrc">
                    <%=Model.Lyric %>                   
                </div>
                <div id="time">
                </div>
                <script type="text/javascript" src="/js/lrc.js"></script>
                <script type="text/javascript" src="/js/ting.js"></script>
            </div>
            <!-- 歌词结束 -->
        </div>
    </center>
</asp:Content>
