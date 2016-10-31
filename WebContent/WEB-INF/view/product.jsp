<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div >
		<div class="span12"  style="float: left; margin-top: 10px; ">
			<div>
			<form class="form-horizontal" action="<%=path %>/product/queryAll.do?page=1" method="post">
				<div>
					产品名称:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="pname"  placeholder="公司名称" />
					产品类型:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px; "
							name="ptype"   placeholder="产品类型" />
						<input type="submit" style="height: 30px; width: 150px; margin-left: 65px;" 
						value="查询" />
				</div><br/>
			</form>
			</div>
		</div> 
		
		<div class="span12"  style="float: left; margin-top: 10px; ">
			 <button class="btn btn-primary" type="button" onclick="add();">
			 <span class="glyphicon glyphicon-plus-sign"></span>	 
			   添加
			 </button>&nbsp;&nbsp;&nbsp;
			 <button class="btn btn-primary" type="button" onclick="delete1();">
			 <span class="glyphicon glyphicon-trash"></span>	 
			   删除
			 </button>&nbsp;&nbsp;&nbsp;
			  <button class="btn btn-primary" type="button" onclick="update();">
			 <span class="glyphicon glyphicon-wrench"></span>	 
			  修改
			 </button>
		</div> 
		<p style="clear:both;"></p>
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<table class="table" style="border: 2px solid; border-color: #DFF0D8;" >
				<thead>
					<tr>
					 	<th><span><input type="checkbox" id="checkAll" onclick="selectAll();"/></span></th>
						<th>产品名称</th>
						<th>产品价格</th>
						<th>产品存货</th>
						<th>产品价格</th>
						<th>产品类型</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists.rows}">
						<tr class="success">
							<td><span><input type="checkbox" name="imgVo" onclick="select1();" value="${list.pid} " /></span></td>
							<td>${list.pname}</td>
							<td>${list.pnumber}</td>
							<td>${list.pstock}</td>
							<td>${list.pprice}</td>
							<td>${list.ptype}</td>
							<td><a href="<%=path %>/product/proupdate.do?pid=${list.pid}&page=${lists.pageNo}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/product/pdelete.do?pid=${list.pid}&page=${lists.pageNo}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/product/queryAll.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/product/queryAll.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹框 -->
	<form action="<%=path %>/product/productAdd.do" method="post">
	<div class="modal fade" style="height:auto; width: auto;" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content" style="width: 670px;">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="productModalLabel">新增</h4>
	        </div>
	        <div class="modal-body">
				<div style="float: left;">
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">产品名称:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="pname" placeholder="产品名称" />
					</div>
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">产品价格:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="pprice" placeholder="产品价格" />
					</div>
					<div class="form-group" style="margin-bottom: 3px">
						<input type="hidden" class="form-control" style="height: 35px; width: 280px;" name="pnumber" placeholder="产品编号" />
					</div>
				</div>
				<div style="float: left; margin-left: 20px">
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">产品货存:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="pstock" placeholder="产品货存" />
					</div>
					<div class="form-group">
						<label class="control-label">产品类型:</label>
						<select id="usertype" class="form-control" name="ptype" style="height: 34px; width: 280px;">
							 <option value="">请选择产品类型</option>
                             <option value="办公">办公</option>
                             <option value="体育">体育</option>
                             <option value="建设">建设</option>
                             <option value="医疗">医疗</option>
                        </select>
					</div>
				</div>
	        </div>
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">
	          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	          <input type="submit" class="btn btn-primary" value="保存">
	        </div>
	      </div>
	    </div>
	  </div>
	  </form>
</body>
<link rel="stylesheet" href="<%=path %>/js/toastr/toastr.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
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
        function selectAll(){
            $("INPUT[type='checkbox']").each( function() {
                $(this).attr('checked', true);
                $(this).parents('.checkbox').find('span').addClass('checked');
            });
        }
        function add() {
     		$("#productModalLabel").text("新增");
   	    	$('#productModal').modal();
     	 }
        function addk(){
        	
        }
        function delete1(){
        	if($("[name='imgVo']").is(':checked')) {  
	             var str=[];
	             $("[name='imgVo']:checked").each(function(){
	              str+=$(this).val()+",";
	             }) 
	            window.location.href='pdelete.do?pid='+str+'&page=${lists.pageNo}';
        	}else{
        		alert("至少选中一行！");
        	}
        }
        
        function update(){
        	if($("[name='imgVo']").is(':checked')) {  
        		  var str=[];
                  $("[name='imgVo']:checked").each(function(){
                   str+=$(this).val();
                  }) 
                  if(str.length>3){
                	  alert("一次只能修改一个！");
                  }else{
                	  window.location.href='proupdate.do?pid='+str+'&page=${lists.pageNo}';  
                  }
        	}else{
        		alert("请选中您要修改的那一行");
        	}
        }
      
    </script>
</html>