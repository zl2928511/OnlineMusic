<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.AlbumMusicModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
        <table style="margin:0 auto">
            <tr>
                <td>
                    <%foreach (var item in Model.albums.Where(p => p.Aname == ViewData["aname"].ToString()))
                      {%>
                    <img src="../../images/AlbumPicture/<%:item.APicture%>" alt="<%:item.Aname %>" style="width:300px" />
                    <%} %>
                </td>
                <td valign="top" style="text-align: left;width:300px">
                    <div>
                        <div class="title">
                            歌曲列表</div>
                        <form name="albummusiclist" method="post" action="/MusicPlay/Playlist" target="_blank">
                        <div class="MusicList">
                            <ul>
                                <%foreach (var item in Model.musics.Where(p => p.Aname== ViewData["aname"].ToString()))
                                  { %><li>
                                  <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new{mid=item.Mid})%>
                              </li>
                                <%} %>
                            </ul>
                        </div>
                        <div class="musicbottombg">
                            <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                            <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                            <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>
