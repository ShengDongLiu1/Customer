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
<script src="<%=path %>/js/zh-cn.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script src="<%=path %>/js/jquery-ui.js"></script>
<script src="<%=path %>/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="<%=path %>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path %>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path %>/js/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/deletejs.js"></script>
 <script>
   	$('#identifier').tooltip(options)
   	 	 function add() {
     		$("#myModalLabel").text("新增");
   	    	$('#myModal').modal();
     	 }
   	function daochu(){ 
    	window.location.href='daochu.do?page=${lists.pageNo}';
    	alert('导出成功');
    }
   </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div >
		<div class="span12"  style="float: left; margin-top: 10px; ">
			<div>
			<form class="form-horizontal" action="<%=path %>/user/userSelects.do?page=1" method="post">
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					账号:<input type="text" style="height: 30px; width: 150px;"
							name="email"  placeholder="账号" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					用户状态:	<input type="text" style="height: 30px; width: 150px;"
							name="status"  placeholder="用户状态" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 用户名:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="uname" placeholder="用户名" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
					性别:	<select id="usex" name="usex" style="height: 30px; width: 150px;">
                                 	 <option value="男">男</option>
                                 	 <option value="女">女</option>
	                         </select>
	                         	<br/>
	            	 联系电话：<input type="text" style="height: 30px; width: 150px;"
								name="unumber" placeholder="联系电话" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					年龄：	<select  id="uage" name="uage" style="height: 30px; width: 150px;">
                                 <c:forEach var="age" items="${uage}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 	 <option value="${age}">${age}岁</option>
                            	</c:forEach>
	                         </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" style="height: 30px; width: 70px;" value="查询" />
				</div>
			</form>
			</div>
		</div> 
		<div class="span12"  style="float: left; margin-top: 10px; ">
			 <button class="btn btn-primary" type="button" onclick="add();">
			 <span class="glyphicon glyphicon-plus-sign"></span>	 
			   添加
			   </button>
			   &nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary" type="button" onclick="daochu();">
			<span class="glyphicon glyphicon-share-alt"></span> 导出数据
			</button>
		</div>
		<p style="clear:both;"></p>
	</div>

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
				<c:choose>
						<c:when test="${requestScope.tishi != 'tishi' }">
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
					</c:when>
						<c:otherwise>
							<tr>
								<td>当前还没有数据，请添加之后再查询！</td>
							</tr>
						</c:otherwise>
					</c:choose>
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
	<form action="<%=path %>/user/addqr.do" method="post">
	<div class="modal fade" style=" width: 710px;" id="myModal" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	       <div class="modal-content" style="width: 670px; left: -30px;">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	         <div class="modal-body">
	         	<div style='float: left;'>
					<div class="control-group">
						<label class="control-label"
							style="font-size: 18px; font-weight: bold;">Email及账号:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" id="email" name="email"
								placeholder="Email" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">用户密码:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" name="password"
								placeholder="用户密码"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">用户状态:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" name="status"
								placeholder="用户状态" />
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">用户名:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;" name="uname"
								placeholder="用户名" />
						</div>
					</div>
					
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">性别:</label>
						<div class="controls">
						<select id="usex" name="usex" style="height: 40px; width: 300px;">
                                 	 <option value="男">男</option>
                                 	 <option value="女">女</option>
	                         </select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">联系电话:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								id="unumber" name="unumber" placeholder="联系电话" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">年龄:</label>
						<div class="controls">
						<select  id="uage" name="uage" style="height: 40px; width: 300px;">
                                 <c:forEach var="age" items="${uage}">
                                 	 <option value="${age}">${age}岁</option>
                            	</c:forEach>
	                         </select>
						</div>
					</div>
				</div>
	         </div>
	        <div class="modal-footer">
	         	 <button type="button" class="btn btn-default" data-dismiss="modal">
	         	 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	         	 <input type="submit" value="保存" class="btn btn-primary" />
	          </div>
	         </div>
	    </div>
	  </div>
	 </form>
</body>
</html>