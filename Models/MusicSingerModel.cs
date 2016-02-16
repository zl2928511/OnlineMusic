using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 天籁之声.Models
{
    public class MusicSingerModel
    {
        public IEnumerable<Singer> singers { get; set; }
        public IEnumerable<Music> musics { get; set; }
        public IEnumerable<Album> albums { get; set; }
        public MusicSingerModel(IEnumerable<Singer> singer, IEnumerable<Music> music, IEnumerable<Album> album)
        {
            this.musics = music;
            this.singers = singer;
            this.albums = album;
        }
    }
}