<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.SingerAlbumModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div style="width: 980px;">
            <%foreach (var item in Model.singers.Where(p => p.Sid == Convert.ToInt32(ViewData["sid"])))
              {%>
            <div style="padding-top: 30px">
                <img src="../../images/SingerPhoto/<%:item.Sphoto%>" alt="<%:item.Sname %>" /></div>
            <div style="padding-top: 30px; font-size: larger">
                歌手：
                <label id="1" style="color: #3AA7CB;">
                    <%:item.Sname %></label></div>
            <%} %>
            <div style="padding-top: 10px; font-size: larger">
                专辑：<%foreach (var item in Model.albums.Where(p => p.Sname == ViewData["sname"].ToString()))
                     {%><label id="Label1">
                         <%:Html.ActionLink("《"+item.Aname+"》", "Album", new { Aid = item.Aid,Aname=item.Aname })%></label><%} %>
            </div>
        </div>
    </center>
</asp:Content>
