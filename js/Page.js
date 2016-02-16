        var pages; //当前页数
        var pagesize; //页大小
        var totlepage; //总页数
        function showtr(pages1) {
            pages = pages1;
            pagesize =document.getElementById("pgsize").value ;

            if (albumsongs.rows.length % pagesize == 0)//计算总页数
            {
                totlepage = albumsongs.rows.length / pagesize;
            }
            else {
                totlepage = parseInt(albumsongs.rows.length / pagesize) + 1;
            }

            if (pages < 1) //判断页数是否小于1
            {
                pages = 1;
            }

            if (pages > totlepage)//判断页数是否大于最大页数
            {
                pages = totlepage;
            }

            for (i = 0; i <= albumsongs.rows.length - 1; i++) //隐藏全部行
            {
                albumsongs.rows[i].style.display = "none";
            }

            for (i = (pages - 1) * pagesize; i <= pages * pagesize - 1 & i <= albumsongs.rows.length - 1; i++) //显示当前页的行
            {
                albumsongs.rows[i].style.display = "block";
            }

            currentpage1.innerHTML = pages;
            totlepages.innerHTML = totlepage;
        }

        function getObject(idname) {
            if (document.getElementById) {
                return document.getElementById(idname);
            } else if (document.all) {
                return document.all[idname];
            } else if (document.layers) {
                return document.layers[idname];
            } else {
                return null;
            }
        }
        function getTags(parentobj, tag) {
            if (parentobj == null) {
                return new Array();
            } else if (typeof parentobj.getElementsByTagName != 'undefined') {
                return parentobj.getElementsByTagName(tag);
            } else if (parentobj.all && parentobj.all.tags) {
                return parentobj.all.tags(tag);
            } else {
                return new Array();
            }
        }
        showtr(1);