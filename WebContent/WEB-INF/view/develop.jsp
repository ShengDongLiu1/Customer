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
<title>添加开发计划</title>
</head>
<body>
	<div>
		<div class="modal-dialog" role="document"
			style="width: 800px; left: -100px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详情</h4>
				</div>
				<div class="modal-body">
					<div style='float: left;'>
						<div class="control-group">
							<label class="control-label">客户公司:</label> <input type="hidden"
								id="customerName2" value="${marketing.customerName }"> <select
								id="mancom" id="customerName1" name="customerName"
								style="height: 30px; width: 230px;">
								<c:forEach var="list1" items="${CustomerName}">
									<option value="${list1.kid}">${list1.comname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="control-group">
							<label class="control-label">联系人:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									value="${marketing.linkMan }" name="linkMan" placeholder="联系人" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">成功几率:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									value="${marketing.cgjl }" name="cgjl" placeholder="成功几率" />
							</div>
						</div>
					</div>
					<div style="float: left; margin-left: 120px;">
						<div class="control-group">
							<label class="control-label">机会来源:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									value="${marketing.chanceSource }" name="chanceSource"
									placeholder="机会来源" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">联系电话:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									value="${marketing.linkPhone }" name="linkPhone"
									placeholder="联系电话" />
							</div>
						</div>
					</div>
					<p style="clear: both;"></p>
					<div style="float: left;">
						<div class="control-group">
							<label class="control-label">概要:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 600px;"
									value="${marketing.overView }" name="overView" placeholder="概要" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">机会描述:</label>
							<div class="description">
								<textarea rows="4" cols="30" style="width: 500px;"
									placeholder="机会描述" name="description">${marketing.overView }</textarea>
							</div>
						</div>
					</div>
					<div style="float: left;">
						<div class="control-group">
							<label class="control-label">创建人:</label>
							<div class="controls">
								<select id="createMan1" name="createMan"
									style="height: 30px; width: 230px;">
									<c:forEach var="list" items="${userName}">
										<option value="${list.userid}">${list.uname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div style="float: left; margin-left: 120px;">
						<div class="control-group">
							<label class="control-label">指派人:</label> <select
								name="assignMan" id="assignMan1"
								style="height: 30px; width: 230px;">
								<c:forEach var="list" items="${userName}">
									<option value="${list.userid}">${list.uname}</option>
								</c:forEach>
							</select>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<p style="clear: both;"></p>

	<form action="<%=path%>/development/updateqr.do" method="post">
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="width: 400px; height: 400px;">
			<div class="modal-dialog" role="document" style="width: 350px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel3">修改计划</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id" id="id1" /> <input type="hidden"
							name="saleChanceId" id="saleChanceId1" />
						<div class="control-group">
							<label class="control-label">日期:</label>
							<div class="controls">
								<input type="date" style="height: 30px; width: 230px;"
									id="planDate1" name="planDate" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">计划项:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									id="planItem1" name="planItem" placeholder="计划项" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">执行效果:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									id="exeAffect1" name="exeAffect" placeholder="执行效果" />
							</div>
						</div>
						<p style="clear: both;"></p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<input type="submit" value="保存" class="btn btn-primary" />
				</div>
			</div>
		</div>
	</form>

	<form action="<%=path%>/development/addqr.do" method="post">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="width: 400px; height: 400px;">
			<div class="modal-dialog" role="document" style="width: 350px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel2">添加计划</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="ids" value="${requestScope.saleChanceId }"
							name="id" /> <input type="hidden" value="${requestScope.id }" name="idd" />
						<div class="control-group">
							<label class="control-label">日期:</label>
							<div class="controls">
								<input type="date" style="height: 30px; width: 230px;"
									id="planDate" name="planDate" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">计划项:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									id="planItem" name="planItem" placeholder="计划项" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">执行效果:</label>
							<div class="controls">
								<input type="text" style="height: 30px; width: 230px;"
									id="exeAffect" name="exeAffect" placeholder="执行效果" />
							</div>
						</div>
						<p style="clear: both;"></p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<input type="submit" value="保存" class="btn btn-primary" />
				</div>
			</div>
		</div>
	</form>
	<div class="span12" style="float: left; margin-top: 10px;">
		<button class="btn btn-primary" type="button" onclick="add();">
			<span class="glyphicon glyphicon-plus-sign"></span> 添加
		</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary" type="button"
			onclick="return delete1();">
			<span class="glyphicon glyphicon-trash"></span> 删除
		</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary" type="button" onclick="update();">
			<span class="glyphicon glyphicon-wrench"></span> 修改
		</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary" type="button" onclick="kaifac();">
			<span class="glyphicon glyphicon-wrench"></span> 开发成功
		</button>
		&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary" type="button" onclick="kaifat();">
			<span class="glyphicon glyphicon-wrench"></span> 停止开发
		</button>
		&nbsp;&nbsp;&nbsp;
	</div>

	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th><span><input type="checkbox" id="checkAll"
								onclick="selectAll();" /></span></th>
						<th>编号</th>
						<th>日期</th>
						<th>计划内容</th>
						<th>执行效果</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${requestScope.wushuju!='暂无数据'}">
					<c:forEach var="list" items="${lists.rows}" varStatus="status">
						<tr class="success">
							<td><span><input type="checkbox" name="imgVo"
									onclick="select1();" value="${list.id} " /></span></td>
							<td>${list.marketing.id}</td>
							<td>${list.planDate}</td>
							<td>${list.planItem}</td>
							<td>${list.exeAffect}</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a
							href="<%=path %>/marketing/queryAll.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a
							href="<%=path %>/marketing/queryAll.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$("#customerName1").val($("#customerName2").val());
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
		$("#myModalLabel2").text("添加计划");
		$('#myModal2').modal();
	}

	function update() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			$("[name='imgVo']:checked").each(function() {
				str += $(this).val();
			})
			if (str.length > 3) {
				alert("一次只能修改一个！");
			} else {
				$.post("queryById.do", {
					'id' : str,
				}, function(data) {
					$("#id1").val(data.id)
					$("#saleChanceId1").val(data.saleChanceId)
					$("#planDate1").val(data.planDate);
					$("#planItem1").val(data.planItem);
					$("#exeAffect1").val(data.exeAffect);
				}, "json");
				$('#myModal3').modal();
			}
		} else {
			alert("请选中您要修改的那一行");
		}
	}

	function delete1() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			$("[name='imgVo']:checked").each(function() {
				str += $(this).val() + ",";
			})
			$.post("queryById.do", {
					'id' : str,
				}, function(data) {
					window.location.href = 'delete.do?id=' + str
					+ '&page=${lists.pageNo}'+'&idd='+data.saleChanceId;
				}, "json");
		
		} else {
			alert("至少选中一行！");
		}
	}

	function daochu() {
		window.location.href = 'daochu.do?page=${lists.pageNo}';
		alert('导出成功');
	}
	
	function kaifac(){
		window.location.href = 'updateqr.do?page=${lists.pageNo}&devResult=2';
	}
	
	function kaifat(){
		var id = $("#ids").val()
		window.location.href = 'kaifac.do?page=${lists.pageNo}&devResult=3&id='+id;
	}
</script>
</html>