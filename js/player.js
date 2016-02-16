var PlayMode_Normal = 0;
var PlayMode_Random = 1;
var PlayMode_Single = 2;

function PlayerUtils() {
    var player = c.o("MediaPlayer");
    var ps = player.PlayState;
    var list = getTags(getObject("songlist"), "div");
    var total = list.length - 1;
    this.currentOrigin = 0;
    this.current = 0;
    var bg = "#fff";
    var dels = "";
    this.playMode = PlayMode_Normal;

    this.playList = null;
    this.init = function () {
        var mode_sel = document.getElementById("play_mode");
        var mode = mode_sel == null ? PlayMode_Normal : mode_sel.value;
        this.setPlayMode(mode);
    };
    this.setPlayMode = function (newPlayMode) {
        this.playMode = newPlayMode;
        var prePlayList = this.playList;
        if (this.playMode != PlayMode_Single)
            this.playList = [];
        if (this.playMode == PlayMode_Normal) {
            for (var i = 0; i < list.length; i++) {
                if (!this.isDel(i))
                    this.playList.push(list[i]);
            }
        }
        else
            if (this.playMode == PlayMode_Random) {
                var tempList = [];
                for (var i = 0; i < list.length; i++) {
                    if (!this.isDel(i))
                        tempList.push(list[i]);
                }
                var needAppend = tempList.length;
                for (; needAppend > 0; needAppend--) {
                    var index = parseInt(1000000000 * Math.random()) % needAppend;
                    this.playList.push(this.getAndRemoveFromArray(tempList, index));
                }
                if (prePlayList && prePlayList.length > 2 && prePlayList == this.playList.length)
                    if (this.playList[0] == prePlayList[prePlayList.length - 1]) {
                        var i = parseInt(this.playList.length / 2);
                        var tmp = this.playList[0];
                        this.playList[0] = this.playList[i];
                        this.playList[i] = tmp;
                    }
            }
        this.current = this.getPlayIndex(this.currentOrigin);
    };
    this.getAndRemoveFromArray = function (arr, index) {
        var ele = null;
        if (index >= 0 && index < arr.length) {
            ele = arr[index];
            for (var i = index; i < arr.length - 1; i++)
                arr[i] = arr[i + 1];
            arr.pop();
        }
        return ele;
    }
    this.getPlayIndex = function (origin_index) {
        for (var i = 0; i < this.playList.length; i++) {
            if (this.playList[i].id == ("p_" + origin_index)) {
                return i;
            }
        }
        return -1;
    }
    this.getItemOriginIndex = function (item) {
        return parseInt((item.id + "").replace("p_", ""));
    }
    this.getOriginIndex = function () {
        if (this.current < 0 || this.current >= this.playList.length) {
            this.current = 0;
        }
        if (this.playList.length == 0) return -1;
        var divEle = this.playList[this.current];
        var origin_index = this.getItemOriginIndex(divEle);
        if (origin_index >= 0) return origin_index;
        return 0;
    }

    this.removeFromPlayList = function (origin_index) {
        var playIndex = this.getPlayIndex(origin_index);
        if (playIndex > -1) {
            this.getAndRemoveFromArray(this.playList, playIndex);
            if (this.current >= playIndex) {//如果删除的歌曲
                this.current--;
            }
        }
    };
    this.setCanPlay = function (origin_index, play) {
        if (play) {
            if (this.playMode != PlayMode_Single) {
                this.playList.push(document.getElementById("p_" + origin_index));
            }
        }
        else {
            this.removeFromPlayList(origin_index);
        }
    };
    this.setColor = function (ii) {
        for (var i = 0; i < list.length; i++) {
            c.o("p_" + i).style.background = "#fff";
        }
        bg = "paleGreen";
        c.o("p_" + ii).style.background = "paleGreen";
    };
    this.mt = function (i) {
        c.o("p_" + i).style.background = bg;
    };
    this.mo = function (i) {
        bg = c.o("p_" + i).style.background;
        c.o("p_" + i).style.background = "powderblue";
    };
    this.del = function (i) {
        var flag = "|" + i + "|";
        if (dels.indexOf(flag) == -1) {
            dels += flag;
            c.setHtml("del_" + i, "恢复");
            this.setCanPlay(i, false);
            c.o("p_" + i).className = "oid_";
        } else {
            bg = "#fff";
            dels = dels.replace(flag, "");
            c.setHtml("del_" + i, "删除");
            this.setCanPlay(i, true);
            c.o("p_" + i).className = "oid";

        }
        return false;
    };
    this.doPlay = function () {
        ps = player.PlayState; /*1-stop 2-Suspended 3-play*/
        if (ps == 1) {
            this.doPlayNext(1);
        }
        setTimeout("pu.doPlay()", 1000);
    };
    this.doPlayNext = function (flag) {
        if (this.playMode != PlayMode_Single) {
            if (this.current + flag >= 0) {
                if ((this.current + 1) == this.playList.length && this.playMode == PlayMode_Random) {
                    this.setPlayMode(PlayMode_Random);
                }
                //if (this.playList && this.playList.length > 0)
                //this.current = (this.current + 1) % this.playList.length;
                this.current = this.current + flag;
            }
            else this.current = 0;
        }
        var oi = this.getOriginIndex();
        this.utils(oi);
    };
    this.isDel = function (t) {
        return dels.indexOf("|" + t + "|") >= 0;
    };
    this.utils = function (eleIndex) {
        this.currentOrigin = eleIndex;
        this.current = this.getPlayIndex(eleIndex);
        this.setColor(eleIndex);
        player.Url = c.o("url_" + eleIndex).value;
        player.src = c.o("url_" + eleIndex).value;
        document.getElementById("lrciframe").src = "../MusicPlay/Lrc?mid=" + c.o("songid_" + eleIndex).value;
        return false;
    };
}