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
			<form class="form-horizontal" action="<%=path %>/track/trackUpdate.do" method="post">
				<div style='float: left;'>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 200px;" name="tid"
								 value="${track.tid} " />
						</div>
					</div>
					<div class="control-group" style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label">记录语句:</label>
						<div class="controls">
							<textarea style="height: 100px; width: 300px;" name="measure" >${track.measure}</textarea>
						</div>
					</div>
					<%-- <div class="control-group" style="margin-left: 150px; margin-top: 30px;">
						<label class="control-label">记录时间:</label>
						<div class="controls">
							<input type="datetime"  style="height: 40px; width: 300px;"
								name="recordtime" value="${track.recordtime}" placeholder="记录时间" />
						</div>
					</div> --%>
					
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 225px; margin-top: 33px;"> 
						<div class="controls">
							<input type="hidden" id="page" name="page" value="${page }">
							<input type="hidden" id="state2" name="state2" value="${requestScope.state2 }">
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

<script type="text/javascript">
	$(function(){
		var a = $("#atype1").val();
		$("#atype").val(a); 
		$("#combackdrop").val($("#combackdrop1").val());
		$("#state").val($("#customerstate1").val());
		//alert($("#atype").find("option:selected").text());得到当前选中的值
	})
	

	
	/* /* function updatecustomer() {
		var a = document.getElementsByTagName("input");//就可以调用所有input型数据
		for (var i = 0; i < a.length; i++) {
			if (a[i].value == "") {
				alert("您有空白未填写！");
				return false;
				break;
			}
			if(a[i].value.length<1){
				alert("至少输输两个字符！");
				return false;
				break;
			}
		}
	} */ 
</script>
</html>