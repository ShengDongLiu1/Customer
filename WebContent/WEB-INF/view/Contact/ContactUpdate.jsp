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
<title>Insert title here</title>

<style type="text/css">
.input-lg { /* 设置大的输入框input*/
	height: 80px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.control-label {
	font-size: 18px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
//电话号码校验,7位以上
function checkTel(str){
   var Str=document.getElementById(str).value;
   RegularExp = /^((([0-9]{4}|[0-9]{3})-)|(([0-9]{4}|[0-9]{3})))*([0-9]{7}|[0-9]{8})$|^[0-9]{11}$/
   if (RegularExp.test(Str))
   {
       return true;
   }else{
       alert("电话号码格式不对");
       return false;
   }
}

//手机号码校验，长度为11位数字。
function checkMobile(str) {
	var Str=document.getElementById(str).value;
	//手机号长度为11位数字。
	var RegularExp=/^[0-9]{11}$/
	//匹配13，14，15，18开头的手机号码！
	var MobileExp=/^0?1[3|4|5|8][0-9]\d{8}$/
	if(MobileExp.test(Str)){
		return true;
	}else{
		alert("手机号格式不正确~");
		return false;
	}
}

//电子邮件校验
function checkMail(str){
   var Str=document.getElementById(str).value;
   RegularExp = /[a-z0-9]*@[a-z0-9]*\.[a-z0-9]+/gi
   if (RegularExp.test(Str)){
       return true;
   }else{
       alert("电子信箱格式不对！");
       return false;
   }
}

function contactupdate() {
	var a = document.getElementsByTagName("input");//就可以调用所有input型数据
	for (var i = 0; i < a.length; i++) {
		if (a[i].value == "") {
			alert("您有空白未填写！");
			return false;
			break;
		}
		if(a[i].value.length<1){
			alert("至少输输两个字符！");
			return false;
			break;
		}
	}
}
</script>
</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form class="form-horizontal" action="<%=path %>/contact/contactUpdateqr.do" >
				<div style='float: left;'>
					<div class="control-group">
						<div class="controls">
							<input type="hidden" style="height: 40px; width: 300px;" name="manid"
								 value="${contact.manid} " />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户公司:</label>
						<div class="controls">
							<select id="mancom" name="mancom" style="height: 40px; width: 300px;">
	                            <option value="">请选择客户公司</option>
	                            <c:forEach var="list" items="${listName}">
	                           	 <option value="${list.kid}">${list.comname}</option>
	                            </c:forEach>
	                    	</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户名称:</label>
						<div class="controls">
							<input type="text" value="${contact.manname}" style="height: 40px; width: 300px;" name="manname"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户部门:</label>
						<div class="controls">
							<input type="text" value="${contact.mandep}" style="height: 40px; width: 300px;"
								name="mandep"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户职位:</label>
						<div class="controls">
							<input type="text" value="${contact.manjob}" style="height: 40px; width: 300px;"
								name="manjob"  />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户电话:</label>
						<div class="controls">
							<input type="text" value="${contact.mannumber}" style="height: 40px; width: 300px;"
								id="tel" name="mannumber" onblur="checkTel('tel');"/>
						</div>
					</div>
				</div>
				<br/>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">客户手机:</label>
						<div class="controls">
							<input type="text" value="${contact.manmobile}" style="height: 40px; width: 300px;"
								id="mobile" name="manmobile" onblur="checkMobile('mobile');"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户邮箱:</label>
						<div class="controls">
							<input type="text" value="${contact.manemail}" style="height: 40px; width: 300px;"
								id="mail" name="manemail" onblur="checkMail('mail');"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户QQ:</label>
						<div class="controls">
							<input type="text" value="${contact.manqq}" style="height: 40px; width: 300px;"
								name="manqq" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户MSN：</label>
						<div class="controls">
							<input type="text" value="${contact.manmsn}" style="height: 40px; width: 300px;"
								name="manmsn" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">技术程度：</label>
						<div class="controls">
							<select style="height: 40px; width: 300px;" name="manskill">
								<option value="">请选择技术程度</option>
								<option value="不懂">不懂</option>
								<option value="懂一点">懂一点</option>
								<option value="懂部分">懂部分</option>
								<option value="懂大部分">懂大部分</option>
								<option value="精通">精通</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">创建时间：</label>
						<div class="controls">
							<input type="text" value="${contact.logdate}" style="height: 40px; width: 300px;"
								name="logdate" readonly="readonly"/>
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group" style="margin-left: 300px; margin-top: 40px;"> 
						<div class="controls">
							<input type="hidden" id="page" name="page" value="${page }">
							<button type="submit" class="btn" style="height: 40px; width: 150px;" onclick="contactupdate();">确认</button>
						</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap-combined.min.css">
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

</html>