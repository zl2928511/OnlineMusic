<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<天籁之声.Models.Music>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lrc</title>
    <style type="text/css">
        .lrc
        {
            height: 245px;
            overflow-y: scroll;
            scrollbar-face-color: #b3e2fe;
            overflow-x: hidden;
            scrollbar-shadow-color: #daf1ff;
            scrollbar-arrow-color: #50baec;
            scrollbar-track-color: #edfbff;
            scrollbar-darkshadow-color: #b3e2fe;
            scrollbar-base-color: #b3e2fe;
            scrollbar-mediumlight-color: #B3E2FE;
            color: #3AA7CB;
        }
    </style>
</head>
<body>
    <!-- 歌词开始 -->
    <div>
        <div id="list" class="lrc">
        </div>
        <div id="lrc">
            <%=Model.Lyric %>
            
        </div>
        <div id="time">
        </div>
        <script type="text/javascript" src="/js/lrc.js"></script>
    </div>
    <!-- 歌词结束 -->
</body>
</html>
