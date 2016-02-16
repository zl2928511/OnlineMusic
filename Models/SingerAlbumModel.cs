using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 天籁之声.Models
{
    public class SingerAlbumModel
    {
        public IEnumerable<Singer> singers { get; set; }
        public IEnumerable<Album> albums { get; set; }
        public SingerAlbumModel(IEnumerable<Singer> singer, IEnumerable<Album> album)
        {
            this.albums = album;
            this.singers = singer;
        }
    }
}