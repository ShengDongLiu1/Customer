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
			<form class="form-horizontal" action="<%=path%>/track/add.do"
				method="post" id="confirm">
				<div style='float: left;'>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 200px;"
								name="kid" value="${customer.kid} " />
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 200px;"
								name="userid" value="${user.userid}" />
						</div>
					</div>
					<div class="control-group"
						style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label">客户公司:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="comname" value="${customer.comname}" readonly="readonly" />
						</div>
					</div>
					<div class="control-group"
						style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label">客户名称:</label>
						<div class="controls">
							<input type="text" value="${customer.testman}"
								style="height: 40px; width: 300px;" name="testman"
								readonly="readonly" />
						</div>
					</div>
					<div class="control-group"
						style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label">记录语句:</label>
						<div class="controls">
							<textarea id="measure" style="height: 100px; width: 300px;"
								name="measure"></textarea><br/><br/>
							<div style="height: 10px; font-size: 18px; text-align: center">
								<font id="msgs" color="red"></font>
							</div>
							<br />
						</div>
					</div>
					<div class="control-group"
						style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label"></label>
						<div class="controls">
							<input style="visibility: hidden" type="date"
								style="height: 40px; width: 300px;" name="recordtime" />
						</div>
					</div>

				</div>
				<p style="clear: both;"></p>
				<div class="control-group"
					style="margin-left: 190px; margin-top: 33px;">
					<div class="controls">
						<input type="hidden" id="page" name="page" value="${page }">
						<input type="hidden" id="state2" name="state2"
							value="${requestScope.state2 }">
						<button type="button" class="btn"
							style="height: 40px; width: 100px;" onclick="return ensure()">确认</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn"
							style="height: 40px; width: 100px;" onclick="return backtrack()">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-combined.min.css">
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery-2.0.0.min.js"></script>
<script src="<%=path%>/js/npm.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path%>/js/jquery-ui.js"></script>
<script src="<%=path%>/js/jquery.htmlClean.js"></script>
<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/js/scripts.js"></script>
<script src="<%=path%>/js/zh-cn.js"></script>

<script type="text/javascript">
	$(function() {
		var a = $("#atype1").val();
		$("#atype").val(a);
		$("#combackdrop").val($("#combackdrop1").val());
		$("#state").val($("#customerstate1").val());
		//alert($("#atype").find("option:selected").text());得到当前选中的值
	})

	function backtrack() {
		window.location.href = 'queryState.do?page=1&state=5';
	}

	function ensure() {
		var measure = $("#measure").val();
		if (measure == null || measure == "") {
			$("#msgs").text("抱歉不能记录空的内容!");
			return false;
		} else {
			$("#confirm").submit();
		}
	}
</script>
</html>