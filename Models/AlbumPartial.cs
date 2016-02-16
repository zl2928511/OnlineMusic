using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace 天籁之声.Models
{
    [MetadataType(typeof(AlbumMetadata))]
    public partial class Album
    {
        private class AlbumMetadata
        {
            [Required(ErrorMessage = "不能为空")]
            [DisplayName("专辑名称")]
            public string Aname { get; set; }

            [DisplayName("歌手姓名")]
            public string Sname { get; set; }

            [DisplayName("发行日期")]
            public DataType CreatTime { get; set; }

            [DisplayName("专辑图片")]
            public string APicture { get; set; }

            [DisplayName("地区")]
            public string Area { get; set; }
        }
    }
}