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

</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/customer/updateqr.do" >
				<div style='float: left;'>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 300px;" name="kid"
								 value="${customer.kid} " />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">公司名称:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="comname" value="${customer.comname}" placeholder="公司名称" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">申请类型:</label>
						<div class="controls">
							<input type="text" value="${customer.atype}" style="height: 40px; width: 300px;" name="atype"
								placeholder="申请类型" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">公司背景:</label>
						<div class="controls">
							<input type="text" value="${customer.combackdrop}" style="height: 40px; width: 300px;"
								name="combackdrop" placeholder="公司背景" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">公司地址:</label>
						<div class="controls">
							<input type="text" value="${customer.comaddress}" style="height: 40px; width: 300px;"
								name="comaddress" placeholder="公司地址" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">主营产品:</label>
						<div class="controls">
							<input type="text" value="${customer.product}" style="height: 40px; width: 300px;"
								name="product" placeholder="主营产品" />
						</div>
					</div>
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">组织结构:</label>
						<div class="controls">
							<input type="text" value="${customer.structure}" style="height: 40px; width: 300px;"
								name="structure" placeholder="组织结构" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">测试人:</label>
						<div class="controls">
							<input type="text" value="${customer.testman}" style="height: 40px; width: 300px;"
								name="testman" placeholder="测试人" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">申请信息:</label>
						<div class="controls">
							<input type="text" value="${customer.amessage}" style="height: 40px; width: 300px;"
								name="amessage" placeholder="申请信息" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户状态:</label>
						<div class="controls">
							<input type="text" value="${customer.state}" style="height: 40px; width: 300px;" name="state"
								placeholder="客户状态" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">新建时间:</label>
						<div class="controls">
							<input type="text" value="${customer.newdate}" style="height: 40px; width: 300px;"
								name="newdate" placeholder="新建时间" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">指派人：</label>
						<div class="controls">
							<input type="text" value="${customer.designated}" style="height: 40px; width: 300px;"
								name="designated" placeholder="指派人" />
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
						<div class="controls">
							<button type="submit" class="btn" style="height: 40px; width: 150px;">确认</button>
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