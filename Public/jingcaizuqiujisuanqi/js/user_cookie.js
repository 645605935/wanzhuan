var username="userName";

function SetCookie (value)  
    {  
	var exp = new Date();   
    exp.setTime(exp.getTime() + (1*1*60*60*1000));  
    window.document.cookie = username + "=" + escape (value) + "; expires=" + exp.toGMTString()+";path=/;domain=lottery.gov.cn";  
} 
function DeleteCookie ()  
{   
    var exp = new Date();   
    exp.setTime (exp.getTime() - 100);   
    var cval = GetCookie (username);   
    window.document.cookie = username + "=" + cval + "; expires=" + exp.toGMTString()+";path=/;domain=lottery.gov.cn";  
}

function GetCookie (username)   
{   
    var arg = username + "=";   
    var alen = arg.length;   
    var clen = window.document.cookie.length;   
    var i = 0;   
    while (i < clen)   
    {   
        var j = i + alen;   
        if (window.document.cookie.substring(i, j) == arg) return getCookieVal (j);   
        i = window.document.cookie.indexOf(" ", i) + 1;   
        if (i == 0)  
            break;   
    }   
    return null;  
}  
function getCookieVal (offset)  
{   
    var endstr = window.document.cookie.indexOf (";", offset);   
    if (endstr == -1)  
        endstr = window.document.cookie.length;   
    return unescape(window.document.cookie.substring(offset, endstr));  
} 