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
<title>个人中心-修改密码</title>
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
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>
	<c:import url="header"></c:import>
	<!--content-->

	<div class="product">
		<div class="container">
			<div class="col-md-3 product-price">
				<jsp:include page="personal_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9 product-price1">
				<h3>修改密码</h3>
				<hr/>

				<c:choose>
					<c:when test="${code == 1}">
						<label id="errorMessage" class="error">${message}</label>
					</c:when>

					<c:otherwise>
						<form id="change_password_form" class="grid-form" method="post"
							action="user/changePassword">
							<div>
								<span class="tip-span">原始密码</span>
								<input type="password" id="oldPwd" name="oldPwd"><label></label>
							</div>
							<div>
								<span class="tip-span">新密码</span>
								<input type="password" id="newPwd" name="newPwd"><label></label>
							</div>
							<div>
								<span class="tip-span">确认新密码</span>
								<input type="password" id="newPwd_confirm" name="newPwd_confirm"><label></label>
							</div>
							<div>
								<input type="hidden" id="userId" name="userId"
									value="${sessionScope.user.id}"> <input type="submit"
									value="修改"> <label id="message" class="error">${message}</label>
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>


	<script>
		//注册表单验证
		$(function() {
			$("#change_password_form").validate({
				errorPlacement : function(error, element) {
					var error_td = element.parent('div');
					error_td.find('label').hide();
					error_td.append(error);
				},
				rules : {
					oldPwd : {
						required : true,
						minlength : 6,
						maxlength : 20
					},
					newPwd : {
						required : true,
						minlength : 6,
						maxlength : 20
					},
					newPwd_confirm : {
						required : true,
						equalTo : '#newPwd'
					},
				},
				messages : {
					oldPwd : {
						required : '密码不能为空',
						minlength : '密码长度应在6-20个字符之间',
						maxlength : '密码长度应在6-20个字符之间'
					},
					newPwd : {
						required : '密码不能为空',
						minlength : '密码长度应在6-20个字符之间',
						maxlength : '密码长度应在6-20个字符之间'
					},
					newPwd_confirm : {
						required : '请再次输入您的密码',
						equalTo : '两次输入的密码不一致'
					},
				}
			});
		});
	</script>



	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>