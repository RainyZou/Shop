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
<title>个人中心-添加商品类别</title>
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
		$("input[name='checkall']").bind('change', setClick);
		$("input[name='ids']").bind('click', setAllFilter);
	});

	function setAllFilter() {
		var allLength = $("input[name='ids']").length;
		var checkLength = $("input[name='ids']:checked").length;
		if (allLength == checkLength) {
			$("input[name='checkall']").prop('checked', true);
		} else {
			$("input[name='checkall']").prop('checked', false);
		}
	}

	function setClick() {
		if (this.checked) {
			$("input[name='ids']").prop('checked', true);
		} else {
			$("input[name='ids']").prop('checked', false);
		}
	}
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/rainy.css" rel="stylesheet" type="text/css" media="all" />
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
				<jsp:include page="admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9 product-price1">
				<div class="col-md-6">
					<h1>添加类别</h1>

					<form id="add_category_form" class="grid-form-rainy" method="post"
						action="category/admin/add" onsubmit="">
						<div>
							<p>类别名称</p>
							<input type="text" id="cname" name="cname"><label></label>
						</div>
						<div>
							<p>所属分类</p>
							<select name="parentId">
								<option value="1"></option>
								<c:forEach var="category" items="${categoryList }">
									<option value="${category.id }">${category.cname }</option>
								</c:forEach>

							</select><label></label>
						</div>

						<div>
							<input type="submit" value="添加">
						</div>
					</form>
				</div>
				<div class="col-md-6">
					<form action="category/admin/action" method="post">
						<div>
							<span>操作</span><select name="action"><option
									value="delete">删除</option></select><input type="submit" value="执行" />
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkall" /></th>
									<th>类别名称</th>
									<th>商品数量</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${categoryList }">
									<tr>
										<td><input type="checkbox" name="ids" value="${category.id }"
											data-content="${category.id }" /></td>
										<td>${category.cname }</td>
										<td><a href="product/productList?id=${category.id}">${category.count }</a></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>

	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>