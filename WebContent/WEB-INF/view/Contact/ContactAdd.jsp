<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function contactadd() {
		var a = document.getElementsByTagName("input");//就可以调用所有input型数据
		var mannumber = document.getElementById("tel");
		var manmobile = document.getElementById("mobile");
		var manemail = document.getElementById("mail");
		for (var i = 0; i < a.length; i++) {
			if (a[i].value == "") {
				toastr.warning("您有空白未填写！");
				return false;
				break;
			}
		}
		
		var MobileExp = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/
			if (MobileExp.test(manmobile.value)) {
				return true;
			} else {
				toastr.warning("手机号格式不正确~");
				return false;
			}
		toastr.success('添加成功');
	}
	
	function back(){ 
    	window.location.href='contactQueryPagers.do?&page=${lists.pageNo}';
    }
</script>

</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form id="ContactAdd_form" class="form-horizontal" action="<%=path %>/contact/contactAddqr.do" action="post">
			<div class="span12"  style="float: left; margin-top: -50px; "> 
				<div class="controls">
					<a href="<%=path %>/contact/contactQueryPagers.do?&page=1"><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-share-alt"></span>返回上一页</button></a>
				</div>
			</div>
				<div style='float: left;'>
					<div class="control-group">
						<label class="control-label">客户公司:</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="mancom" name="mancom" style="height: 40px; width: 300px;">
                            <optgroup label="请选择客户公司"></optgroup>
                            <c:forEach var="list" items="${listName}">
                           	 <option value="${list.kid}">${list.comname}</option>
                            </c:forEach>
	                    </select>
					</div>
					<div class="control-group">
						<label class="control-label">客户名称:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;" name="manname"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户部门:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								name="mandep" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户职位:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								name="manjob" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户电话:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								id="tel" name="mannumber"/>
						</div>
					</div>
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">客户手机:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								id="mobile" name="manmobile"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户邮箱:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								id="mail" name="manemail"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户QQ:</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;" name="manqq" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户MSN：</label>
						<div class="controls">
							<input type="text" value="" style="height: 40px; width: 300px;"
								name="manmsn"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">技术程度：</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<select style="height: 40px; width: 300px;" name="manskill">
							<optgroup label="请选择技术程度"></optgroup>
							<option value="不懂">不懂</option>
							<option value="懂一点">懂一点</option>
							<option value="懂部分">懂部分</option>
							<option value="懂大部分">懂大部分</option>
							<option value="精通">精通</option>
						</select>
					</div>
					<div class="control-group">
						<label class="control-label">创建时间：</label>
						<div class="controls">
							<input type="text" value="${datetimes}" style="height: 40px; width: 300px;"
								name="logdate" readonly="readonly"/>
						</div>
					</div>
					
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
					<div class="controls">
						<button type="submit" class="btn" style="height: 40px; width: 150px;" onclick="return contactadd();">添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" href="<%=path%>/js/toastr/toastr.css">
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
<script src="<%=path%>/js/toastr/toastr.min.js"></script>

</html>