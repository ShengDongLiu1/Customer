<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div >
		<div class="span12"  style="float: left; margin-top: 10px; ">
			<div>
			<form class="form-horizontal" action="<%=path %>/contact/contactQueryPager.do?page=1" method="post">
				<div>
					客户公司:&nbsp;&nbsp;&nbsp;&nbsp;<select id="mancom" name="mancom" style="height: 30px; width: 150px;">
                            <optgroup label="请选择客户公司"></optgroup>
                            <c:forEach var="list" items="${listName}">
                           		<option value="${list.kid}">${list.comname}</option>
                            </c:forEach>
	                    </select>
					客户名称:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="manname" />
					客户部门:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name=mandep />
					客户职位:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="manjob" />
				</div><br/>
				<div> 
					客户手机:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							id="mobile" name="manmobile" />
					技术程度:&nbsp;&nbsp;&nbsp;&nbsp;<select style="height: 30px; width: 150px;" name="manskill">
							<option value="">请选择技术程度</option>
							<option value="不懂">不懂</option>
							<option value="懂一点">懂一点</option>
							<option value="懂部分">懂部分</option>
							<option value="懂大部分">懂大部分</option>
							<option value="精通">精通</option>
						</select>
				    日志日期:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="height: 30px; width: 150px;"
							name="logdate" />
						    &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" style="height: 30px; width: 150px; margin-left: 65px;" 
						value="查询"/>
				</div>
			</form>
			</div>
		</div> 
		<div class="span12"  style="float: left; margin-top: 10px; ">
			 <button class="btn btn-primary" type="button" onclick="add();">
			 <span class="glyphicon glyphicon-plus-sign"></span>	 
			   添加
			 </button>&nbsp;&nbsp;&nbsp;
			 <button class="btn btn-primary" type="button" onclick="update();">
			 <span class="glyphicon glyphicon-plus-sign"></span>	 
			   修改
			 </button>&nbsp;&nbsp;&nbsp;
			 <button class="btn btn-primary" type="button" onclick="delete1();">
			 <span class="glyphicon glyphicon-trash"></span>	 
			   批量删除
			 </button>
			 <button class="btn btn-primary" type="button" onclick="daochu();">
			 <span class="glyphicon glyphicon-share-alt"></span>	 
			  导出数据
			 </button>&nbsp;&nbsp;&nbsp;
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
						<!-- <th>操作</th> -->
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${requestScope.tishi != 'tishi' }">
							<c:forEach var="list" items="${lists.rows}">
								<tr class="success">
									<td><span><input type="checkbox" name="imgVo" onclick="select1();" value="${list.manid} " /></span></td>
									<td>${list.customers.comname}</td>
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
									<%-- <td><a href="<%=path %>/contact/contactUpdate.do?manid=${list.manid}&page=${lists.pageNo}">更新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="<%=path %>/contact/contactDelete.do?manid=${list.manid}&page=${lists.pageNo}">删除</a></td> --%>
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
						<li><a href="<%=path %>/contact/contactQueryPagers.do?page=${lists.pageNo - 1}">上一页</a></li>
						<li><a href="<%=path %>/contact/contactQueryPagers.do?page=${lists.pageNo + 1}">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<form action="<%=path%>/contact/contactAddqr.do" method="post">
		<div class="modal fade" style="width: 800px;height: 600px;" id="ContactModal" role="dialog" aria-labelledby="ContactModalLabel">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content" style="width: 670px; left: -30px;" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">×</span></button>
		          <h4 class="modal-title" id="ContactModalLabel">新增</h4>
		        </div>
		        <div class="modal-body">
					<div style="float: left;">
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">客户公司:</label><select id="mancom" name="mancom" class="form-control" style="height: 35px; width: 280px;">
	                            <optgroup label="请选择客户公司"></optgroup>
	                            <c:forEach var="list" items="${listName}">
	                           		<option value="${list.kid}">${list.comname}</option>
	                            </c:forEach>
		                    </select>
						</div>
						<div class="form-group">
							<label class="control-label">客户名称:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="manname" name="manname" />
						</div>
						<div class="form-group">
							<label class="control-label">客户部门:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="mandep" name="mandep" />
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label class="control-label">客户职位:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="manjob" name="manjob" />
						</div>
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">客户电话:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="mannumber" name="mannumber" />
						</div>
					</div>
					<div style="float: left; margin-left: 20px">
						<div class="form-group" style="margin-bottom: 2px">
							<label class="control-label">客户手机: </label>
							<input type="text" class="form-control" class="form-control" style="height: 35px; width: 280px;" id="manmobile" name="manmobile" />
						</div>
						<div class="form-group">
							<label class="control-label">客户邮箱:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="manemail" name="manemail" />
						</div>
						<div class="form-group">
							<label class="control-label">客户QQ:</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="manqq" name="manqq" />
						</div>
						<div class="control-group" style="margin-bottom: 0px">
							<label class="control-label">客户MSN：</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="manmsn" name="manmsn" />
						</div>
						<div class="form-group" style="margin-bottom: 3px">
							<label class="control-label">技术程度:</label>
							<select id="manskill" class="form-control" name="manskill" style="height: 35px; width: 280px;">
								<optgroup label="请选择技术程度"></optgroup>
								<option value="不懂">不懂</option>
								<option value="懂一点">懂一点</option>
								<option value="懂部分">懂部分</option>
								<option value="懂大部分">懂大部分</option>
								<option value="精通">精通</option>
							</select>
						</div>
						<div class="control-group" style="margin-bottom: 0px">
							<label class="control-label">日志日期：</label>
							<input type="text" class="form-control" style="height: 35px; width: 280px;" id="logdate" name="logdate" value="${datetimes}" readonly="readonly"/>
						</div>
					</div>
		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">
		          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
		          <input type="submit" class="btn btn-primary" value="保存" />
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
       /*  function select1(){
        	$('input[name="imgVo"]:checked').each(function(){ 
       			alert($(this).val()); 
       		}); 
        } */
        function add(){
        	$("#ContactModalLabel").text("新增");
   	    	$('#ContactModal').modal();
    	}
        
        function delete1(){
        	if($("[name='imgVo']").is(':checked')) {  
	             var str=[];
	             $("[name='imgVo']:checked").each(function(){
	              str+=$(this).val()+",";
	             }) 
	            window.location.href='contactDelete.do?manid='+str+'&page=${lists.pageNo}';
        	}else{
        		toastr.warning("至少选中一行！");
        	}
        }
        
        function update(){
        	if($("[name='imgVo']").is(':checked')) {  
        		  var str=[];
                  $("[name='imgVo']:checked").each(function(){
                   str+=$(this).val();
                  }) 
                  if(str.length>3){
                	  toastr.warning("一次只能修改一个！");
                  }else{
                	  window.location.href='contactUpdate.do?manid='+str+'&page=${lists.pageNo}';  
                  }
        	}else{
        		toastr.warning("请选中您要修改的那一行");
        	}
        }
        
        function daochu(){ 
        	window.location.href='daochu.do?&page=${lists.pageNo}';
        	toastr.success('导出成功');
        }
      
    </script>
</html>