<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>客户登录</title>
		<!-- CSS -->
		
		<link rel="stylesheet" href="css/login-css/supersized.css">
		<link rel="stylesheet" href="css/login-css/login.css">
		<link href="css/login-css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script src="js/html5.js"></script>
		<![endif]-->
		<script src="js/login-js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/login-js/jquery.form.js"></script>
		<script type="text/javascript" src="js/login-js/tooltips.js"></script>
		<script type="text/javascript" src="js/login-js/login.js"></script>
		<script>
			
		</script>
	</head>
	<body>
		<div class="page-container">
			<div class="main_box">
				<div class="login_box">
					<div class="login_logo">
						<img src="img/login-img/logo.png" >
					</div>
				
					<div class="login_form">
						<form action="${pageContext.request.contextPath}/login.do" id="login_form" method="post">
							<div class="form-group">
								<label for="j_username" class="t">邮　箱：</label> 
								<input id="email" value="" name="email" type="text" class="form-control x319 in" 
								autocomplete="off">
							</div>
							<div class="form-group">
								<label for="j_password" class="t">密　码：</label> 
								<input id="password" value="" name="password" type="password" 
								class="password form-control x319 in">
							</div>
							<div class="form-group">
								<label for="j_captcha" class="t">验证码：</label>
								<input id="j_captcha" name="j_captcha" type="text" class="form-control x164 in">
								<img id="imgObj" alt="" src="DrawImage" onclick="changeImg()"/>
							</div>
							<div class="form-group">
								<label class="t"></label>
								<label for="j_customer" class="m"></label>
								<select id="status" name="status" class="input" style="margin-top: 15px;height: 24px">
									<option value="">请选择用户类型...</option>
									<option value="系统管理员">系统管理员</option>
									<option value="客户经理">客户经理</option>
									<option value="销售">销售</option>
								</select>
							</div>
							<div class="form-group space">
								<label class="t"></label>　　　
								<button type="button" id="submit_btn" class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp </button>
								<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Javascript -->
		
		<script src="js/login-js/supersized.3.2.7.min.js"></script>
		<script src="js/login-js/supersized-init.js"></script>
		<script src="js/login-js/scripts.js"></script>
		<script type="text/javascript" src="js/yzm/jQuery.js"></script>
   		<script type="text/javascript" src="js/yzm/verifyCode.js"></script>
	</body>
</html>