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

<div >
		<div class="span12"  style="float: left; margin-top: 10px; ">
			<div>
			<form class="form-horizontal" action="<%=path %>/bespoke/bespokeQueryAll.do?page=1" method="post">
				<div>
					预约公司:<select id="bepcom" name="bepcom" style="height: 30px; width: 150px;">
                                  
                                  <c:forEach var="list" items="${listName}">
                                 	 <option value="${list.kid}">${list.comname}</option>
                                  </c:forEach>
	                </select>
					预约人:	<input type="text" style="height: 30px; width: 150px;"
							name="bepman"  placeholder="预约人" />
					 预约类型:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="beptype" placeholder="预约类型" />
							
					预约地址:	<input type="text" style="height: 30px; width: 150px;"
							name="bepaddress" placeholder="预约地址" />
							<input type="submit" style="height: 30px; width: 70px;" value="查询" />
				</div>
			</form>
			</div>
		</div> 
		<p style="clear:both;"></p>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>预约编号</th>
						<th>预约公司名称</th>
						<th>预约人</th>
						<th>预约地址</th>
						<th>预约时间</th>
						<th>预约类型</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${beslist.rows}">
						<tr class="success">
							<td>${list.bepid}</td>
							<td>${list.customer.comname}</td>
							<td>${list.bepman}</td>
							<td>${list.bepaddress}</td>
							<td>${list.bepdate}</td>
							<td>${list.beptype}</td>
							<td><a href="<%=path %>/bespoke/bespokeSelect.do?bepid=${list.bepid}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/bespoke/delete.do?bepid=${list.bepid}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/bespoke/bespokeQueryAll.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/bespoke/bespokeQueryAll.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>