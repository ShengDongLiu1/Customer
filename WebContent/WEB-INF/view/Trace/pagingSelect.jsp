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
			<form class="form-horizontal" action="<%=path %>/track/tackQueryPager.do?page=1" method="post">
				<div>
					<%-- 客户公司:&nbsp;&nbsp;&nbsp;&nbsp;<select name="kid" style="height: 30px; width: 150px;">
                            <optgroup label="请选择客户公司"></optgroup>
                            <c:forEach var="list" items="${listName}">
                           		<option value="${list.kid}">${list.comname}</option>
                            </c:forEach>
	                    </select>
	                    &nbsp;&nbsp;&nbsp;&nbsp;  --%>
					 记录时间:&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="date"  style="height: 30px; width: 150px;" name="recordtime"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
					 记录语句:&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text"  style="height: 30px; width: 150px;" name="measure"/>
				</div><br/>
				<div> 
					<input type="submit" style="height: 30px; width: 150px; margin-left: 300px;" 
						value="查询" />
				</div>
			</form>
			</div>
		</div> 
		<div class="span12"  style="float: left; margin-top: 10px; ">
				
			 <button class="btn btn-primary" type="button" onclick="update();">
			 	<span class="glyphicon glyphicon-wrench"></span>	 
			  修改
			 </button>&nbsp;&nbsp;&nbsp;
			
			 <button class="btn btn-primary" type="button" onclick="delete1();">
			 	<span class="glyphicon glyphicon-trash"></span>	 
			   批量删除
			 </button>
			 
			 <button class="btn btn-primary" type="button" onclick="daochu();">
			 	<span class="glyphicon glyphicon-trash"></span>	 
			  导出数据
			 </button>

		</div> 
			<br /><br />
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<table class="table" style="border: 2px solid; border-color: #DFF0D8;" >
				<thead>
					<tr>
					 	<th><span><input type="checkbox"  id="checkAll" onclick="selectAll();"/></span></th>
						<th>客户公司</th>
						<th>客户名称</th>
						<th>记录语句</th>
						<th>记录人员</th>
						<th>记录时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists.rows}">
						<tr class="success">
							<td><span><input type="checkbox" name="tid" value="${list.tid} " /></span></td>
							<td>${list.customer.comname}</td>
							<td>${list.customer.testman}</td>
							<td>${list.measure}</td>
							<td>${user.email}</td>
							<td>${list.recordtime}</td>
							<td><a href="<%=path %>/track/skiPage.do?tid=${list.tid}">更新</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=path %>/track/trackDelete.do?tid=${list.tid}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/contact/contactQueryPagers.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/contact/contactQueryPagers.do?page=${lists.pageNo + 1}">下一页</a></li>
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
   
        function delete1(){
        	if($("[name='tid']").is(':checked')) {  
	             var str=[];
	             $("[name='tid']:checked").each(function(){
	              str+=$(this).val()+",";
	             }) 
	            window.location.href='trackDelete.do?tid='+str+'';
        	}else{
        		alert("至少选中一行！");
        	}
        }
        
        
        function update(){
        	if($("[name='tid']").is(':checked')) {  
        		  var str=[];
                  $("[name='tid']:checked").each(function(){
                   str+=$(this).val();
                  }) 
                  if(str.length>3){
                	  alert("一次只能修改一个！");
                  }else{
                	  window.location.href='skiPage.do?tid='+str+'';  
                  }
        	}else{
        		alert("请选中您要修改的那一行");
        	}
        }
        
        
        function daochu(){ 
        	window.location.href='daochu.do?&page=${lists.pageNo}';
        	alert('导出成功');
        }
      
    </script>
</html>