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
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/bespoke/addqr.do" >
				<div style='float: left;'>
					<div class="control-group">
						<label class="control-label">预约公司名称:</label>
						<div class="controls">
							<select id="gsname" name="bepcom" style="height: 40px; width: 300px;">
                                  <c:forEach var="list" items="${listName}">
                                 	 <option value="${list.kid}">${list.comname}</option>
                                  </c:forEach>
	                         </select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">预约人:</label>
						<div class="controls">
							<input type="text"  style="height: 40px; width: 300px;" name="bepman"
								placeholder="预约人" />
						</div>
						
						
					</div>
					<div class="control-group">
						<label class="control-label">预约地址:</label>
						<div class="controls">
							<input type="text"  style="height: 40px; width: 300px;"
								name="bepaddress" placeholder="预约地址" />
						</div>
					</div>
				</div>
				<div style="float: left;">
					
					<div class="control-group">
						<label class="control-label">预约时间:</label>
						<div class="controls">
							<input type="date"  style="height: 40px; width: 300px;"
								name="bepdate" placeholder="预约时间" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">预约类型:</label>
						<div class="controls">
							<input type="text"  style="height: 40px; width: 300px;"
								name="beptype" placeholder="预约类型" />
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
						<div class="controls">
							<button type="submit" class="btn" style="height: 40px; width: 150px;" onclick="return addBespoke();">确认</button>
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
	function addBespoke() {
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
	}
</script>
</html>