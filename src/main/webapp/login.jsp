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
<title>登陆</title>
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
		if (getLocalCartCount() != 0) {
			var param = getLocalCartParam();
			$("#hiddenCarts").val(param);
		}	
	});
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<c:import url="header"></c:import>
	<!--content-->
	<!--content-->
	<div class="container">
		<div class="account">
			<h1>登陆</h1>
			<div class="account-pass">
				<div class="col-md-8 account-top">
					<form id="login_form" method="post" action="user/login">
						<input id="hiddenCarts" name="hiddenCarts" type="hidden" value="">
						<div>
							<span>邮箱</span> <input type="text" id="email" name="email"
								value="${email}"><label></label>
						</div>
						<div>
							<span>密码</span> <input type="password" id="password"
								name="password" value="${password}"><label></label>
						</div>
						<input type="submit" id="submitBtn" value="登陆" />&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="user/applyResetPassword">忘记密码?</a>&nbsp;&nbsp;&nbsp;&nbsp;<label id="errorMessage"
							class="error">${errorMessage}</label>
					</form>
				</div>
				<div class="col-md-4 left-account ">
					<a href="single.html"><img class="img-responsive "
						src="images/s1.jpg" alt=""></a>
					<div class="five">
						<h2>25%</h2>
						<span>折扣</span>
					</div>
					<a href="register.html" class="create">现在注册</a>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>

	<script>
		//注册表单验证
		$(function() {
			$("#login_form").validate({
				errorPlacement : function(error, element) {
					var error_td = element.parent('div');
					error_td.find('label').hide();
					error_td.append(error);
				},
				rules : {
					password : {
						required : true,
						minlength : 6,
						maxlength : 20
					},
					email : {
						required : true,
						email : true
					}
				},
				messages : {
					password : {
						required : '密码不能为空',
						minlength : '密码长度应在6-20个字符之间',
						maxlength : '密码长度应在6-20个字符之间'
					},
					email : {
						required : '电子邮箱不能为空',
						email : '这不是一个有效的电子邮箱'
					}
				}
			});
		});
	</script>


	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>