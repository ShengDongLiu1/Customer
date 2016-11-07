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
	<div>
		<form action="<%=path%>/marketing/addqr.do" method="post" id="form1">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="width: 800px; height:580px;">
				<div class="modal-dialog" role="document" style="width: 700px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">新增</h4>
						</div>
						<div class="modal-body">

							<div style='float: left;'>
								<div class="control-group">
									<label class="control-label">客户公司:</label> <select id="mancom"
										name="customerName" style="height: 30px; width: 230px;">
										<c:forEach var="list1" items="${CustomerName}">
											<option value="${list1.kid}">${list1.comname}</option>
										</c:forEach>
									</select>
								</div>
								<div class="control-group">
									<label class="control-label">联系人:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											name="linkMan" placeholder="联系人" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">成功几率:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											id="cgjl2" name="cgjl" placeholder="成功几率" />
									</div>
								</div>
							</div>
							<div style="float: left; margin-left: 120px;">
								<div class="control-group">
									<label class="control-label">机会来源:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											name="chanceSource" placeholder="机会来源" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">联系电话:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											id="linkPhone2" name="linkPhone" placeholder="联系电话" />
									</div>
								</div>
							</div>
							<p style="clear: both;"></p>
							<div style="float: left;">
								<div class="control-group">
									<label class="control-label">概要:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 600px;"
											name="overView" placeholder="概要" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">机会描述:</label>
									<div class="description">
										<textarea rows="4" cols="30" style="width: 500px;"
											placeholder="机会描述" name="description"></textarea>
									</div>
								</div>
							</div>
							<div style="float: left;">
								<div class="control-group">
									<label class="control-label">创建人:</label>
									<div class="controls">
										<input type="text" readonly="readonly"
											style="height: 30px; width: 230px;" name="createMan"
											placeholder="创建人" value="${user.uname}" />
									</div>
								</div>
							</div>
							<div style="float: left; margin-left: 120px;">
								<div class="control-group">
									<label class="control-label">指派给:</label>
									<div class="controls">
										<select name="assignMan" style="height: 30px; width: 230px;">
											<c:forEach var="list" items="${userName}">
												<option value="${list.userid}">${list.uname}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<input type="submit" value="保存" onclick="return addqr()"
							class="btn btn-primary" />
					</div>
				</div>
			</div>
		</form>


		<form action="<%=path%>/marketing/updateqr.do" method="post">
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="width: 800px; height: 580px;" >
				<div class="modal-dialog" role="document" style="width: 700px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel1">修改</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" id="ids" value="${list.id }" name="id" />
							<div style='float: left;'>
								<div class="control-group">
									<label class="control-label">客户公司:</label> <select
										id="customerName1" name="customerName"
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
											id="linkMan1" name="linkMan" placeholder="联系人" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">成功几率:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											id="cgjl1" name="cgjl" placeholder="成功几率" />
									</div>
								</div>
							</div>
							<div style="float: left; margin-left: 120px;">
								<div class="control-group">
									<label class="control-label">机会来源:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											id="chanceSource1" name="chanceSource" placeholder="机会来源" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">联系电话:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 230px;"
											id="linkPhone1" name="linkPhone" placeholder="联系电话" />
									</div>
								</div>
							</div>
							<p style="clear: both;"></p>
							<div style="float: left;">
								<div class="control-group">
									<label class="control-label">概要:</label>
									<div class="controls">
										<input type="text" style="height: 30px; width: 600px;"
											id="overView1" name="overView" value="${list.overView }"
											placeholder="概要" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">机会描述:</label>
									<div class="description">
										<textarea rows="4" cols="30" style="width: 500px;"
											id="description1" placeholder="机会描述" name="description">${list.description }</textarea>
									</div>
								</div>
							</div>
							<div style="float: left;">
								<div class="control-group">
									<label class="control-label">指派给:</label>
									<div class="controls">
										<select name="assignMan" id="assignMan1"
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
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<input type="submit" value="保存" class="btn btn-primary" />
					</div>
				</div>
			</div>
		</form>
	</div>

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
		<button class="btn btn-primary" type="button" onclick="daochu();">
			<span class="glyphicon glyphicon-share-alt"></span> 导出数据
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
						<th>公司名称</th>
						<th>机会来源</th>
						<th>概要</th>
						<th>联系人</th>
						<th>联系人电话</th>
						<th>机会描述</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>指派人</th>
						<th>状态</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${requestScope.tishi != 'tishi' }">
							<c:forEach var="list" items="${lists.rows}" varStatus="status">
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
									<td><c:if test="${list.state == 0 }">
									未分配
								</c:if> <c:if test="${list.state == 1 }">
									已分配
								</c:if></td>
									<td><a
										href="<%=path %>/marketing/delete.do?id=${list.id}&page=${lists.pageNo}">删除</a></td>
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

	function update1() {
		$("#ids").val(str);
		$("#myModalLabel1").text("修改");
		$('#myModal2').modal();
	}

	function update() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			$("[name='imgVo']:checked").each(function() {
				str += $(this).val();
			})
			if (str.length > 3) {
				toastr.warning("一次只能修改一个！");
			} else {
				$("#ids").val(str);
				$.post("queryById.do", {
					'id' : $("#ids").val()
				}, function(data) {
					$("#customerName1").val(data.customerName);
					$("#linkMan1").val(data.linkMan);
					$("#linkPhone1").val(data.linkPhone);
					$("#cgjl1").val(data.cgjl);
					$("#chanceSource1").val(data.chanceSource);
					$("#overView1").val(data.overView);
					$("#description1").val(data.description);
					$("#assignMan1").val(data.assignMan);

				}, "json");
				$("#myModalLabel1").text("修改");
				$('#myModal2').modal();
			}
		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function delete1() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			$("[name='imgVo']:checked").each(function() {
				str += $(this).val() + ",";
			})
			Ewin.confirm({
				message : "确认要删除选择的数据吗？"
			}).on(
					function(e) {
						if (!e) {
							return;
						} else {
							window.location.href = 'delete.do?id=' + str
									+ '&page=${lists.pageNo}';
							toastr.success('删除数据成功');
						}
					});
		} else {
			toastr.warning('至少选中一行！');
		}
	}

	function daochu() {
		window.location.href = 'daochu.do?page=${lists.pageNo}';
		toastr.success('导出成功');
	}

	function addqr() {
		var _form = document.getElementById("form1");
		//获取该表单下的所有input标签
		var a = _form.getElementsByTagName("input");
		var mannumber = document.getElementById("linkPhone2");
		var cgjl = document.getElementById("cgjl2");

		for (var i = 0; i < a.length; i++) {
			if (a[i].value == "") {
				toastr.warning("您有空白未填写！");
				return false;
				break;
			}
			if (a[i].value.length < 1) {
				toastr.warning("至少输输两个字符！");
				return false;
				break;
			}
		}

		var MobileExp = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/
		if (MobileExp.test(mannumber.value)) {
			return true;
		} else {
			toastr.warning("手机号格式不正确~");
			return false;
		}
	}
</script>
</html>