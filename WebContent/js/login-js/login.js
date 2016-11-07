// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}

    	$(function(){
			//提交表单
			$('#submit_btn').click(function(){
				var email = $("#email").val();
				var password = $("#password").val();
				var code = $("#code").val();
				var status = $("#status").val();
				show_loading();
				var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮件正则
				if(email == ''){
					show_err_msg('邮箱还没填呢！');	
					$('#email').focus();
				}else if(!myReg.test($('#email').val())){
					show_err_msg('您的邮箱格式错咯！');
					$('#email').focus();
				}else if(password == ''){
					show_err_msg('密码还没填呢！');
					$('#password').focus();
				}else if($('#code').val() == ''){
					show_err_msg('验证码还没填呢！');
					$('#code').focus();
				/*}else if($('#status').val() == ''){
					show_err_msg('用户类型还没选呢！');
					$('#status').focus();*/
				}else{
					show_msg('登录中！  正在为您跳转...');
					$("#login_form").submit();
				}
			});
		});