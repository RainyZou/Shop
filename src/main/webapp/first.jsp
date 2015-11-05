<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>在线商城</title>
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


</head>
<body>

	<c:import url="header"></c:import>
	<!--content-->

	<div class="banner">
			<script src="js/responsiveslides.min.js"></script>
			<script>
				$(function() {
					$("#slider").responsiveSlides({
						auto : true,
						nav : true,
						speed : 500,
						namespace : "callbacks",
						pager : true,
					});
				});
			</script>
			<div id="top" class="callbacks_container">
				<ul class="rslides" id="slider">
					<li><img src="images/yu3_1100_350.jpg"/></li>
					<li><img src="images/yu1_1100_350.jpg"/></li>
					<li><img src="images/yu2_1100_350.jpg"/></li>
				</ul>
			</div>
	</div>

	<div class="content">
		<div class="container">


			<div class="content-top">
				<h1>最新上线</h1>
				<c:forEach var="i" begin="0" end="${fn:length(latestList)}" step="3">
					<div class="grid-in">
						<c:forEach var="product" items="${latestList}" begin="${i}"
							end="${i+2}">
							<div class="col-md-4 grid-top">
								<a target="_blank" href="product/product?id=${product.id}"
									class="b-link-stripe b-animate-go  thickbox"><img
									class="img-responsive"
									src="${product.defaultPicturePath}" alt="">
									<div class="b-wrapper">
										<h3 class="b-animate b-from-left    b-delay03 ">
											<span>${product.name }</span>
										</h3>
									</div> </a>
								<p>
									<a target="_blank" href="product/product?id=${product.id}">${product.name } <font color="red">¥ ${product.standardPrice }</font></a>
								</p>
							</div>

						</c:forEach>
						<div class="clearfix"></div>
					</div>
				</c:forEach>
			</div>


			<div class="content-top">
				<h1>热销商品</h1>
				<c:forEach var="i" begin="0" end="${fn:length(topSeller)}" step="3">
					<div class="grid-in">
						<c:forEach var="product" items="${topSeller}" begin="${i}"
							end="${i+2}">

							<div class="col-md-4 grid-top">
								<a target="_blank" href="product/product?id=${product.id}"
									class="b-link-stripe b-animate-go  thickbox"><img
									class="img-responsive"
									src="${product.defaultPicturePath}" alt="">
									<div class="b-wrapper">
										<h3 class="b-animate b-from-left    b-delay03 ">
											<span>${product.name }</span>
										</h3>
									</div> </a>
								<p>
									<a target="_blank" href="product/product?id=${product.id}">${product.name } <font color="red">¥ ${product.standardPrice }</font></a>
								</p>
							</div>

						</c:forEach>
						<div class="clearfix"></div>
					</div>
				</c:forEach>
			</div>

			<div class="content-top">
				<h1>推荐商品</h1>
				<c:forEach var="i" begin="0" end="${fn:length(suggest)}" step="3">
					<div class="grid-in">
						<c:forEach var="product" items="${suggest}" begin="${i}"
							end="${i+2}">

							<div class="col-md-4 grid-top">
								<a target="_blank" href="product/product?id=${product.id}"
									class="b-link-stripe b-animate-go  thickbox"><img
									class="img-responsive"
									src="${product.defaultPicturePath}" alt="">
									<div class="b-wrapper">
										<h3 class="b-animate b-from-left    b-delay03 ">
											<span>${product.name }</span>
										</h3>
									</div> </a>
								<p>
									<a target="_blank" href="product/product?id=${product.id}">${product.name } <font color="red">¥ ${product.standardPrice }</font></a>
								</p>
							</div>

						</c:forEach>
						<div class="clearfix"></div>
					</div>
				</c:forEach>
			</div>
			<!----->
			<div class="clearfix"></div>
		</div>
	</div>

	<!---->
	<div class="content-bottom">
		<ul>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo.png" alt=""></a></li>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo1.png" alt=""></a></li>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo2.png" alt=""></a></li>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo3.png" alt=""></a></li>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo4.png" alt=""></a></li>
			<li><a target="_blank" href="#"><img class="img-responsive"
					src="images/lo5.png" alt=""></a></li>
			<div class="clearfix"></div>
		</ul>
	</div>
	</div>

	<!--//content-->
	<c:import url="footer.jsp"></c:import>
</body>
</html>