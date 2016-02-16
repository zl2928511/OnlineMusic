<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.Album>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="width: 980px; text-align: left; font-size:larger; line-height:18px;margin:0 auto">
            搜索结果：
            <br />
            <%foreach (var item in Model)
              { %>
            <%:Html.ActionLink("《"+item.Aname+"》", "Album", new{Aid=item.Aid,Aname=item.Aname})%>
            <br />
            <%} %>
        </div>
</asp:Content>
