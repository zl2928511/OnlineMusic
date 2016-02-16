// JavaScript Document
//document.domain="localhost";
$ = function (a,g){ 
    var o = new Array();     
    var c = new Array();     
    var r;                     
    var u;                     
    var a = a.split(';');     
    var e="keydowns,resize,load,dblclick,click,mouseout,mouseover, mousemove,mouseup,mousedown,inputchange,inputfocus,inputblur".split(","); 
    for( var i=0;i<e.length;i++ ){eval(e[i]+"=function (s){eval($event('on"+e[i].replace("input","")+"'))}") 
    }
    after = function (t,d,s){ 
        $after = function (){ 
            var $n=document.createElement 
(t); 
            if(d!=null){ 
                $n.id=d;     
            } 
            u.insertBefore($n,null)      
            r = $n;         
            u = $n;         
        } 
        $for(s,"$after") 
    } 
    show  = function (s){ 
        $show = function (){ 
            u.style.display!="none" ? style 
("display:none") : style("display:block") ; 
        } 
        $for(s,"$show") 
    } 
    check  = function (t,s){ 
        $check = function (){ 
             if(t=="2"){ 
                if(u.checked){ 
                    u.checked =  
false; 
                }else{ 
                    u.checked =  
true; 
                } 
             }else{ 
                u.checked =  t*1 ; 
             } 
        } 
        $for(s,"$check") 
    } 
    style = function (v,s){ 
        $style = function (){ 
            var $n = v.split(",")  
            for (var i=0;i<$n.length;i++ ){ 
                var $m = $n[i].split 
(":")  
                eval("u.style."+$m[0] 
+"='"+$m[1]+"'"); 
            } 
        } 
        $for(s,"$style") 
    } 
    value = function (v,s){ 
        var $n= $this (v); 
        $value = function (){ 
            u.value = $n 
        } 
        $for(s,"$value")     
    } 
    text = function (v,s){ 
        var $n= $this (v); 
        $text = function (){ 
            u.text = $n 
        } 
        $for(s,"$text")     
    } 
    innerhtml = function (v,s){ 
        var $n= $this (v); 
        $innerhtml = function (){ 
            u.innerHTML = $n 
        } 
        $for(s,"$innerhtml") 
    } 
    removechild = function (s){ 
        $removechild = function (){ 
u.parentNode.removeChild(u) 
        } 
        $for(s,"$removechild") 
    } 
    $this =function(v){ 
        if(v.indexOf("this") == 0){ 
            return eval(v.replace 
("this","u")) 
        } 
        return v; 
    } 
    $event = function (s){ 
        var $n ="u."+s+" = function(){$work(this,s);}" 
        return $n; 
    } 
    $replace = function (s){ 
    } 
    $for = function (s,c){ 
        var $n="this."+c+"()" ; 
        if(s!=null){ 
            var $m =$test(s); 
            for (var i=0;i<$m.length ;i++ ){ 
                u = $m[i]; 
                eval($n); 
            } 
        } 
        else{ 
            eval($n); 
        } 
    } 
    $test = function (a){ 
        var o = new Array();$o(a.split(';'),o); 
        return o; 
    } 
    $format  = function(s){ 
        while (s.indexOf("'")>0){ 
            s=s.replace("'","\""); 
        } 
        while (s.indexOf("][")>0){ 
            s=s.replace("][","','") 
        } 
        while (s.indexOf("[")>0){ 
            s=s.replace("[","'").replace 
("]","'") 
        }  
        return s; 
    } 
    $work = function(w,s){ 
        u=w;eval(s) 
    } 
    $id = function (s){ 
        return document.getElementById(s); 
    } 
    $name = function (s){ 
        return document.getElementsByName(s); 
    } 
    $tagname = function (s){ 
        return document.getElementsByTagName(s); 
    } 
    $o = function (a,o,c){ 
        $push = function  (n) { 
            for (var i=0;i< n.length;i++ ){ 
                o.push(n[i]); 
            }     
        } 
        for(var i=0;i<a.length;i++){ 
            if(a[i].indexOf("(") >= 0){ 
                c.push(a[i]); 
            } 
            if(a[i].indexOf("~") > 0){
			try {
				$push(eval(a[i].replace("#","document.getElementById('").replace("~@","').getElementsByTagName('")+"')")); 
                }catch(e) 
                {}       
            } 
            else{ 
                if(a[i].indexOf("#") 
==0){ 
                        o.push 
($id(a[i].replace("#",""))); 
                } 
                if(a[i].indexOf(".") 
==0){ 
                        $push 
($name(a[i].replace(".",""))); 
                } 
                if(a[i].indexOf("@")==0  
){ 
                        $push 
($tagname(a[i].replace("@",""))); 
                } 
                if(a[i].indexOf("*") 
==0){ 
                        $p= a 
[i]; 
                        if 
($p.indexOf(".")< 0){ 
$p = $p.replace("parent","parentNode") 
                        } 
                        var $p  
="u."+$p.replace("*",""); 
                        while  
($p.indexOf("parent.")> 0){ 
$p = $p.replace("parent.","parentNode.") 
                        } 
                        while  
($p.indexOf("child{")> 0){ 
$p = $p.replace("child{","childNodes[").replace("}","]") 
                        } 
                        o.push 
(eval($p)); 
                } 
                if(a[i].indexOf 
("document")==0 || a[i].indexOf("window")==0){ 
                        o.push 
(eval(a[i])); 
                } 
            } 
            if(g!=null){      
                o.push(g);g=null 
            }          
        } 
    } 
    $o(a,o,c); 
    for(var i = 0;i<o.length;i++){ 
        for(var j=0;j<c.length;j++){ 
             u = o[i];eval($format(c[j])); 
        } 
    } 
    if(o.length == 0){ 
        for(var i=0;i<c.length;i++){ 
             eval($format(c[i])); 
        } 
    } 
    if(r!=null){ 
        return r; 
    } 
    if(o.length==1){ 
        return o[0]; 
    } 
    else{ 
        return o 
    }  
 } 
var  lrc =$("#lrc;show()").innerHTML.split("["); 
if(lrc.length>5){ 
var array = new Array(); 
for (var i=0;i<lrc.length ;i++ ) 
{ 
    var g = new Object(); 
    t= lrc[i].split("]"); 
    g.time = getTime(t[0]); 
    if(isNaN(g.time)) 
        continue; 
        g.c = t[1]; 
    if(g.c == "") 
        g.c = getNext(i); 
        array.push(g); 
} 
array.sort(function(x, y) { 
    if (x.time>y.time)   
        return 1; 
    else if(x.time<y.time) 
        return -1; 
    else 
        return 0; 
    }                    
); 
for(var i = 0;i<array.length;i++) 
{ 
    var g = array[i]; 
    if(!g.c){ 
        g.c="";
		}
		$("#list").innerHTML+="<div id=lrc"+i+">"+g.c+"</div>"; 
} 
var time = setInterval("lrcList()",500);       
}else{ 
    $("#list").innerHTML=$("#lrc").innerHTML; 
} 
function getNext(i) 
{ 
    var result = ""; 
    var i = i+1; 
    t = lrc[i].split("]"); 
    if(t[1]=="") 
        result = getNext(i); 
    else 
        result = t[1] 
    return result; 
} 
function getTime(str) 
{ 
    var time =0; 
    var ta = str.split(":"); 
    if(ta.length<2) 
        return time; 
    if(ta[1].indexOf(".")>0){ 
        var tb = ta[1].split("."); 
        time = ta[0]*60*1000+tb[0]*1000+tb[1] 
*10; 
    } 
    else 
        time =ta[0]*60*1000+ta[1]*1000; 
    return time; 
} 
var preTime = 0; 
var nextTime = 0; 
var currIndex =0; 
function lrcList(){
    var s = parent.document.getElementById("MediaPlayer").controls.CurrentPosition; 
    s = s*1000; 
    if(s==0){ 
        currIndex =0; 
        $("#list").scrollTop =  
$("#lrc"+currIndex).offsetTop-30; 
        for(var i=0;i<array.length;i++){ 
            document.getElementById 
("lrc"+i).style.color='#3AA7CB'; 
        } 
        return; 
    } 
    if(s>0&&currIndex<array.length-1) 
    {     
        preTime = array[currIndex].time; 
        nextTime = array[currIndex+1].time; 
        if(s>=preTime&&s<nextTime){ 
        } 
        else if(s>=nextTime) 
        { 
            document.getElementById 
("lrc"+currIndex).style.color='#ccc'; 
            currIndex++; 
            $("#list").scrollTop =  
$("#lrc"+currIndex).offsetTop-30; 
            document.getElementById 
("lrc"+currIndex).style.color='#ff0000'; 
            lrcList(); 
        } 
        else{ 
            document.getElementById 
("lrc"+currIndex).style.color='#3AA7CB'; 
            currIndex--; 
            $("#list").scrollTop =  
$("#lrc"+currIndex).offsetTop-30; 
            document.getElementById 
("lrc"+currIndex).style.color='#ff0000'; 
            lrcList(); 
        }         
    } 
    else 
    { 
        if(s<array[array.length-1].time){ 
            currIndex = 0; 
            $("#list").scrollTop =  
$("#lrc"+currIndex).offsetTop-30; 
            for(var i=0;i<array.length;i++){ 
                document.getElementById 
("lrc"+i).style.color='#3AA7CB'; 
            } 
            lrcList(); 
        } 
    } 
} 
