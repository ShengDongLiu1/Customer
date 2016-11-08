<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>客户管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-combined.min.css">
<link rel="stylesheet" type="text/css" href="css/editor.css">
<link rel="stylesheet" type="text/css" href="css/layoutit.css">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.htmlClean.js"></script>
<script src="js/jquery.ui.touch-punch.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/zh-cn.js"></script>
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/skins/_all-skins.css">
<script src="js/jquery/jQuery-2.2.0.min.js"></script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    if("${user.status}" == '系统管理员'){
        document.write("<script src='js/index.js'><\/script>");	
    }else if("${user.status}" == '客户经理'){
    	document.write("<script src='js/index2.js'><\/script>");	
    }else if("${user.status}" == '销售'){
    	document.write("<script src='js/index3.js'><\/script>");	
    }else{
    	window.location.href = "<%=path %>"
    }
    </script>
<script type="text/javascript">
    	$('#identifier').tooltip(options)
    	 function bddt(){
    		$("#myModalLabel").text("百度地图");
   	    	$('#myModal').modal();
    	}
    	function logout(){
    		if(confirm("您确定要退出系统吗？")){
    			return true;
    		}else{
    			return false;
    		}
    		
    	}
    	
    	function queryByid(){
    		var id = $("#idss").val();
    		$.post("<%=path%>/user/queryById.do", {
			'userid' : id,
		}, function(data) {
			$("#uname1").val(data.uname)
			$("#email1").val(data.email)
			$("#status1").val(data.status)
			$("#usex1").val(data.usex)
			$("#unumber1").val(data.unumber)
			$("#uage1").val(data.uage)
		}, "json");
		$('#myModal3').modal();
	}
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini"
	style="overflow: hidden;">
	<div class="modal fade" id="myModal3" style="left: 600px; width: 650px; height: 450px;"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel3">个人信息</h4>
				</div>
				<div style="float: left;">
					<div class="modal-body">
						<div class="control-group">
							<label class="control-label">呢称:</label>
							<div class="controls">
								<input type="text" readonly="readonly" style="height: 30px; width: 230px;"
									id="uname1" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">邮箱:</label>
							<div class="controls">
								<input type="text" readonly="readonly" style="height: 30px; width: 230px;"
									id="email1" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户类型:</label>
							<div class="controls">
								<input type="text" readonly="readonly" style="height: 30px; width: 230px;"
									id="status1" />
							</div>
						</div>
					</div>
				</div><br />
				<div style="float: left;margin-left: 40px;">
					<div class="control-group">
						<label class="control-label">性别:</label>
						<div class="controls">
							<input type="text" readonly="readonly" style="height: 30px; width: 230px;" id="usex1" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">手机号码:</label>
						<div class="controls">
							<input type="text" readonly="readonly" style="height: 30px; width: 230px;"
								id="unumber1" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">年龄:</label>
						<div class="controls">
							<input type="text" readonly="readonly" style="height: 30px; width: 230px;" id="uage1" />
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
			</button>
		</div>
	</div>
	<div class="wrapper">
		<!--头部信息-->
		<header class="main-header">
			<a href="http://www.learun.cn/adms/index.html" target="_blank"
				class="logo"> <span class="logo-mini">CRM</span> <span
				class="logo-lg"><strong>客户关系管理系统</strong></span>
			</a>
			<nav class="navbar navbar-static-top">
				<a class="sidebar-toggle"> <span class="sr-only">Toggle
						navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="img/user2-160x160.jpg" class="user-image" alt="User Image">
								<span class="hidden-xs"><font size="5px" color="black"><b>欢迎:${user.email}</b>登录</font>
							</span>
						</a>
							<ul class="dropdown-menu pull-right">
								<li><input type="hidden" value="${user.userid }" id="idss"><a
									href="javascript:void();" onclick="queryByid();"><i
										class="fa fa-user"></i>个人信息</a></li>
								<li><a href="javascript:void();" onClick="bddt();"><i
										class="fa fa-paint-brush"></i>百度地图</a></li>
								<li><a
									href="${pageContext.request.contextPath}/selectmima.do?userid=${user.userid}"><i
										class="glyphicon glyphicon-wrench"></i>修改密码</a></li>
								<li><a
									href="${pageContext.request.contextPath}/contact/quitLogin.do"
									onClick="return logout();"><i
										class="ace-icon fa fa-power-off"></i>安全退出</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<!--左边导航-->
		<div class="main-sidebar">
			<div class="sidebar">
				<!--  <div class="user-panel">
                    <div class="pull-left image">
                        <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>administrator</p>
                        <a><i class="fa fa-circle text-success"></i>在线</a>
                    </div>
                </div> -->
				<ul class="sidebar-menu" id="sidebar-menu">
					<li class="header">导航菜单</li>
				</ul>
			</div>
		</div>
		<!--中间内容-->
		<div id="content-wrapper" class="content-wrapper">
			<div class="content-tabs">
				<button class="roll-nav roll-left tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs menuTabs">
					<div class="page-tabs-content" style="margin-left: 0px;">
						<a href="javascript:;" class="menuTab active"
							data-id="/Customer/customer/khgcfx.do">欢迎首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right tabRight">
					<i class="fa fa-forward" style="margin-left: 3px;"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown tabClose" data-toggle="dropdown">
						页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a class="tabReload" href="javascript:void();">刷新当前</a></li>
						<li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
						<li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
						<li><a class="tabCloseOther" href="javascript:void();">除此之外全部关闭</a></li>

					</ul>
				</div>
				<button class="roll-nav roll-right fullscreen">
					<i class="fa fa-arrows-alt"></i>
				</button>
			</div>
			<div class="content-iframe" style="overflow: hidden;">
				<div class="mainContent" id="content-main"
					style="margin: 10px; margin-bottom: 0px; padding: 0;">
					<iframe class="LRADMS_iframe" width="100%" height="100%"
						src="default.html" frameborder="0" data-id="default.html"></iframe>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" style="width: 600px; left: 600px" id="myModal"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-dialog" role="document" style="width: 505px;">
				<iframe width="504" height="709" frameborder="0" scrolling="no"
					marginheight="0" marginwidth="0" src="http://j.map.baidu.com/5C-iH"></iframe>
			</div>
		</div>
	</div>
</html>