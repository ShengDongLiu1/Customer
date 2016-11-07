<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.input-lg { /* 设置大的输入框input*/
	height: 80px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.control-label {
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>
<body>
	<div class="row-fluid">
	<div class="control-group" style="margin-left: 50px; margin-top: 30px;"> 
						<div class="controls">
							<a href="<%=path %>/user/UserQueryAll.do?page=1"><button class="glyphicon glyphicon-share-alt" type="submit" class="btn" style="height: 40px; width: 150px;" onclick="">返回管理页面</button></a>
						</div>
				</div>
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/user/addqr1.do" >
				<div style='float: left;'>
					<div class="control-group">
						<label class="control-label"
							style="font-size: 18px; font-weight: bold;">Email及账号:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" id="email" name="email"
								placeholder="Email" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">用户密码:</label>
						<div class="controls">
							<input type="password" style="height: 40px; width: 300px;" name="password"
								placeholder="用户密码"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">用户状态:</label>
						<div class="controls">
							<select  id="status" name="status" style="height: 40px; width: 300px;">
                                 	 <option value="系统管理员">系统管理员</option>
                                 	 <option value="客户经理">客户经理</option>
                                 	 <option value="销售">销售</option>
	                         </select>
	                         
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">用户名:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" name="uname"
								placeholder="用户名" />
						</div>
					</div>
					
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">性别:</label>
						<div class="controls">
						<select id="usex" name="usex" style="height: 40px; width: 300px;">
                                 	 <option value="男">男</option>
                                 	 <option value="女">女</option>
	                         </select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">联系电话:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								id="unumber" name="unumber" placeholder="联系电话" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">年龄:</label>
						<div class="controls">
						<select  id="uage" name="uage" style="height: 40px; width: 300px;">
                                 <c:forEach var="age" items="${uage}">
                                 	 <option value="${age}">${age}岁</option>
                            	</c:forEach>
	                         </select>
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
						<div class="controls">
							<button type="submit" class="btn" style="height: 40px; width: 150px;" onclick="return addUser();">确认</button>
						</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" href="<%=path%>/js/toastr/toastr.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-combined.min.css">
<script src="<%=path%>/js/zh-cn.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/jquery-ui.js"></script>
<script src="<%=path%>/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path%>/js/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/deletejs.js"></script>
<script type="text/javascript">
	function addUser() {
		var email = $("#email").val();
		var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮件正则
		var a = document.getElementsByTagName("input");//就可以调用所有input型数据
		for (var i = 0; i < a.length; i++) {
			if (a[i].value == "") {
				toastr.warning("您有空白未填写！");
				return false;
				break;
			}
			if(a[i].value.length<1){
				toastr.warning("至少输输两个字符！");
				return false;
				break;
			}
		}
		if(!myReg.test($('#email').val())){
			toastr.warning('您的邮箱格式错咯！');
			return false;
		}
		var number=$("#unumber").val();
		 RegularExp=/^[0-9]{11}$/
			 if (RegularExp.test(number)) {
				 alert('添加成功');
				  return true;
				 }
				 else {
					 toastr.warning("手机号格式不正确！应该为11位长度的数字！");
				  return false;
				 }
		
	}
	</script>
</html>