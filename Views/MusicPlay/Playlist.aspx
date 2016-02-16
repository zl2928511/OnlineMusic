<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.Music>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../js/common.js" type="text/javascript"></script>
    <script src="../../js/player.js" type="text/javascript"></script>
    <div id="playmain">
        <div class="playlistleft">
            <div class="playlisttitle">
            </div>
            <div class="playlbleft">
                <div class="playobject">
                    <!-- 播放器代码开始 -->
                    <object id="MediaPlayer" name="MediaPlayer" width="296" height="64" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"
                        type="application/x-oleobject">
                        <param name="url" value="" />
                        <param name="ShowControls" value="1" />
                        <param name="ShowPositionControls" value="1" />
                        <param name="ShowAudioControls" value="1" />
                        <param name="ShowTracker" value="1" />
                        <param name="ShowDisplay" value="0" />
                        <param name="ShowStatusBar" value="1" />
                        <param name="AutoSize" value="0" />
                        <param name="ShowGotoBar" value="0" />
                        <param name="ShowCaptioning" value="0" />
                        <param name="AutoStart" value="1" />
                        <param name="PlayCount" value="1" />
                        <param name="AnimationAtStart" value="0" />
                        <param name="TransparentAtStart" value="0" />
                        <param name="AllowScan" value="0" />
                        <param name="EnableContextMenu" value="0" />
                        <param name="ClickToPlay" value="0" />
                        <param name="InvokeURLs" value="1" />
                        <param name="DefaultFrame" value="datawindow" />
                        <param name="volume" value="100" />
                        <embed name="MediaPlayer_embed" pluginspage="http://www.microsoft.com/windows/windowsmedia/download/"
                            type="application/x-mplayer2" src="" showcontrols="1" showdisplay="0" showstatusbar="0"
                            autostart="1" autorewind="0" showpositioncontrols="1" showtracker="0"></embed>
                    </object>
                    <!-- 播放器代码结束 -->
                </div>
                <!-- 歌词开始 -->
                <div>
                    <iframe id="lrciframe" frameborder="0" height="285px" width="100%" src=""></iframe>
                </div>
                <!-- 歌词结束 -->
            </div>
            <div class="playlbright">
                <div class="playtitj">
                    <div class="playtititle">
                        歌曲播放列表</div>
                </div>
                <div class="playlbmusictj">
                    <div class="playlist">
                        <div class="playll">
                            <select id="play_mode" onchange="pu.setPlayMode(this.value);">
                                <option value="0" selected="selected">顺序播放</option>
                                <option value="1">随机播放</option>
                                <option value="2">单曲播放</option>
                            </select>&nbsp;&nbsp;播放列表</div>
                        <div id="songlist">
                            <%int i = -1;
                              foreach (var item in Model)
                              {
                                  i = i + 1;%>
                            <div class="oid" id="p_<%:i %>" ondblclick="pu.dbclick(<%:i %>);" onmouseover="pu.mo(<%:i %>);"
                                onmouseout="pu.mt(<%:i %>);">
                                <span class="del"><a title="从连播列表删除或恢复！" href="#" onclick="return pu.del(<%:i %>);">
                                    <font id="del_<%:i %>">删除</font> </a></span><a onclick="return pu.utils(<%:i %>);"
                                        href="#">
                                        <%:item.Mname %></a>
                                <input id="song_<%:item.Mid %>" type="hidden" value="<%:item.Mname
                                    %>" />
                                <input id="url_<%:i %>" type="hidden" value="<%:item.Url %>" />
                                <input id="songid_<%:i
                                    %>" type="hidden" value="<%:item.Mid %>" />
                            </div>
                            <% }%>
                        </div>
                    </div>
                    <div class="playlistbox">
                        <input class="inputbutton" onclick="javascript:pu.doPlayNext(-1);" type="button"
                            value="上一首" />
                        &nbsp;&nbsp;<input class="inputbutton" onclick="javascript:pu.doPlayNext(1);" type="button"
                            value="下一首" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var pu = new PlayerUtils();
        pu.init();
        pu.utils(0);
        pu.doPlay();
    </script>
</asp:Content>
