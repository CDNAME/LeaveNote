/**
 * 封装了ajax
 */
function createRequest(){
	var ajax = null;
	if (window.XMLHttpRequest) { 
		ajax = new XMLHttpRequest();
	}else if (window.ActiveXObject) { 
		 ajax = new ActiveXObject("Msxml2.XMLHTTP"); 
	}else{
	 alert("该浏览器["+window.navigator.userAgent+"]不支持ajax");
	}
	return ajax;
}

function ajax(options){
	//创建对象
	var ajax = createRequest();
	//接收响应信息
	ajax.onreadystatechange=function(){
		if(4 == ajax.readyState && 200 == ajax.status){
			var result = ajax.responseText;
			options.success(result);
		}
	}
	//初始化参数
	if(options.method.toLocaleLowerCase() == "post"){
		ajax.open(options.method,options.url,options.async);
		ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		ajax.send(options.data);
	}
	if(options.method.toLocaleLowerCase() == "get"){
		ajax.open(options.method,options.url+(options.data != null) ? ("?"+options.data) : "" , options.async);
		ajax.send(null);
	}
}

function ajaxPost(url, data , success){
	ajax({
		method : "post" , 
		url : url , 
		data : data , 
		success : success
	});
}

function ajaxGet(url, data , success){
	ajax({
		method : "get" , 
		url : url , 
		data : data , 
		success : success
	});
}