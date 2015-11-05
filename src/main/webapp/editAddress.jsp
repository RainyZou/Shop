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
<title>编辑收货地址</title>
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
<script type="text/javascript" src="address/GlobalProvinces_main.js"></script>
<script type="text/javascript" src="address/GlobalProvinces_extend.js"></script>
<script type="text/javascript" src="address/initLocation.js"></script>

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
				<h1>编辑收货地址</h1>

				<form id="add_address_form" class="grid-form" method="post"
					action="user/address/edit">
					<div>
						<p>别名</p>
						<input type="text" id="alias" name="alias"
							value="${address.alias}"><label></label>
					</div>
					<div>
						<p>姓名</p>
						<input type="text" id="name" name="name" value="${address.name}"><label></label>
					</div>
					<div>
						<p>收货地址-区域</p>
						<select id="sheng" name="addressSheng">
						</select> 省 <select id="shi" name="addressShi">
						</select> 市 <select id="xian" name="addressXian">
						</select> 县或区 <select id="xiang" name="addressZhen">
						</select> 镇或街道 <label></label> <label></label>
					</div>
					<div>
						<p>收货地址-详细</p>
						<input type="text" id="addressDetail" name="addressDetail"
							value="${address.addressDetail}"><label></label>
					</div>
					<div>
						<p>手机号码</p>
						<input type="text" id="phone" name="phone"
							value="${address.phone}"><label></label>
					</div>
					<div>
						<input type="checkbox" id="isDefault" name="isDefault"
							<c:if test="${address.isDefault == 'on' }">checked="true"</c:if>><span>设置为默认地址</span><label></label>
					</div>
					<div>
						<input type="hidden" id="userId" name="userId"
							value="${address.userId}"> <input type="hidden" id="id"
							name="id" value="${address.id}"> <input type="submit"
							value="修改"> <label id="message" class="error">${message}</label>
					</div>
				</form>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>


	<script>
		//表单验证
		$(function() {
			jQuery.validator.addMethod("chmobile", function(value, element) {
				var pattern = /^1\d{10}$/;
				return this.optional(element) || (pattern.test(value));
			}, "mobile");
			$("#add_address_form").validate({
				errorPlacement : function(error, element) {
					var error_td = element.parent('div');
					error_td.find('label').hide();
					error_td.append(error);
				},
				rules : {
					phone : {
						required : true,
						chmobile : true,
					}
				},
				messages : {
					phone : {
						required : '手机号不能为空',
						chmobile : '请填写正确格式的手机号',
					}
				}
			});

			initLocation({
				sheng_val : "${address.addressSheng}",
				shi_val : "${address.addressShi}",
				xian_val : "${address.addressXian}",
				xiang_val : "${address.addressZhen}"
			});
		});
	</script>


	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>