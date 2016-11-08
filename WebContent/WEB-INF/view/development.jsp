<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=path%>/js/toastr/toastr.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-combined.min.css">
<script src="<%=path%>/js/zh-cn.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/jquery-ui.js"></script>
<script src="<%=path%>/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path%>/js/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/deletejs.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>营销机会信息</title>

</head>
<body>


	<div class="span12" style="float: left; margin-top: 10px;">
		<div>
			<form class="form-horizontal"
				action="<%=path%>/marketing/queryAll.do?page=1" method="post">
				<div>
					公司名称:<select id="customerName" name="customerName"
						style="height: 30px; width: 150px;">
						<option value="">请选择公司</option>
						<c:forEach var="list" items="${CustomerName}">
							<option value="${list.kid}">${list.comname}</option>
						</c:forEach>
					</select> 联系人: <input type="text" style="height: 30px; width: 150px;"
						name="linkMan" placeholder="联系人" /> 创建人:<input type="text"
						style="height: 30px; width: 150px;" name="createMan"
						placeholder="创建人" /> 指定人: <select name="assignMan" id="assignMan"
						style="height: 30px; width: 150px;">
						<option value="">请选择指派人</option>
						<c:forEach var="list" items="${userName}">
							<option value="${list.userid}">${list.uname}</option>
						</c:forEach>
					</select> <input type="submit" style="height: 30px; width: 70px;" value="查询" />
				</div>
			</form>
		</div>
	</div>
	<p style="clear: both;"></p>
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th><span><input type="checkbox" id="checkAll"
								onclick="selectAll();" /></span></th>
						<th>公司名称</th>
						<th>机会来源</th>
						<th>概要</th>
						<th>联系人</th>
						<th>联系人电话</th>
						<th>机会描述</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>指派人</th>
						<th>客户开发状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists.rows}">
						<tr class="success">
							<td><span><input type="checkbox" name="imgVo"
									onclick="select1();" value="${list.id} " /></span></td>
							<td>${list.customers.comname}</td>
							<td>${list.chanceSource}</td>
							<td>${list.overView}</td>
							<td>${list.linkMan}</td>
							<td>${list.linkPhone}</td>
							<td>${list.description}</td>
							<td>${list.createMan}</td>
							<td>${list.createTime}</td>
							<td>${list.users.uname}</td>
							<td><c:if test="${list.devResult == 0 }">
									未开发
								</c:if> <c:if test="${list.devResult == 1 }">
									开发中
								</c:if> <c:if test="${list.devResult == 2 }">
									开发成功
								</c:if> <c:if test="${list.devResult == 3 }">
									开发失败
								</c:if></td>
							<td><c:if test='${list.devResult == 2 || list.devResult == 3 }'>
									<a href="querymarketing.do?id=${list.id }&page=1&ss=1">查看详情</a>
								</c:if> <c:if test="${list.devResult==0 || list.devResult==1 }">
									<a href="querymarketing.do?id=${list.id }&page=1&ss=2">开发</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a
							href="<%=path %>/development/queryAll.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a>${lists.pageNo }/${lists.total }</a></li>
						<li><a
							href="<%=path %>/development/queryAll.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function(){
	})


	$('#identifier').tooltip(options)
	function selectAll() {
		$("INPUT[type='checkbox']").each(
				function() {
					if ($("#checkAll").attr("checked") != true) {
						$(this).attr('checked', true);
						$(this).parents('.checkbox').find('span').addClass(
								'checked');
					} else {
						$(this).attr('checked', false);
						$(this).parents('.checkbox').find('span').removeClass(
								'checked');
					}
				});
	}

	function add() {
		$("#myModalLabel").text("新增");
		$('#myModal').modal();
	}
	
	function kaifa(){
		$.post("<%=path%>/marketing/queryById.do",
				{'id':$("#idss").val()},
				function(data){
					$("#customerName1").val(data.customerName);
					$("#linkMan1").val(data.linkMan);
					$("#linkPhone1").val(data.linkPhone);
					$("#cgjl1").val(data.cgjl);
					$("#chanceSource1").val(data.chanceSource);
					$("#overView1").val(data.overView);
					$("#description1").val(data.description);
					$("#assignMan1").val(data.assignMan);
					
				},"json");
		
 	   $("#myModalLabel1").text("查看");
	   $('#myModal1').modal();	
	   
	 /*   $("#myModalLabel2").text("添加开发计划");
	   $('#myModal2').modal(); */
	}
	
	 function update(){
     	if($("[name='imgVo']").is(':checked')) {  
     		  var str=[];
     		  var str2=[];
               $("[name='imgVo']:checked").each(function(){
                str+=$(this).val();
               }) 
               if(str.length>3){
            	   toastr.warning("一次只能修改一个！");
               }else{
            	   $("#ids").val(str);
            	   $.post("queryById.do",
            				{'id':$("#ids").val()},
            				function(data){
            					$("#customerName1").val(data.customerName);
            					$("#linkMan1").val(data.linkMan);
            					$("#linkPhone1").val(data.linkPhone);
            					$("#cgjl1").val(data.cgjl);
            					$("#chanceSource1").val(data.chanceSource);
            					$("#overView1").val(data.overView);
            					$("#description1").val(data.description);
            					$("#assignMan1").val(data.assignMan);
            					
            				},"json");
            	   $("#myModalLabel1").text("修改");
           		   $('#myModal2').modal();
               }
     	}else{
     		toastr.warning("请选中您要修改的那一行");
     	}
     }
	
	 
</script>
</html>