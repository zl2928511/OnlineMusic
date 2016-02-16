<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<天籁之声.Models.Music>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin: 0 auto; width: 980px; text-align: left">
        <thead>
            <tr>
                <th style="width: 10%">
                    序号
                </th>
                <th style="width: 30%">
                    歌名
                </th>
                <th style="width: 20%">
                    演唱者
                </th>
                <th style="width: 30%">
                    专辑
                </th>
                <th style="width: 10%">
                    点击下载
                </th>
            </tr>
        </thead>
    </table>
    <table id="albumsongs" style="margin: 0 auto; width: 980px">
        <%foreach (var item in Model)
          { %>
        <tr>
            <td style="width: 10%">
                <%: item.Mid %>
            </td>
            <td style="width: 30%">
                <%: item.Mname %>
            </td>
            <td style="width: 20%">
                <%: item.Sname %>
            </td>
            <td style="width: 30%">
                <%: item.Aname %>
            </td>
            <td style="width: 10%">
                <a href="<%:item.Url %>">Download↓↓</a>
            </td>
        </tr>
        <%} %>
    </table>
    <input type="hidden" id="pgsize" value="24" />
    <p align="center" style="color: #5bb7d4">
        <a onclick="showtr(1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
            onmouseout="this.style.color='#5bb7d4'">首页</a> <a onclick="showtr(pages-1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                onmouseout="this.style.color='#5bb7d4'">上一页</a> <a onclick="showtr(pages+1);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                    onmouseout="this.style.color='#5bb7d4'">下一页</a> <a onclick="showtr(totlepage);" onmouseover="this.style.cursor='hand';this.style.color='Red'"
                        onmouseout="this.style.color='#5bb7d4'">末页</a> 第<span id="currentpage1" style="color: Blue"></span>页
        共<span id="totlepages" style="color: Blue">1</span> 页</p>
    <script type="text/javascript" src="../../js/Page.js"></script>
</asp:Content>
