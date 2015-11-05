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
<title>重置密码</title>
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

	<div class="container">
		<div class="account">
			<div class="account-pass">
				<div class="col-md-8 account-top">
					<h1>重置密码</h1>
					<c:choose>
						<c:when test="${code == 1}">
							<label id="errorMessage" class="error">${message}</label>
						</c:when>

						<c:otherwise>
							<form id="apply_reset_password_form" method="post"
								action="user/applyResetPassword">
								<div>
									<span>请输入您注册时使用的邮箱地址，我们将发送重置链接至该邮箱</span> <input type="text"
										id="email" name="email" value="${email}"><label></label>
								</div>
								<input type="submit" id="submitBtn" value="申请重置" />&nbsp;&nbsp;&nbsp;&nbsp;<label
									id="errorMessage" class="error">${message}</label>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>


	<script>
		//注册表单验证
		$(function() {
			$("#apply_reset_password_form").validate({
				errorPlacement : function(error, element) {
					var error_td = element.parent('div');
					error_td.find('label').hide();
					error_td.append(error);
				},
				rules : {
					email : {
						required : true,
						email : true
					}
				},
				messages : {
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