// JavaScript Document
function keyChange()
{
 var evt=window.event;
 var nKeyCode=evt.keyCode||evt.which;
}

/*用户名*/
function onkeyusername()
{
	document.getElementById("u").className="smsg";
	document.getElementById("u").innerHTML="中文、英文字母、数字(0-9_.)，长度3-20位";
}
function upkeyusername()
{
	var patrn=/^(\w+)|([\u0391-\uFFE5]+)$/;
	var txts=document.getElementById("username").value;
if(txts.length<3 || txts.length>20 || !patrn.exec(txts)){
	document.getElementById("u").className="errmsg";
	document.getElementById("u").innerHTML="长度3-20，由中文、英文字母、数字(0-9_.)的用户名";
	return false;	
}
else
{
	document.getElementById("u").className="okmsg";
	document.getElementById("u").innerHTML="填写正确";
	return true;
	}

}
/*密码*/
function onkeypassword()
{
	document.getElementById("p").className="smsg";
	document.getElementById("p").innerHTML="密码长度为6-20个字符";
}
function upkeypassword()
{
	var patrn=/^\w+$/;
	var txts=document.getElementById("password").value;
if(txts.length<6 || txts.length>20 || !patrn.exec(txts)){
	document.getElementById("p").className="errmsg";
	document.getElementById("p").innerHTML="密码为6-20个由英文字母、数字(0-9_.)的字符";	
	return false;	
}
else
{
	document.getElementById("p").className="okmsg";
	document.getElementById("p").innerHTML="填写正确";
	return true;
	}

	
}
//重复密码
function onkeypass()
{
	document.getElementById("p2").className="smsg";
	document.getElementById("p2").innerHTML="请重复输入上面的密码";
}

function upkeypass()
{
	var txts=document.getElementById("pass").value;
	var txt=document.getElementById("password").value;
if(txts!=txt){
	document.getElementById("p2").className="errmsg";
	document.getElementById("p2").innerHTML="两次输入的密码不相同";
		return false;
}
else
{
	document.getElementById("p2").className="okmsg";
	document.getElementById("p2").innerHTML="填写正确";
		return true;
	}

}
/*昵称*/
function onkeynickname()
{
	document.getElementById("n").className="smsg";
	document.getElementById("n").innerHTML="中文、英文字母、数字(0-9_.)，长度2-16位";
}
function upkeynickname() {
    var patrn = /^(\w+)|([\u0391-\uFFE5]+)$/;
    var txts = document.getElementById("nickname").value;
    if (txts.length < 2 || txts.length > 16 || !patrn.exec(txts)) {
        document.getElementById("n").className = "errmsg";
        document.getElementById("n").innerHTML = "长度3-20，由中文、英文字母、数字(0-9_.)的昵称";
        return false;
    }
    else {
        document.getElementById("n").className = "okmsg";
        document.getElementById("n").innerHTML = "填写正确";
        return true;
    }
}

    /*email*/
    function onkeyemail() {
        document.getElementById("e").className = "smsg";
        document.getElementById("e").innerHTML = "请输入您常用的电子邮件,用于取回密码";
    }
    function upkeyemail() {
        var patrn = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        var txts = document.getElementById("email").value;
        if (!patrn.exec(txts)) {
            document.getElementById("e").className = "errmsg";
            document.getElementById("e").innerHTML = "电子邮件的格式不正确";
            return false;
        }
        else {
            document.getElementById("e").className = "okmsg";
            document.getElementById("e").innerHTML = "填写正确";
            return true;
        }

    }

    function checkform() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var pass = document.getElementById("pass").value;
        var email = document.getElementById("email").value;
        var nickname = document.getElementById("nickname").value;
        if (!upkeyusername() || !upkeypassword() || !upkeypass() || !upkeyemail() || !upkeynickname) {
            return false;
        }
        else {
            return true;
        }
    }

