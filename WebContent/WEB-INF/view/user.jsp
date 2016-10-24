<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-combined.min.css"> 
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>



	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>用户编号</th>
						<th>账号</th>
						<th>用户状态</th>
						<th>用户名</th>
						<th>性别</th>
						<th>联系电话</th>
						<th>年龄</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${userList.rows}">
						<tr class="success">
							<td>${list.userid}</td>
							<td>${list.email}</td>
							<td>${list.status}</td>
							<td>${list.uname}</td>
							<td>${list.usex}</td>
							<td>${list.unumber}</td>
							<td>${list.uage}</td>
							<td><a href="<%=path %>/user/userSelect.do?userid=${list.userid}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/user/delete.do?userid=${list.userid}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/user/UserQueryAll.do?page=${userList.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/user/UserQueryAll.do?page=${userList.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>