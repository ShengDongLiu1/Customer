<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.form-group {
	margin-bottom: 2px
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>

		<div class="span12" style="float: left; margin-top: 10px;">
			<div>
				<form class="form-horizontal"
					action="<%=path%>/track/queryAll.do?page=1" method="post">
					<div>
						公司名称: <input type="text" style="height: 30px; width: 150px;"
							name="comname" placeholder="公司名称" /> 申请类型: <input type="text"
							style="height: 30px; width: 150px;" name="atype"
							placeholder="申请类型" /> 公司地址: <input type="text"
							style="height: 30px; width: 150px;" name="comaddress"
							placeholder="公司地址" /> 主销产品: <input type="text"
							style="height: 30px; width: 150px;" name="product"
							placeholder="主销产品" />
					</div>
					<br />
					<div>
						客户名称:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							style="height: 30px; width: 150px;" name="testman"
							placeholder="客户名称" /> 客户状态: <input type="text"
							style="height: 30px; width: 150px;" name="state"
							placeholder="客户状态" /> <input type="submit"
							style="height: 30px; width: 150px; margin-left: 65px;" value="查询" />
					</div>
				</form>
			</div>
		</div>

		<div class="span12" style="float: left; margin-top: 10px;">
			<button class="btn btn-primary" type="button" onclick="record();">
				<span class="glyphicon glyphicon-plus-sign"></span> 新增记录
			</button>
			&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary" type="button" onclick="returnhome();">
				<span class="glyphicon glyphicon-share-alt"></span> 返回上一级
			</button>
			&nbsp;&nbsp;&nbsp;

		</div>
		<p style="clear: both;"></p>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<table class="table"
				style="border: 2px solid; border-color: #DFF0D8;">
				<thead>
					<tr>
						<th><span><input type="checkbox" id="checkAll"
								onclick="selectAll();" /></span></th>
						<th>公司名称</th>
						<th>申请类型</th>
						<th>公司背景</th>
						<th>公司地址</th>
						<th>主营产品</th>
						<th>组织结构</th>
						<th>客户名称</th>
						<th>申请信息</th>
						<th>客户状态</th>
						<th>新建时间</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${requestScope.tishi != 'tishi' }">
							<c:forEach var="list" items="${lists.rows}">
								<tr class="success">
									<td><span><input type="checkbox" name="imgVo"
											onclick="select1();" value="${list.kid} " /></span></td>
									<td>${list.comname}</td>
									<td>${list.atype}</td>
									<td>${list.combackdrop}</td>
									<td>${list.comaddress}</td>
									<td>${list.product}</td>
									<td>${list.structure}</td>
									<td>${list.testman}</td>
									<td>${list.amessage}</td>
									<td>${list.state}</td>
									<td>${list.newdate}</td>
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
							href="<%=path %>/track/queryState.do?page=${lists.pageNo - 1}&state=${requestScope.state}">上一页</a></li>
						<li><a
							href="<%=path %>/track/queryState.do?page=${lists.pageNo + 1}&state=${requestScope.state}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

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
<script>
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

	function record() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			var ss = $("[name='imgVo']:checked").length;
			$("[name='imgVo']:checked").each(function(index, item) {
				str += $(this).val()
				if (index != ss - 1) {
					str = str + ",";
				}
			})
			window.location.href = "skip.do?kid=" + str + ""
		} else {
			alert("请选中您要记录的那一行");
		}
	}

	function returnhome() {
		window.location.href = 'trackQueryPagers.do?page=1';
	}
</script>
</html>