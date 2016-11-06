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
					action="<%=path%>/customer/queryAll.do?page=1" method="post">
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
						测试人:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							style="height: 30px; width: 150px;" name="testman"
							placeholder="测试人" /> 客户状态: <input type="text"
							style="height: 30px; width: 150px;" name="state"
							placeholder="客户状态" /> 指派人:&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" style="height: 30px; width: 150px;" name="designated"
							placeholder="指派人" /> <input type="submit"
							style="height: 30px; width: 150px; margin-left: 65px;" value="查询" />
					</div>
				</form>
			</div>
		</div>

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
			<c:if test="${requestScope.state == 1}">
				<button class="btn btn-primary" type="button" onclick="zhuanz();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为正式客户
				</button>&nbsp;&nbsp;&nbsp;
				 	  <button class="btn btn-primary" type="button"
					onclick="zhuanf();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为放弃客户
				</button>
				<button class="btn btn-primary" type="button" onclick="zhuanqy();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为签约客户
				</button>
			</c:if>
			<c:if test="${requestScope.state == 2}">
				<button class="btn btn-primary" type="button" onclick="zhuanq();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为潜在客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanf();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为放弃客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanqy();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为签约客户
				</button>
			</c:if>
			<c:if test="${requestScope.state == 3}">
				<button class="btn btn-primary" type="button" onclick="zhuanq();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为潜在客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanz();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为正式客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanqy();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为签约客户
				</button>
			</c:if>
			<c:if test="${requestScope.state == 4}">
				<button class="btn btn-primary" type="button" onclick="zhuanq();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为潜在客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanz();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为正式客户
				</button>&nbsp;&nbsp;&nbsp;
					 <button class="btn btn-primary" type="button" onclick="zhuanf();">
					<span class="glyphicon glyphicon-share-alt"></span> 转为放弃客户
				</button>
			</c:if>
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
						<th>测试人</th>
						<th>申请信息</th>
						<th>客户状态</th>
						<th>新建时间</th>
						<th>指派人</th>
						<th>操作</th>
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
									<td>${list.designated}</td>
									<td><a
										href="<%=path %>/customer/update.do?kid=${list.kid}&page=${lists.pageNo}&state=${requestScope.state}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="<%=path %>/customer/delete.do?kid=${list.kid}&page=${lists.pageNo}&state1=${requestScope.state}"
										onclick="return delete2();">删除 </a>
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
							href="<%=path %>/customer/queryState.do?page=${lists.pageNo - 1}&state=${requestScope.state}">上一页</a></li>
						<li><a
							href="<%=path %>/customer/queryState.do?page=${lists.pageNo + 1}&state=${requestScope.state}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" style="height: auto; width: auto;" id="myModal"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 670px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增</h4>
				</div>
				<div class="modal-body">
					<div style="float: left;">
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">公司名称:</label> <input type="text"
								class="form-control" style="height: 35px; width: 280px;"
								name="comname" placeholder="公司名称" />
						</div>
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">公司地址:</label> <input type="text"
								class="form-control" style="height: 35px; width: 280px;"
								name="comaddress" placeholder="公司地址" />
						</div>
						<div class="form-group">
							<label class="control-label">主营产品:</label> <input type="text"
								class="form-control" style="height: 35px; width: 280px;"
								name="product" placeholder="主营产品" />
						</div>
						<div class="form-group">
							<label class="control-label">公司背景:</label> <select id="usertype"
								class="form-control" name="combackdrop"
								style="height: 35px; width: 280px;">
								<option value="机构组织">机构组织</option>
								<option value="农林牧渔">农林牧渔</option>
								<option value="医药卫生">医药卫生</option>
								<option value="建筑建材">建筑建材</option>
								<option value="冶金矿产">冶金矿产</option>
								<option value="交通运输">交通运输</option>
								<option value="信息产业">信息产业</option>
								<option value="机械机电">机械机电</option>
								<option value="轻工食品">轻工食品</option>
								<option value="服装纺织">服装纺织</option>
								<option value="专业服务">专业服务</option>
								<option value="安全防护">安全防护</option>
								<option value="家居用品">家居用品</option>
								<option value="包装">包装</option>
								<option value="体育">体育</option>
								<option value="办公">办公</option>
								<option value="物资">物资</option>
								<option value="其它">其它</option>
							</select>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label class="control-label">申请类型:</label> <select id="atype"
								class="form-control" name="atype"
								style="height: 35px; width: 280px;">
								<option value="企业">企业</option>
								<option value="院校">院校</option>
								<option value="代理">代理</option>
							</select>
						</div>
					</div>
					<div style="float: left; margin-left: 20px">
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">组织结构:</label> <input type="text"
								class="form-control" style="height: 35px; width: 280px;"
								name="structure" placeholder="组织结构" />
						</div>
						<div class="form-group" style="margin-bottom: 2px">
							<label class="control-label">测试人: </label> <input type="text"
								class="form-control" class="form-control"
								style="height: 35px; width: 280px;" name="testman"
								placeholder="测试人" />
						</div>
						<div class="form-group">
							<label class="control-label">申请信息:</label> <input type="text"
								class="form-control" style="height: 35px; width: 280px;"
								name="amessage" placeholder="申请信息" />
						</div>
						<div class="form-group">
							<label class="control-label">客户状态:</label> <select id="usertype"
								class="form-control" name="state"
								style="height: 34px; width: 280px;">
								<option value="正式客户">正式客户</option>
								<option value="潜在客户">潜在客户</option>
								<option value="签约客户">签约客户</option>
							</select>
						</div>
						<div class="control-group" style="margin-bottom: 0px">
							<label class="control-label">指派人：</label> <input type="text"
								class="form-control" value="${customer.designated}"
								style="height: 35px; width: 280px;" name="designated"
								placeholder="指派人" />
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						onclick="addk()" data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
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

	/*  function select1(){
	 	$('input[name="imgVo"]:checked').each(function(){ 
				alert($(this).val()); 
			}); 
	 } */

	function add() {
		$("#myModalLabel").text("新增");
		$('#myModal').modal();
	}
	function addk() {

	}

	function delete1() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			$("[name='imgVo']:checked").each(function() {
				str += $(this).val() + ",";
			})
			Ewin
					.confirm({
						message : "确认要删除选择的数据吗？"
					})
					.on(
							function(e) {
								if (!e) {
									return;
								} else {
									window.location.href = 'delete.do?kid='
											+ str
											+ '&page=${lists.pageNo}&state1=${requestScope.state}';
									toastr.success('删除数据成功');
								}
							});
		} else {
			toastr.warning('至少选中一行！');
		}
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
				window.location.href = 'update.do?kid=' + str
						+ '&page=${lists.pageNo}&state=${requestScope.state}';
			}
		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function zhuanz() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			var ss = $("[name='imgVo']:checked").length;
			$("[name='imgVo']:checked").each(function(index, item) {
				str += $(this).val()
				if (index != ss - 1) {
					str = str + ",";
				}
			})
			window.location.href = "updatestate.do?state=正式客户&kid=" + str
					+ "&state1=" + $
			{
				requestScope.state
			}
			+"&page=${lists.pageNo}"
		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function zhuanq() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			var ss = $("[name='imgVo']:checked").length;
			$("[name='imgVo']:checked").each(function(index, item) {
				str += $(this).val()
				if (index != ss - 1) {
					str = str + ",";
				}
			})
			window.location.href = "updatestate.do?state=潜在客户&kid=" + str
					+ "&state1=" + $
			{
				requestScope.state
			}
			+"&page=${lists.pageNo}"
		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function zhuanf() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			var ss = $("[name='imgVo']:checked").length;
			$("[name='imgVo']:checked").each(function(index, item) {
				str += $(this).val()
				if (index != ss - 1) {
					str = str + ",";
				}
			})
			window.location.href = "updatestate.do?state=放弃客户&kid=" + str
					+ "&state1=" + $
			{
				requestScope.state
			}
			+"&page=${lists.pageNo}"

		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function zhuanqy() {
		if ($("[name='imgVo']").is(':checked')) {
			var str = [];
			var ss = $("[name='imgVo']:checked").length;
			$("[name='imgVo']:checked").each(function(index, item) {
				str += $(this).val()
				if (index != ss - 1) {
					str = str + ",";
				}
			})
			window.location.href = "updatestate.do?state=签约客户&kid=" + str
					+ "&state1=" + $
			{
				requestScope.state
			}
			+"&page=${lists.pageNo}"
		} else {
			toastr.warning("请选中您要修改的那一行");
		}
	}

	function daochu() {
		window.location.href = 'daochu.do?state=${requestScope.state}'
				+ '&page=${lists.pageNo}';
		toastr.success('导出成功');
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
			toastr.warning("请选中您要记录的那一行");
		}
	}
</script>
</html>