///*
//* Created on 2006-2-22
//* Last modified on 2006-03-16
//* Powered by www.YeQiangWei.com
//*/
var agt = navigator.userAgent.toLowerCase();
var is_op = (agt.indexOf("opera") != -1);
var is_ie = (agt.indexOf("msie") != -1) && document.all && !is_op;
var is_ie5 = (agt.indexOf("msie 5") != -1) && document.all && !is_op;
var is_mac = (agt.indexOf("mac") != -1);
var is_gk = (agt.indexOf("gecko") != -1);
var is_sf = (agt.indexOf("safari") != -1);
var is_saf = ((agt.indexOf('applewebkit') != -1) || (navigator.vendor == 'Apple Computer, Inc.'));
var is_ie4 = ((is_ie) && (agt.indexOf('msie 4.') != -1));
var is_moz = ((navigator.product == 'Gecko') && (!is_saf));
var is_kon = (agt.indexOf('konqueror') != -1);
var is_ns = ((agt.indexOf('compatible') == -1) && (agt.indexOf('mozilla') != -1) && (!is_opera) && (!is_webtv) && (!is_saf));
var is_ns4 = ((is_ns) && (parseInt(navigator.appVersion) == 4));
var is_opera = ((agt.indexOf('opera') != -1) || (typeof (window.opera) != 'undefined'));
var is_webtv = (agt.indexOf('webtv') != -1);
var is_regexp = (window.RegExp) ? true : false;
var ignorequotechars = false;
var pointer_cursor = (is_ie ? 'hand' : 'pointer');

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

function postSubmit(name, bea, val) {
    if (bea) {
        if (val) { getObject(name).value = val; }
        getObject(name).disabled = true;
    } else {
        if (val) { getObject(name).value = val; }
        getObject(name).disabled = false;
    }
    return;
}

/* this code powered by google */
function CreateXmlHttpReq(handler) {
    var xmlhttp = null;
    if (is_ie) {
        /* Guaranteed to be ie5 or ie6 */
        var control = (is_ie5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
        try {
            xmlhttp = new ActiveXObject(control);
            xmlhttp.onreadystatechange = handler;
        } catch (ex) {
            /* TODO: better help message */
            alert("You need to enable active scripting and activeX controls");
        }
    } else {
        /* Mozilla */
        xmlhttp = new XMLHttpRequest();
        xmlhttp.onload = handler;
        xmlhttp.onerror = handler;
    }
    return xmlhttp;
}

/* XMLHttp send POST request */
function XmlHttpPOST(xmlhttp, url, data) {
    try {
        xmlhttp.open("POST", url, true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xmlhttp.send(data);
    } catch (ex) {
        /* do nothing */
        alert("You need to enable active scripting and activeX controls");
    }
}

/* XMLHttp send GEt request */
function XmlHttpGET(xmlhttp, url) {
    try {
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
    } catch (ex) {
        /* do nothing */
    }
}

function setCookie(name, value, hours) {
    var expire = "";
    if (hours != null) {
        expire = new Date((new Date()).getTime() + hours * 3600000);
        expire = "; expires=" + expire.toGMTString();
    }
    document.cookie = name + "=" + escape(value) + ";path=/" + expire;
}

function getCookie(name) {
    var cookieValue = "";
    var search = name + "=";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if (end == -1) end = document.cookie.length;
            cookieValue = unescape(document.cookie.substring(offset, end));
        }
    }
    return cookieValue;
}

function Common() {
    this.openpop = function (obj, url, w, h) {
        if (typeof w == undefined) { w = 510; }
        if (typeof h == undefined) { h = 220; }
        var t, l;
        if (obj) {
            obj.onclick = function (e) {
                var tempx = window.screen.availWidth;
                var tempy = window.screen.availHeight
                t = (tempy - h) / 2;
                l = (tempx - w) / 2;
                window.open(url, '', "width=" + w + ",height=" + h + ",top=" + t + ",left=" + l + ",scrollbars=0,resizable=1,scrollbars=yes");
            }
        } else {
            if (typeof t == undefined) { t = 200; }
            if (typeof l == undefined) { l = 100; }
            window.open(url, '', "width=" + w + ",height=" + h + ",top=" + t + ",left=" + l + ",scrollbars=0,resizable=1,scrollbars=yes");
        }
        return false;
    }

    this.create = function (txt, w, h) {
        var o = document.createElement(txt, w, h);
        if (w) { o.style.width = w + "px"; }
        if (h) { o.style.height = h + "px"; }
        return o;
    };

    this.getCookie = function (name) {
        var cookieValue = "";
        var search = name + "=";
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(search);
            if (offset != -1) {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1) end = document.cookie.length;
                cookieValue = unescape(document.cookie.substring(offset, end));
            }
        }
        return cookieValue;
    };

    this.setCookie = function (name, value, hours) {
        var expire = "";
        if (hours != null) {
            expire = new Date((new Date()).getTime() + hours * 3600000);
            expire = "; expires=" + expire.toGMTString();
        }
        document.cookie = name + "=" + escape(value) + ";path=/" + expire;
    };

    this.o = function (obj) {
        return getObject(obj);
    };

    this.t = function (obj, flag) {
        return getTags(obj, flag);
    };

    this.h = function (o) {
        if (getObject(o).style.display != "block") {
            getObject(o).style.display = "block";
        } else {
            getObject(o).style.display = "none";
        }
    };

    this.p = function (name, bea, val) {
        if (bea) {
            if (val) { this.o(name).value = val; }
            this.o(name).disabled = true;
        } else {
            if (val) { this.o(name).value = val; }
            this.o(name).disabled = false;
        }
        return;
    };

    this.cf = function (txt, url) {
        var pass = confirm(txt);
        if (pass) {
            location.assign(url);
        }
    };

    this.clk = function (act, id) {
        var v = "";
        var o;
        var a = this.t(this.o(id), "input");
        for (var i = 0; i < a.length; i++) {
            o = a[i];
            if (act == "all") {
                o.checked = true;
            } else if (act == "un") {
                if (o.checked) {
                    o.checked = false;
                } else {
                    o.checked = true;
                }
            } else {
                var n = a[i].value;
                if (n > 0 && a[i].checked) {
                    v = v + a[i].value + "_";
                }
            }
        }
    };

    this.getHtml = function (id) {
        if (this.o(id)) {
            return this.o(id).innerHTML;
        }
    };

    this.setObjHtml = function (obj, str) {
        if (obj) {
            obj.innerHTML = str;
        }
    };

    this.setHtml = function (id, str) {
        if (this.o(id)) {
            this.o(id).innerHTML = str;
        }
    };

    this.getValue = function (id) {
        if (this.o(id)) {
            return this.o(id).value;
        }
    };

    this.setValue = function (id, str) {
        if (this.o(id)) {
            this.o(id).value = str;
        }
    };

    this.getUrl = function () {
        var s = self.location + "";
        return s;
    };

    this.remove = function (obj) {
        obj.parentNode.removeChild(obj);
    };

    this.removeById = function (id) {
        var obj = this.o(id);
        if (obj) obj.parentNode.removeChild(obj);
    };

    this.loading = function (flag, ap, top, left) {
        /*qwLoading("loadingDiv",flag,ap); qwLoading(div, flag, ap, top, left); */
        var obj = this.o("loadingDiv");
        if (top != undefined) {
            obj.style.top = top + "px";
        }
        if (left != undefined) {
            obj.style.left = left + "px";
        } else {
            obj.style.left = "40%";
        }
        obj.style.visibility = (flag) ? 'visible' : 'hidden'
        if (ap) {
            this.floatbg(flag);
        }
    };
    this.floatbg = function (i) {
        var o = this.o("divZoom");
        if (i == 1) {
            o.style.visibility = 'visible';
            o.style.height = document.documentElement.scrollHeight + "px";
            o.ondblclick = function (e) {
                o.style.visibility = 'hidden';
            };
        } else {
            o.style.visibility = 'hidden';
        }
    };
    this.hint = function (text, dis) {
        if (dis == undefined || dis) {
            this.o("hint").style.display = "block";
            this.o("hintmsg").innerHTML = text;
        } else {
            this.o("hintmsg").innerHTML = text;
            this.o("hint").style.display = "none";
        }
    };
}
var c = new Common();
/***************************/
function SelectUtil() {
    var slted = "";
    var sltValue = "";
    this.initialize = function (id) {
        sltValue = c.o(id).options[c.o(id).selectedIndex].value;
        slted = c.o(id).options[c.o(id).selectedIndex].text;
    };
    this.moveIn = function (id, toid) {
        if (slted != "") {
            var oOption = document.createElement("OPTION");
            oOption.text = slted;
            oOption.value = sltValue;
            c.o(id).options[c.o(id).selectedIndex] = null;
            c.o(toid).options.add(oOption);
            slted = "";
            sltValue = "";
        }
    };
    this.moveOut = function (id, toid) {
        this.moveIn(toid, id);
    };
    this.moveInAll = function (id, toid) {
        var o = c.t(c.o(id), "OPTION");
        for (var i = 0; i < o.length; i++) {
            c.o(toid).options.add(new Option(o[i].text, o[i].value));
        }
        c.o(id).options.length = 0;
    };
    this.moveOutAll = function (id, toid) {
        this.moveInAll(toid, id);
    };
    this.init = function (id, toid) {
        var o = c.t(c.o(toid), "OPTION");
        for (var i = 0; i < o.length; i++) {
            var value = o[i].value;
            var oo = c.t(c.o(id), "OPTION");
            for (var i2 = 0; i2 < oo.length; i2++) {
                if (oo[i2].value == value) {
                    this.removeByValue(id, value);
                }
            }
        }
    };
    this.removeByValue = function (id, value) {
        var o = c.t(c.o(id), "OPTION");
        for (var i = 0; i < o.length; i++) {
            if (value == o[i].value) {
                c.o(id).options.remove(i);
            }
        }
    };
}
var su = new SelectUtil();
function ShowMenu() {
    this.show = function (e, obj, txt, w, h) {
        var tempx = (!is_ie) ? e.pageX : event.clientX + document.body.scrollLeft;
        var tempy = (!is_ie) ? e.pageY : event.clientY + document.body.scrollTop;
        var div = c.o("showMenu");
        if (div == null) {
            div = c.create("div", w, h);
            div.id = "showMenu";
            document.body.appendChild(div);
        }
        div.className = "hint";
        if (is_ie) {
            div.style.top = (document.documentElement.scrollTop + tempy + 10) + "px";
            div.style.left = (document.documentElement.scrollLeft + tempx - 10) + "px";
        } else {
            div.style.top = (tempy + 10) + "px";
            div.style.left = (tempx - 10) + "px";
        }
        div.zIndex = "20";
        div.style.position = "absolute";
        div.innerHTML = txt;
        div.onmousemove = function (e) {
            if (!is_ie) {
                window.onmousemove = e;
            }
            var x = (!is_ie) ? e.pageX : event.clientX + document.body.scrollLeft;
            var y = (!is_ie) ? e.pageY : event.clientY + document.body.scrollTop;
            window.onmousemove = null;
            if (x < tempx || x > tempx + w - 10 || y > tempy + 10 + h) {
                c.remove(div);
            }
        };
    };
}
var sm = new ShowMenu();
function ModeUtil(tr, chk) {
    if (tr) {
        tr.onmouseover = function () {
            if (chk && !chk.checked) {
                tr.style.background = "#FCE3A5";
            }
        }
        tr.onmouseout = function () {
            if (chk && !chk.checked) {
                tr.style.background = "";
            }
        }
    }
    if (chk) {
        chk.onclick = function () {
            if (chk.checked) {
                tr.style.background = "#FCE3A5";
            }
        }
    }
}
function ModeStyle(id, tr, chk) {
    var tags = c.t(c.o(id), tr);
    var chks = c.t(c.o(id), chk);
    for (var i = 0; i < chks.length; i++) {
        var chk = chks[i];
        var tr = c.o("mode_" + chk.value);
        ModeUtil(tr, chk);
    }
}
/*
json.js
2006-04-28

This file adds these methods to JavaScript:

object.toJSONString()

This method produces a JSON text from an object. The
object must not contain any cyclical references.

array.toJSONString()

This method produces a JSON text from an array. The
array must not contain any cyclical references.

string.parseJSON()

This method parses a JSON text to produce an object or
array. It will return false if there is an error.
*/
(function () {
    var m = {
        '\b': '\\b',
        '\t': '\\t',
        '\n': '\\n',
        '\f': '\\f',
        '\r': '\\r',
        '"': '\\"',
        '\\': '\\\\'
    },
        s = {
            array: function (x) {
                var a = ['['], b, f, i, l = x.length, v;
                for (i = 0; i < l; i += 1) {
                    v = x[i];
                    f = s[typeof v];
                    if (f) {
                        v = f(v);
                        if (typeof v == 'string') {
                            if (b) {
                                a[a.length] = ',';
                            }
                            a[a.length] = v;
                            b = true;
                        }
                    }
                }
                a[a.length] = ']';
                return a.join('');
            },
            'boolean': function (x) {
                return String(x);
            },
            'null': function (x) {
                return "null";
            },
            number: function (x) {
                return isFinite(x) ? String(x) : 'null';
            },
            object: function (x) {
                if (x) {
                    if (x instanceof Array) {
                        return s.array(x);
                    }
                    var a = ['{'], b, f, i, v;
                    for (i in x) {
                        v = x[i];
                        f = s[typeof v];
                        if (f) {
                            v = f(v);
                            if (typeof v == 'string') {
                                if (b) {
                                    a[a.length] = ',';
                                }
                                a.push(s.string(i), ':', v);
                                b = true;
                            }
                        }
                    }
                    a[a.length] = '}';
                    return a.join('');
                }
                return 'null';
            },
            string: function (x) {
                if (/["\\\x00-\x1f]/.test(x)) {
                    x = x.replace(/([\x00-\x1f\\"])/g, function (a, b) {
                        var c = m[b];
                        if (c) {
                            return c;
                        }
                        c = b.charCodeAt();
                        return '\\u00' +
                            Math.floor(c / 16).toString(16) +
                            (c % 16).toString(16);
                    });
                }
                return '"' + x + '"';
            }
        };

    Object.prototype.toJSONString = function () {
        return s.object(this);
    };

    Array.prototype.toJSONString = function () {
        return s.array(this);
    };
})();

String.prototype.parseJSON = function () {
    try {
        return !(/[^,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/.test(
                this.replace(/"(\\.|[^"\\])*"/g, ''))) &&
            eval('(' + this + ')');
    } catch (e) {
        return false;
    }
};
