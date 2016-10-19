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
			<form class="form-horizontal" action="<%=path %>/customer/queryAll.do?page=1" method="post">
				<div>
					公司名称:	<input type="text" style="height: 30px; width: 150px;"
							name="comname" value="${customer.comname}" placeholder="公司名称" />
					申请类型:	<input type="text" style="height: 30px; width: 150px;"
							name="atype" value="${customer.atype}"  placeholder="申请类型" />
					公司地址:	<input type="text" style="height: 30px; width: 150px;"
							name="comaddress" value="${customer.comaddress}" placeholder="公司地址" />
					主销产品:	<input type="text" style="height: 30px; width: 150px;"
							name="product" value="${customer.product}" placeholder="主销产品" />
				</div><br/>
				<div> 
					测试人:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="testman" value="${customer.testman}" placeholder="测试人" />
					客户状态:	<input type="text" style="height: 30px; width: 150px;"
							name="state" value="${customer.state}" placeholder="客户状态" />
				          指派人:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="designated" value="${customer.designated}" placeholder="指派人" />
						<input type="submit" style="height: 30px; width: 150px; margin-left: 65px;" 
						value="查询" />
				</div>
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
					<c:forEach var="list" items="${lists.rows}">
						<tr class="success">
							<td><span><input type="checkbox" name="imgVo" onclick="select1();" value="${list.kid} " /></span></td>
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
							<td><a href="<%=path %>/customer/update.do?kid=${list.kid}&page=${lists.pageNo}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/customer/delete.do?kid=${list.kid}&page=${lists.pageNo}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/customer/queryAll.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/customer/queryAll.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
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
<script src="<%=path %>/js/page.js"></script>
   <script>
        function selectAll(){
            $("INPUT[type='checkbox']").each( function() {
                $(this).attr('checked', true);
                $(this).parents('.checkbox').find('span').addClass('checked');
            });
        }
       /*  function select1(){
        	$('input[name="imgVo"]:checked').each(function(){ 
       			alert($(this).val()); 
       		}); 
        } */
        function add(){
    		window.location.href="add.do";
    	}
        function delete1(){
        	if($("[name='imgVo']").is(':checked')) {  
	             var str=[];
	             $("[name='imgVo']:checked").each(function(){
	              str+=$(this).val()+",";
	             }) 
	            window.location.href='delete.do?kid='+str+'&page=${lists.pageNo}';
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
                	  window.location.href='update.do?kid='+str+'&page=${lists.pageNo}';  
                  }
        	}else{
        		alert("请选中您要修改的那一行");
        	}
        }
      
    </script>
</html>