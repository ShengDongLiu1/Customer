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
			<br /><br />
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<table class="table" style="border: 2px solid; border-color: #DFF0D8;" >
				<thead>
					<tr>
					 	<th><span><input type="checkbox" id="checkAll" onclick="selectAll();"/></span></th>
						<th>客户公司</th>
						<th>客户名称</th>
						<th>客户部门</th>
						<th>客户职位</th>
						<th>客户电话</th>
						<th>客户手机</th>
						<th>客户邮箱</th>
						<th>客户QQ</th>
						<th>客户MSN</th>
						<th>技术程度</th>
						<th>日志日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists.rows}">
						<tr class="success">
							<td><span><input type="checkbox" name="imgVo" onclick="select1();" value="${list.manid} " /></span></td>
							<td>${list.mancom}</td>
							<td>${list.manname}</td>
							<td>${list.mandep}</td>
							<td>${list.manjob}</td>
							<td>${list.mannumber}</td>
							<td>${list.manmobile}</td>
							<td>${list.manemail}</td>
							<td>${list.manqq}</td>
							<td>${list.manmsn}</td>
							<td>${list.manskill}</td>
							<td>${list.logdate}</td>
							<td><a href="<%=path %>/contact/contactUpdate.do?manid=${list.manid}&page=${lists.pageNo}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="<%=path %>/contact/contactDelete.do?manid=${list.manid}&page=${lists.pageNo}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<ul>
						<li><a href="<%=path %>/contact/contactQueryPager.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/contact/contactQueryPager.do?page=${lists.pageNo + 1}">下一页</a></li>
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
    		window.location.href="contactAdd.do";
    	}
        function delete1(){
        	if($("[name='imgVo']").is(':checked')) {  
	             var str=[];
	             $("[name='imgVo']:checked").each(function(){
	              str+=$(this).val()+",";
	             }) 
	            window.location.href='contactDelete.do?manid='+str+'&page=${lists.pageNo}';
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
                	  window.location.href='contactUpdate.do?manid='+str+'&page=${lists.pageNo}';  
                  }
        	}else{
        		alert("请选中您要修改的那一行");
        	}
        }
      
    </script>
</html>