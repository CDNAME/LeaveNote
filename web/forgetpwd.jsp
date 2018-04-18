<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<script src="js/jquery-1.9.1.min.js"></script>
<style>
@charset "utf-8";
	/* track base Css */
.container {
	margin-top:100px;
}
.red {
	color:red;
}
#ehong-code-input {
	width:42px;
	letter-spacing:2px;
	margin:0px 8px 0px 0px;
}
.ehong-idcode-val {
	position:relative;
	padding:1px 4px 1px 4px;
	top:0px;
	*top:-3px;
	letter-spacing:4px;
	display:inline;
	cursor:pointer;
	font-size:16px;
	font-family:"Courier New",Courier,monospace;
	text-decoration:none;
	font-weight:bold;
}
.ehong-idcode-val0 {
	border:solid 1px #A4CDED;
	background-color:#ECFAFB;
}
.ehong-idcode-val1 {
	border:solid 1px #A4CDED;
	background-color:#FCEFCF;
}
.ehong-idcode-val2 {
	border:solid 1px #6C9;
	background-color:#D0F0DF;
}
.ehong-idcode-val3 {
	border:solid 1px #6C9;
	background-color:#DCDDD8;
}
.ehong-idcode-val4 {
	border:solid 1px #6C9;
	background-color:#F1DEFF;
}
.ehong-idcode-val5 {
	border:solid 1px #6C9;
	background-color:#ACE1F1;
}
.ehong-code-val-tip {
	font-size:12px;
	color:#1098EC;
	top:0px;
	*top:-3px;
	position:relative;
	margin:0px 0px 0px 4px;
	cursor:pointer;
}
</style>
</head>
<body>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp"><div class="btnback"></div>返回</a>
				</div>
			</div>
		</nav>
<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <form action="resetpwd.jsp" method="post">

            <div class="form-group has-feedback">
                <label for="phoneNum">手机号码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                    <input id="phoneNum" class="form-control" name="myphone" placeholder="请输入手机号码" maxlength="11" type="text">
                </div>
                <span style="color:red;display: none;" class="tips"></span>
            </div>

            <div class="row">
                <div class="col-xs-7">
                    <div class="form-group has-feedback">
                        <label for="idcode-btn">校验码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                            <input id="idcode-btn" class="form-control" placeholder="请输入校验码" maxlength="6" type="text">
                        </div>
                        <span style="color:red;display: none;" class="tips"></span>
                    </div>
                </div>
                <div class="col-xs-5 text-center" style="padding-top: 26px">
                    <button type="button" id="loadingButton" class="btn btn-primary" autocomplete="off">获取短信校验码</button>
                </div>
            </div>

            <div class="form-group">
                <input class="form-control btn btn-primary" id="submit" value="下一步" type="submit">
            </div>

            <div class="form-group">
                <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
            </div>
        </form>
    </div>
</div>

<script>

var check = [false, false];

//校验成功函数
function success(Obj, counter) {
    $('.tips').eq(counter).hide();
    check[counter] = true;

}

// 校验失败函数
function fail(Obj, counter, msg) {
    $('.tips').eq(counter).text(msg).show();
    check[counter] = false;
}


// 手机号码
var regPhoneNum = /^[0-9]{11}$/;
var myphone;
$('.container').find('input').eq(0).change(function() {
    if (regPhoneNum.test($(this).val())) {
    	myphone = $(this).val();
    	$.ajax({  
            type: "POST", //用POST方式传输  
            url: 'only', //目标地址  
            data: "myphone=" + $(this).val() +"&oper=phone",  
            success: function (result){ 
           		if(result == 'true'){
           			success($(this), 0);
           		}else{
           			fail($(this), 0, '手机号不存在');
           		}
            }  
        }); 
    } else {
        fail($(this), 0, '手机号码只能为11位数字');
    }
});

//短信验证码
var regMsg;
$('.container').find('input').eq(1).change(function() {
    if (check[0]) {
        if (regMsg == $(this).val()) {
            success($(this), 1);
        } else {
            fail($(this), 1, '短信验证码错误');
        }
    } else {
        alert("请输入手机验证码")
    }

});


$('#loadingButton').click(function() {

    if (check[0]) {
    	$.ajax({  
            type: "POST", //用POST方式传输  
            url: 'Sms', //目标地址  
            data: "myphone="+myphone+"&oper=changePassword",  
            success: function (result){ 
           		regMsg = result;
            }  
        });
        $(this).removeClass('btn-primary').addClass('disabled');

        $(this).html('<span class="red">59</span> 秒后重新获取');
        var secondObj = $('#loadingButton').find('span');
        var secondObjVal = secondObj.text();

        function secondCounter() {

            var secondTimer = setTimeout(function() {
                secondObjVal--;
                secondObj.text(secondObjVal);
                secondCounter();
            }, 1000);
            if (secondObjVal == 0) {
                clearTimeout(secondTimer);
                $('#loadingButton').text('重新获取校验码');
                $('#loadingButton').removeClass('disabled').addClass('btn-primary');

            }
        }

        secondCounter();
    } else {
        alert("请输入手机号");
    }

})

$('#submit').click(function(e) {
    if (!check.every(function(value) {
            return value == true
        })) {
        e.preventDefault();
        alert("请填完");
    }
});

$('#reset').click(function() {
    $('input').slice(0, 2).parent().parent().removeClass('has-error has-success');
    $('.tips').hide();
    $('.glyphicon-ok').hide();
    $('.glyphicon-remove').hide();
    check = [false, false];
});
</script>

</body>
</html>
