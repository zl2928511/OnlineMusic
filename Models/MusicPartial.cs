using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace 天籁之声.Models
{
    [MetadataType(typeof(MusicMetadata))]
    public partial class Music
    {
        private class MusicMetadata
        {
            [Required(ErrorMessage = "不能为空")]
            [DisplayName("歌曲名称")]
            public string Mname { get; set; }          

            [DisplayName("歌手姓名")]
            public string Sname { get; set; }

            [DisplayName("歌曲地址")]
            public string Url { get; set; }

            [DisplayName("歌词")]
            public string Lyric { get; set; }

            [DisplayName("排名")]
            public int Ranking { get; set; }

            [DisplayName("地区")]
            public string Area { get; set; }

            [DisplayName("所属专辑")]
            public string Aname{ get; set; }
        }
    }
}