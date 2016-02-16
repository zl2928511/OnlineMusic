<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.MusicSingerModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <div style="text-align: left; width: 980px; margin: 0 auto">
        <!-- 公告说明 -->
        <div id="GongGao">
            <marquee direction="up" scrollamount="3">
                <p>[娱乐八卦]《我是歌手》尚雯婕纪录片首播 异类终将取得王位  上周五晚，湖南卫视《我是歌手》第八期落下帷幕，唱作先锋尚雯婕爆冷出局。意外赛果不仅让同台竞技的几位歌手遗憾落泪，也让喜欢她和她的作品的观众唏嘘感怀。从超女舞台上不争不抢的斯文白领，到令人忽略她歌唱实力的夸张造型，再到《我是歌手》中大气时尚范儿的华语电子唱作人，她的执着，她锐利的年轻与潮流，都使观众不得不重新对其定义。今日，《我是歌手》尚雯婕纪录片《异类终将取得王位》正式全网首播。 </p>
                <p>[国外乐坛]贾斯汀比伯伦敦演唱会上晕倒 粉丝呼吁其多休息  据台湾“苹果日报网”即时消息，加拿大偶像“小贾斯汀”贾斯汀·比伯(Justin Bieber)7日在伦敦的演唱会传出因呼吸困难在舞台上倒下。  小贾斯汀的发言人表示，他昏倒后休息20分钟，接受供氧后，返回舞台把歌唱完。发言人也说，小贾斯汀演唱会前没有任何健康问题。</p>
                <p>[精彩专栏]如果要评选这个夏天，国内电视屏幕上最热最火的节目，《中国好声音》无疑算得上是其中之一。自从第一期播出后就一炮而红，首期不见经传的学员靠着一把好声音把电视机前的观众“听出了一身鸡皮疙瘩”。而其后的第2、3、4、5…期火爆程度依旧不减。很多人表示：”这是今夏最成功的音乐节目！”你是否也在电视机或电脑前面关注着“好声音”呢？如果你还没有看过这档节目，或者对它还不太了解也不要紧，现在就让一听小编带领大家一起来品味这档节目的精彩所在。</p>             
             </marquee>
        </div>
        <div id="IndexAdOne">
            <a href="../Member/DownloadMusic">
                <img src="../../images/indexad.jpg" alt="广告位" /></a>
        </div>
        <div class="floatclear">
        </div>
        <!-- 歌曲Begin -->
        <div id="MusicBox">
            <!--热门歌手-->
            <div class="HotBox">
                <div class="title">
                    热门歌手
                </div>
                <div class="hotkeyword">
                    <ul>
                        <%foreach (var item in Model.singers.Where(p => p.TuiJian == true))
                          { %><li>
                              <%:Html.ActionLink(item.Sname, "Singer", new { sid=item.Sid,sname=item.Sname})%>
                          </li>
                        <%} %>
                    </ul>
                </div>
            </div>
            <!--中文歌曲-->
            <div class="WebTingBox">
                <div class="title">
                    中文歌曲推荐</div>
                <form name="dlting" method="post" action="/MusicPlay/Playlist">
                <div class="weblist">
                    <%foreach (var item in Model.musics.Where(p => p.Area == "DL" && p.Ranking != null))
                      { %><ul>
                          <li>
                              <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new { mid = item.Mid })%>
                          </li>
                      </ul>
                    <%} %>
                </div>
                <div class="clearfloat">
                </div>
                <div class="musicbottombg">
                    <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                    <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                    <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                </form>
            </div>
            <!--歌曲推荐-->
            <div class="HotBox">
                <div class="title">
                    24小时试听排行</div>
                <form name="24ting" method="post" action="/MusicPlay/Playlist">
                <div class="MusicList">
                    <ul>
                        <%foreach (var item in Model.musics.Where(p => p.Ranking <= 15))
                          { %><li>
                              <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new{mid=item.Mid})%>
                          </li>
                        <%} %>
                    </ul>
                </div>
                <div class="clearfloat">
                </div>
                <div class="musicbottombg">
                    <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                    <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                    <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                </form>
            </div>
            <!--最新专辑-->
            <div class="SingerBox">
                <div class="title">
                    最新专辑</div>
                <div class="hotkeyword">
                    <ul>
                        <%foreach (var item in Model.albums)
                          { %><li>
                              <%:Html.ActionLink(item.Aname, "Album", new { aid=item.Aid,aname=item.Aname})%>
                          </li>
                        <%} %>
                    </ul>
                </div>
            </div>
            <!--港台-->
            <div class="boxlist">
                <div class="title">
                    粤语歌曲推荐</div>
                <form name="gtting" method="post" action="/MusicPlay/Playlist">
                <div class="MusicList">
                    <ul>
                        <%foreach (var item in Model.musics.Where(p => p.Area == "GT" && p.Ranking != null))
                          { %><li>
                              <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new { mid = item.Mid })%>
                          </li>
                        <%} %>
                    </ul>
                </div>
                <div class="clearfloat">
                </div>
                <div class="musicbottombg">
                    <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                    <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                    <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                </form>
            </div>
            <!--欧美-->
            <div class="boxlist">
                <div class="title">
                    欧美歌曲推荐</div>
                <form name="amting" method="post" action="/MusicPlay/Playlist">
                <div class="MusicList">
                    <ul>
                        <%foreach (var item in Model.musics.Where(p => p.Area == "OM" && p.Ranking != null))
                          { %><li>
                              <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new { mid = item.Mid })%>
                          </li>
                        <%} %>
                    </ul>
                </div>
                <div class="clearfloat">
                </div>
                <div class="musicbottombg">
                    <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                    <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                    <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" /></div>
                </form>
            </div>
            <!--日韩-->
            <div class="boxlist">
                <div class="title">
                    日韩歌曲推荐</div>
                <form name="rhting" method="post" action="/MusicPlay/Playlist">
                <div class="MusicList">
                    <ul>
                        <%foreach (var item in Model.musics.Where(p => p.Area == "RH" && p.Ranking != null))
                          { %><li>
                              <input type="checkbox" name="checkbox" value="<%:item.Mid%>" /><%:Html.ActionLink(item.Mname, "Index", new { mid = item.Mid })%>
                          </li>
                        <%} %>
                    </ul>
                </div>
                <div class="clearfloat">
                </div>
                <div class="musicbottombg">
                    <input name="button" type="button" class="inputbutton" id="button" value="全选" onclick="CheckAll(this.form)" />
                    <input name="button" type="button" class="inputbutton" id="buttonf" value="反选" onclick="CheckOhter(this.form)" />
                    <input name="buttonlb" type="submit" class="inputbutton" id="buttonlb" value="播放" />
                </div>
                </form>
            </div>
            <div class="clearfloat" style="height: 0px">
            </div>
        </div>
    </div>
</asp:Content>
