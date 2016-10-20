<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$(function(){
		$("#customerstate").combobox("setValue",customer.atype);
	})
</script>
</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/contact/contactUpdateqr.do" >
				<div style='float: left;'>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 300px;" name="manid"
								 value="${contact.manid} " />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户公司:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="mancom" value="${contact.mancom}"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户名称:</label>
						<div class="controls">
							<input type="text" value="${contact.manname}" style="height: 40px; width: 300px;" name="manname"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户部门:</label>
						<div class="controls">
							<input type="text" value="${contact.mandep}" style="height: 40px; width: 300px;"
								name="mandep"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户职位:</label>
						<div class="controls">
							<input type="text" value="${contact.manjob}" style="height: 40px; width: 300px;"
								name="manjob"  />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户电话:</label>
						<div class="controls">
							<input type="text" value="${contact.mannumber}" style="height: 40px; width: 300px;"
								name="mannumber"/>
						</div>
					</div>
				</div>
				<br/>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">客户手机:</label>
						<div class="controls">
							<input type="text" value="${contact.manmobile}" style="height: 40px; width: 300px;"
								name="manmobile" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户邮箱:</label>
						<div class="controls">
							<input type="text" value="${contact.manemail}" style="height: 40px; width: 300px;"
								name="manemail" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户QQ:</label>
						<div class="controls">
							<input type="text" value="${contact.manqq}" style="height: 40px; width: 300px;"
								name="manqq" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户MSN：</label>
						<div class="controls">
							<input type="text" value="${contact.manmsn}" style="height: 40px; width: 300px;"
								name="manmsn" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">技术程度：</label>
						<div class="controls">
							<input type="text" value="${contact.manskill}" style="height: 40px; width: 300px;"
								name="manskill"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">创建时间：</label>
						<div class="controls">
							<input type="text" value="${contact.logdate}" style="height: 40px; width: 300px;"
								name="logdate" readonly="readonly"/>
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
						<div class="controls">
							<input type="hidden" id="page" name="page" value="${page }">
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