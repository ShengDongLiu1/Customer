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
    	toastr.success('导出成功');
    }
   </script>
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
						<th>预约编号</th>
						<th>预约公司名称</th>
						<th>预约人</th>
						<th>预约地址</th>
						<th>预约时间</th>
						<th>预约类型</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
						<c:when test="${requestScope.tishi != 'tishi' }">
					<c:forEach var="list" items="${beslist.rows}">
						<tr class="success">
						<td><span><input type="checkbox" name="imgVo" value="${list.bepid}" /></span></td>
							<td>${list.customer.comname}</td>
							<td>${list.bepman}</td>
							<td>${list.bepaddress}</td>
							<td>${list.bepdate}</td>
							<td>${list.beptype}</td>
							<td><a href="<%=path %>/bespoke/bespokeSelect.do?bepid=${list.bepid}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/bespoke/delete.do?bepid=${list.bepid}">删除</a></td>
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
						<li><a href="<%=path %>/bespoke/bespokeQueryAlls.do?page=${beslist.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/bespoke/bespokeQueryAlls.do?page=${beslist.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<form action="<%=path %>/bespoke/addqr.do" method="post">
	<div class="modal fade" style="width: 710px;" id="myModal"  aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	       <div class="modal-content" style="width: 650px; left: -30px;">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	        
	        <div class="modal-body">
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