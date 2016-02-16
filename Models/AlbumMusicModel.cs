using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 天籁之声.Models
{
    public class AlbumMusicModel
    {
        public IEnumerable<Music> musics { get; set; }
        public IEnumerable<Album> albums { get; set; }
        public AlbumMusicModel(IEnumerable<Music> music, IEnumerable<Album> album)
        {
            this.albums = album;
            this.musics = music;
        }
    }
}