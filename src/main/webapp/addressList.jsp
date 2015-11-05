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
<title>个人中心 - 地址列表</title>
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
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>


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
				<h3>地址列表</h3>				
				<hr/>
				<table class="address-tb ncu-table-style">
					<thead>
						<tr>
							<th style="width: 10%;">别名</th>
							<th style="width: 10%;">收货人</th>
							<th style="width: 25%;">所在地区</th>
							<th style="width: 25%;">街道地址</th>
							<th style="width: 10%;">电话/手机</th>
							<th style="width: 10%;">默认地址</th>
							<th style="width: 10%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ads" items="${addressList}">
							<tr class="bd-line">
								<td class="tl">${ads.alias }</td>
								<td class="tl">${ads.name }</td>
								<td class="tl">${ads.addressSheng},${ads.addressShi},${ads.addressXian},${ads.addressZhen}</td>
								<td class="tl">${ads.addressDetail }</td>
								<td class="tl"><span class="mob">${ads.phone }</span></td>
								<td><c:choose>
										<c:when test="${ads.isDefault == 'on' }">
											<span>默认</span>
										</c:when>

										<c:otherwise>
											<a href="user/address/setAsDefault?addressId=${ads.id }">设为默认</a>
										</c:otherwise>
									</c:choose></td>
								<td><p>
										<a href="user/address/edit?addressId=${ads.id }">编辑</a>
									</p>
									<p>
										<a href="user/address/delete?addressId=${ads.id }">删除</a>
									</p></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>

	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>