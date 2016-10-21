<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 	<link rel="stylesheet" type="text/css" href="css/layoutit.css">
 	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
 	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <script src="js/zh-cn.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery/jQuery-2.2.0.min.js"></script>
    <script src="js/jquery.ui.touch-punch.min.js"></script>
    <script src="js/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-migrate-1.4.1.min (1).js"></script>
    <script src="js/deletejs.js"></script>
</head>
<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	        <div class="modal-body">
	 
	          <div class="form-group">
	            <label for="txt_departmentname">部门名称</label>
	            <input type="text" name="txt_departmentname" class="form-control" id="txt_departmentname" placeholder="部门名称">
	          </div>
	          <div class="form-group">
	            <label for="txt_parentdepartment">上级部门</label>
	            <input type="text" name="txt_parentdepartment" class="form-control" id="txt_parentdepartment" placeholder="上级部门">
	          </div>
	          <div class="form-group">
	            <label for="txt_departmentlevel">部门级别</label>
	            <input type="text" name="txt_departmentlevel" class="form-control" id="txt_departmentlevel" placeholder="部门级别">
	          </div>
	          <div class="form-group">
	            <label for="txt_statu">描述</label>
	            <input type="text" name="txt_statu" class="form-control" id="txt_statu" placeholder="状态">
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	          <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	        </div>
	      </div>
	    </div>
	  </div>
	  <input type="button" onclick="add()" value="新增">
	  <input type="button" onclick="dele()" value="删除">
  <script type="text/javascript">
  	 function add() {
  		$("#myModalLabel").text("新增");
	     $('#myModal').modal();
  	 }
  	 
  	function dele() {
  	     Ewin.confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
  	       if (!e) {
  	         return;
  	       }
  	       alert("成功")
  	     });
  	   }
  </script>
</body>
</html>