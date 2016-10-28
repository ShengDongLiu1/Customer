<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
 	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-combined.min.css"> 
    <script src="js/zh-cn.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery/jQuery-2.2.0.min.js"></script>
    <script src="js/jquery.ui.touch-punch.min.js"></script>
    <script src="js/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-migrate-1.4.1.min (1).js"></script>
    <script src="js/deletejs.js"></script>
	<link href="js/toastr/toastr.css" rel="stylesheet" />
	<script src="js/toastr/toastr.min.js"></script>
	<style type="text/css">
		.form-group{
			margin-bottom: 2px
		}
	</style>
</head>
<body>
	<div class="modal fade" style="height:auto; width: auto;" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="p" role="document" style="width:auto">
	      <div class="modal-content" style="margin-left:-2%;">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	        <div class="modal-body">
				<div style="float: left;">
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">公司名称:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="comname" placeholder="公司名称" />
					</div>
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">公司地址:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="comaddress" placeholder="公司地址" />
					</div>
					<div class="form-group">
						<label class="control-label">主营产品:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="product" placeholder="主营产品" />
					</div>
					<div class="form-group">
						<label class="control-label">公司背景:</label>
						<select id="usertype" class="form-control" name="combackdrop" style="height: 35px; width: 280px;">
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
						<label class="control-label">申请类型:</label>
						<select id="atype" class="form-control" name="atype" style="height: 35px; width: 280px;">
							<option value="企业">企业</option>
							<option value="院校">院校</option>
							<option value="代理">代理</option>
						</select>
					</div>
				</div>
				<div style="float: left; margin-left: 20px">
					<div class="form-group" style="margin-bottom: 3px">
						<label class="control-label">组织结构:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="structure" placeholder="组织结构" />
					</div>
					<div class="form-group" style="margin-bottom: 2px">
						<label class="control-label">测试人: </label>
						<input type="text" class="form-control" class="form-control" style="height: 35px; width: 280px;" name="testman" placeholder="测试人" />
					</div>
					<div class="form-group">
						<label class="control-label">申请信息:</label>
						<input type="text" class="form-control" style="height: 35px; width: 280px;" name="amessage" placeholder="申请信息" />
					</div>
					<div class="form-group">
						<label class="control-label">客户状态:</label>
						<select id="usertype" class="form-control" name="state" style="height: 35px; width: 280px;">
							<option value="正式客户">正式客户</option>
							<option value="潜在客户">潜在客户</option>
							<option value="签约客户">签约客户</option>
                        </select>
					</div>
					<div class="control-group" style="margin-bottom: 0px">
						<label class="control-label">指派人：</label>
						<input type="text" class="form-control" value="${customer.designated}" style="height: 35px; width: 280px;" name="designated" placeholder="指派人" />
					</div>
				</div>
	        </div>
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">
	          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	          <button type="button" id="btn_submit" class="btn btn-primary" onclick="adds()" data-dismiss="modal">
	          <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	        </div>
	      </div>
	    </div>
	  </div>
	  <input type="button" onclick="add()" value="新增">
	  <input type="button" onclick="dele()" value="删除">
	  
  <script type="text/javascript">
  	 function add() {
  		$("#myModalLabel").text("新增");
	     $('#myModal').modal();
  	 }

  	 function adds() {
  		 alert("ddsa")
  	 }
  	 
  	function dele() {
    	/* if(0 > 1) { 
    		  var str=[];
              $("[name='imgVo']:checked").each(function(){
               str+=$(this).val();
              }) 
              if(str.length>3){
                  toastr.warning('只能选择一行进行编辑');
              }else{
            	  window.location.href='update.do?kid='+str+'&page=${lists.pageNo}';  
              }
    	}else{
    		toastr.warning('请选择有效数据');
    	} */
  	     Ewin.confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
  	       if (!e) {
  	         return;
  	       }
  	       alert("成功")
  	     }); 
  	   }
  </script>
</body>
</html>