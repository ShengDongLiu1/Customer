<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
%>
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
<script type="text/javascript">
</script>
</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/product/productAdd.do" >
				<div style='float: left;'>
					<div class="control-group">
						<label class="control-label">产品名称:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" name="pname"
								placeholder="产品名称" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">产品价格:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="pprice" placeholder="产品价格" />
						</div>
					</div>
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">产品货存:</label>
						<div class="controls">
							<input type="text"  style="height: 40px; width: 300px;"
								name="pstock" placeholder="产品货存" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">产品类型:</label>
						<div class="controls">
							 <select id="usertype" name="ptype" style="height: 40px; width: 300px;">
                                  <option value="">请选择产品类型</option>
                                  <option value="办公">办公</option>
                                  <option value="体育">体育</option>
                                  <option value="建设">建设</option>
                                  <option value="医疗">医疗</option>
	                         </select>
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left:200px; margin-top: 40px;"> 
						<div class="controls">
							<button type="submit" class="btn" style="height: 40px; width: 150px;">确认</button>
							<a href="<%=path %>/product/queryAll.do?page=1" style="margin-left: 80px;"><button type="button" class="btn" style="height: 40px; width: 150px;">返回产品管理</button></a>
						</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-combined.min.css">
<script src="<%=path %>/js/bootstrap.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js"></script>
<script src="<%=path %>/js/npm.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path %>/js/jquery-ui.js"></script>
<script src="<%=path %>/js/jquery.htmlClean.js"></script>
<script src="<%=path %>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path %>/js/scripts.js"></script>
<script src="<%=path %>/js/zh-cn.js"></script>

</html>