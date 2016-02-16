using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace 天籁之声.Models
{
    [MetadataType(typeof(SingerMetadata))]
    public partial class Singer
    {
        private class SingerMetadata
        {
            [Required(ErrorMessage = "不能为空")]
            [DisplayName("歌手姓名")]
            public string Sname { get; set; }

            [DisplayName("歌手照片")]
            public string Sphoto { get; set; }

            [Required(ErrorMessage = "输入True或者False")]
            [DisplayName("是否推荐")]
            public bool TuiJian { get; set; }
        }
    }
}