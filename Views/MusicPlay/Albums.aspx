<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.AlbumMusicModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table id="albumsongs">
            <%foreach (var item in Model.albums.Where(p => p.Area == ViewData["area"].ToString()))
              {%>
            <tr>
                <td>
                    <img src="../../images/AlbumPicture/<%:item.APicture%>" alt="<%:item.Aname %>" style="width: 300px" />
                </td>
                <td valign="top" style="text-align: left; width: 300px">
                    <div>
                        <div class="title">
                            歌曲列表</div>
                        <form name="albummusiclist" method="post" action="/MusicPlay/Playlist" target="_blank">
                        <div class="MusicList">
                            <ul>
                                <%foreach (var i in Model.musics.Where(p => p.Aname == item.Aname))
                                  { %><li>
                                      <input type="checkbox" name="checkbox" value="<%:i.Mid%>" /><%:Html.ActionLink(i.Mname, "Index", new{mid=i.Mid})%>
                                  </li>
                                <%} %>
                            </ul>
                        </div>
                        <input type="hidden" id="pgsize" value="1" />
                        <div class="musicbottombg">
                            <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                            <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                            <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                        </form>
                    </div>
                </td>
            </tr>
            <%} %>
        </table>
        <p align="center" style="color: #5bb7d4">
            <a onclick="showtr(1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                onmouseout="this.style.color='#5bb7d4'">首页</a> <a onclick="showtr(pages-1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                    onmouseout="this.style.color='#5bb7d4'">上一页</a> <a onclick="showtr(pages+1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                        onmouseout="this.style.color='#5bb7d4'">下一页</a> <a onclick="showtr(totlepage);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                            onmouseout="this.style.color='#5bb7d4'">末页</a> 第<span id="currentpage1" style="color: Blue"></span>页
            共<span id="totlepages" style="color: Blue">1</span> 页</p>
    </center>
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Page.js"></script>
</asp:Content>
