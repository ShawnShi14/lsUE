<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户登录</title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="site.ico" />
    <link rel="stylesheet" type="text/css" href="dist/skin/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="dist/skin/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="dist/skin/css/ui.css" />
    <link rel="stylesheet" type="text/css" href="portal/portal.css" />
    <link rel="stylesheet" type="text/css" href="portal/login.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<!-- 页面结构 -->
	<form class="form-login"  id="saveForm" onsubmit="return false">
		<div class="error">
		</div>
		<div class="login-content">
			<div class="form-group">
				<input type="text" class="form-control ue-form" id="userName" value="" placeholder="请输入用户名"/>
			</div>
			<div class="form-group">
				<input type="password" class="form-control ue-form" id="password" value="" placeholder="请输入密码"/>
			</div>
			<div class="checkbox">
				<label class="form-checkbox">
					<input type="checkbox"> 下次自动登录
				</label>
				<label class="form-forget">
					<a>忘记密码？</a>
				</label>
			</div>
			<button class="btn btn-login" id="submit">登录</button>
		</div>
	</form>
	
    <!-- 需要引用的JS -->
    <script type="text/javascript" src="dist/js/jquery.js"></script>
   	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
   	<script type="text/javascript" src="dist/js/form.js"></script>
   	<script type="text/javascript" src="dist/js/ui.js"></script>
   	<script type="text/javascript">
   	var context = "<%=request.getContextPath()%>";
   	var dialog = parent.dialog.get(window);
    $(document).ready(function(){
    	$("#submit").bind("click", function(){
    		var userName = $("#userName").val();
        	var password = $("#password").val();
    		login(userName, password);
    	})
    	
    });
  //登录功能
    function login(userName,password) {
    	var uesrName = userName;
    	var password = password;
    	$.ajax({
    		type: "GET",
    		url: context + "/service/login/login?userName=" + userName + "&password=" + password,
    		success: function(flag) {
    			if(flag == "true") {
    				//将用户名放在cookie里面
    				if($("#remember").is(":checked")) {
    					$.cookie("userName", userName, {expires: 7});
    				}else {
    					$.cookie("userName",userName);
    				}
    				parent.location.reload();
    				dialog.remove();
    			}else {
    				$(".error").html('<lable class="errorMsg">用户名或密码错误请重新登录！</label>');
    			}
    		},
    		error: function() {
    		}
    	});
    }
   	</script>
  </body>
</html>