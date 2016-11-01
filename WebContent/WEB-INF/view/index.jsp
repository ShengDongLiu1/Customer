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
 	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
 	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
 	<link rel="stylesheet" type="text/css" href="css/bootstrap-combined.min.css">
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
    <script src="js/index.js"></script>
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
    </script>
    	
</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow:hidden;">
    <div class="wrapper">
        <!--头部信息-->
        <header class="main-header">
            <a href="http://www.learun.cn/adms/index.html" target="_blank" class="logo">
                <span class="logo-mini">CRM</span>
                <span class="logo-lg">HT<strong>客户管理系统</strong></span>
            </a>
            <nav class="navbar navbar-static-top">
                <a class="sidebar-toggle">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o "></i>
                                <span class="label label-success">4</span>
                            </a>
                        </li>
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning">10</span>
                            </a>
                        </li>
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">9</span>
                            </a>
                        </li>
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="img/user2-160x160.jpg" class="user-image" alt="User Image">
                                <span class="hidden-xs"><font size="5px" color="black"><b>欢迎:${user.email}</b>登录</font>
                                </span>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a class="menuItem" data-id="userInfo" href="/SystemManage/User/Info"><i class="fa fa-user"></i>个人信息</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-trash-o"></i>清空缓存</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-paint-brush"></i>皮肤设置</a></li>
                                <li><a href="javascript:void();" onClick="bddt();"><i class="fa fa-paint-brush"></i>百度地图</a></li>
                               
                                <li><a href="${pageContext.request.contextPath}/selectmima.do?userid=${user.userid}"><i class="glyphicon glyphicon-wrench"></i>修改密码</a></li>
                                <li><a href="${pageContext.request.contextPath}/contact/quitLogin.do" onClick="return logout();"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                            </ul>
                        </li>
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
                        <a href="javascript:;" class="menuTab active" data-id="/Home/Default">欢迎首页</a>
                        <a href="javascript:;" class="menuTab" data-id="/Home/About" style="padding-right: 15px;">平台介绍</a>
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
                <button class="roll-nav roll-right fullscreen"><i class="fa fa-arrows-alt"></i></button>
            </div>
            <div class="content-iframe" style="overflow: hidden;">
                <div class="mainContent" id="content-main" style="margin: 10px; margin-bottom: 0px; padding: 0;">
                    <iframe class="LRADMS_iframe" width="100%" height="100%" src="default.html" frameborder="0" data-id="default.html"></iframe>
                </div>
            </div>	
        </div>
    </div>
   
  <div class="modal fade" style="width:600px; left: 300px" id="myModal"  aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	      <div class="modal-dialog" role="document" style="width: 505px;">
	      		 <iframe width="504" height="709" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://j.map.baidu.com/5C-iH"></iframe>
	      </div>
	     </div>
	    </div>
</html>