<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>注册</title>
<base href="<%=basePath%>">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="New Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	 function hideURLbar(){ window.scrollTo(0,1); } 



</script>


<!--fonts-->
<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.ui.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript">
	$(function() {
		$("#username").focus();
	});

	function changeyanzhengma() {
		var img = 'yanzhengma?t=' + Math.random();
		$("#yanzhengma_img").attr("src", img);
	}
</script>
</head>
<body>
	<c:import url="header"></c:import>
	<!--content-->


	<!--content-->
	<div class=" container">
		<div class=" register">
			<h1>注册</h1>
			<form id="register_form" method="post" action="user/register">
				<div class="col-md-6 register-top-grid">
					<h3>个人信息</h3>
					<div>
						<span>用户名</span> <input type="text" id="username" name="username"
							value="${user.username}" class="text tip"
							title="3-20位字符，可由中文、英文、数字及“_”、“-”组成" /><label></label>
					</div>
					<div>
						<span>邮箱</span> <input type="text" id="email" name="email"
							value="${user.email}" class="text tip"
							title="请输入常用的邮箱，将用来找回密码、接受订单通知等"><label></label>
					</div>
					<div>
						<span>手机号码</span> <input type="text" id="phone" name="phone"
							value="${user.phone}" class="text tip" title="请输入您的手机号码"><label></label>
					</div>
					<!-- 					<a class="news-letter" href="#"> <label class="checkbox"><input -->
					<!-- 							type="checkbox" name="checkbox" checked=""><i> </i>注册成功后登陆</label> -->
					<!-- 					</a> -->
				</div>
				<div class="col-md-6 register-bottom-grid">
					<h3>登陆信息</h3>
					<div>
						<span>密码</span> <input type="password" id="password"
							value="${user.password}" name="password" class="text tip"
							title="6-16位字符，可由英文、数字及标点符号组成"><label></label>
					</div>
					<div>
						<span>确认密码</span> <input type="password" id="password_confirm"
							value="${user.password}" name="password_confirm" class="text tip"
							title="请再次输入您的密码"><label></label>
					</div>
					<div class="yanzhengma">
						<span>验证码</span> <input type="text" name="yanzhengma"
							id="yanzhengma" maxlength="4" size="10" title="请输入验证码，不区分大小写">
						<img src="yanzhengma" title="看不清？点击换一张"
							onclick="changeyanzhengma()" border="0" id="yanzhengma_img"
							class="fl ml5"> <a href="javascript:void(0)" class="ml5"
							onclick="changeyanzhengma()">看不清，换一张</a> <br /> <label></label>
					</div>
					<input type="submit" id="submitBtn" name="Submit" value="立即注册"
						title="立即注册"> <label id="errorMessage" class="error">${errorMessage}</label>

				</div>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>

	<script>
		//注册表单验证
		$(function() {
			jQuery.validator.addMethod("lettersonly", function(value, element) {
				return this.optional(element)
						|| /^[^:%,'\*\"\s\<\>\&]+$/i.test(value);
			}, "Letters only please");
			jQuery.validator.addMethod("lettersmin",
					function(value, element) {
						return this.optional(element)
								|| ($.trim(value.replace(/[^\u0000-\u00ff]/g,
										"aa")).length >= 3);
					}, "Letters min please");
			jQuery.validator.addMethod("lettersmax",
					function(value, element) {
						return this.optional(element)
								|| ($.trim(value.replace(/[^\u0000-\u00ff]/g,
										"aa")).length <= 15);
					}, "Letters max please");
			jQuery.validator.addMethod("chmobile", function(value, element) {
				var pattern = /^1\d{10}$/;
				return this.optional(element) || (pattern.test(value));
			}, "mobile");

			$("#register_form").validate({
				errorPlacement : function(error, element) {
					var error_td = element.parent('div');
					error_td.find('label').hide();
					error_td.append(error);
				},
				rules : {
					username : {
						required : true,
						lettersmin : true,
						lettersmax : true,
						lettersonly : true,
						remote : {
							url : 'user/checkUsername',
							type : 'get',
							data : {
								name : function() {
									return $('#username').val();
								}
							}
						}
					},
					password : {
						required : true,
						minlength : 6,
						maxlength : 20
					},
					password_confirm : {
						required : true,
						equalTo : '#password'
					},
					email : {
						required : true,
						email : true,
						remote : {
							url : 'user/checkEmail',
							type : 'get',
							data : {
								email : function() {
									return $('#email').val();
								}
							}
						}
					},
					phone : {
						required : true,
						chmobile : true,
						remote : {
							url : 'user/checkPhone',
							type : 'get',
							data : {
								phone : function() {
									return $('#phone').val();
								}
							}
						}
					},
					yanzhengma : {
						required : true,
						remote : {
							url : 'user/checkYanzhengma',
							type : 'get',
							data : {
								yanzhengma : function() {
									return $('#yanzhengma').val();
								}
							}
						}
					},
					agree : {
						required : true
					}
				},
				messages : {
					username : {
						required : '用户名不能为空',
						lettersmin : '用户名必须在3-15个字符之间',
						lettersmax : '用户名必须在3-15个字符之间',
						lettersonly : '用户名不能包含敏感字符',
						remote : '该用户名已经存在'
					},
					password : {
						required : '密码不能为空',
						minlength : '密码长度应在6-20个字符之间',
						maxlength : '密码长度应在6-20个字符之间'
					},
					password_confirm : {
						required : '请再次输入您的密码',
						equalTo : '两次输入的密码不一致'
					},
					email : {
						required : '电子邮箱不能为空',
						email : '这不是一个有效的电子邮箱',
						remote : '该电子邮箱已经存在'
					},
					phone : {
						required : '手机号不能为空',
						chmobile : '请填写正确格式的手机号',
						remote : '该手机号已存在'
					},
					yanzhengma : {
						required : '请输入验证码',
						remote : '验证码不正确'
					},
					agree : {
						required : '请阅读并同意该协议'
					}
				}
			});
		});
	</script>


	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>