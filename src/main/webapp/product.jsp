<%@page import="java.awt.Window"%>
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
<title>${product.name}</title>
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
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

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

		$(".item_add").bind("click", function() {
			var productId = $(this).attr("product-id");
			$.ajax({
				url : "cart/add?productId=" + productId,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					setCartNumber(data.count);
				},
				error : function() {
					setLocalCart(productId);
				}
			});
		});

	});

	function moveDiv() {
		var o = $("#divMove");
		var from = $("#fromA").offset();
		var to = $("#toImg").offset();
		o.css("top", from.top);
		o.css("left", from.left);
		o.css("display", "block");
		o.animate({
			top : to.top,
			left : to.left
		}, "slow", function() {
			o.css("display","none");
		});
	}
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
table, th, td {
	border: 1px solid rgba(51, 51, 51, 0.1);
}

td, th {
	padding: 0.4em
}
</style>
</head>
<body>
	<c:import url="header"></c:import>

	<!--content-->
	<!---->

	<div id="divMove"
		style="background: orange; height: 20px; width: 20px; position: absolute; display: none"></div>
	<div class="product">
		<div class="container">

			<div class="col-md-9 product-price1">
				<div class="col-md-5 single-top">
					<div class="flexslider">
						<ul class="slides">

							<li data-thumb="${product.defaultPicturePath}"><img
								src="${product.defaultPicturePath}" /></li>
							<c:forEach items="${product.pictures}" var="picture">
								<li data-thumb="${picture.picturePath}"><img
									src="${picture.picturePath}" /></li>
							</c:forEach>
						</ul>
					</div>
					<!-- FlexSlider -->
					<script defer src="js/jquery.flexslider.js"></script>
					<link rel="stylesheet" href="css/flexslider.css" type="text/css"
						media="screen" />

					<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								controlNav : "thumbnails"
							});
						});
					</script>
					<c:import url="favorites/status?productId=${product.id}"></c:import>
				</div>
				<div class="col-md-7 single-top-in simpleCart_shelfItem">
					<div class="single-para ">
						<h4>${product.name}</h4>
						<div class="star-on">

							<!-- 		<ul class="star-footer">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i> </i></a></li>
							</ul>
						 	
							<div class="review">
								<a href="#"> 1 customer review </a>

							</div>
							 -->
							<div class="clearfix"></div>
						</div>

						<h5 class="item_price">¥ ${product.standardPrice}</h5>
						<p>${product.shortDescription}</p>
						<a id="fromA" href="javascript:moveDiv();"
							class="add-cart item_add" product-id="${product.id}">添加到购物车</a>
					</div>
				</div>
				<div class="clearfix"></div>
				<!---->
				<div class="cd-tabs">
					<nav>
					<ul class="cd-tabs-navigation">
						<li><a data-content="fashion" href="#0" class="selected ">商品介绍
						</a></li>
						<li><a data-content="cinema" href="#0">成交记录</a></li>
						<li><a data-content="television" href="#0">商品评价</a></li>

					</ul>
					</nav>
					<div class="cd-tabs-content-div">
						<div data-content="fashion" class="unselected selected">
							<div class="facts">${product.details}</div>

						</div>
						<div data-content="cinema" class="unselected">
							<br>
							<div class="facts1">
								<table cellspacing="0" cellpadding="0" border="0"
									class="table-deal-record">
									<colgroup>
										<col class="col-buyer">
										<col class="col-goods">
										<col class="col-amount">
										<col class="col-chargetime">
									</colgroup>
									<tbody>
										<tr>
											<th class="th-buyer">买家</th>
											<th class="th-goods">产品</th>
											<th class="th-quantity">数量</th>
											<th class="th-dealtime">成交时间</th>
										</tr>
										<c:forEach var="item" items="${history }">
											<tr>
												<td class="cell-align-l buyer">${item.userName }</td>
												<td class="cell-align-l style">${item.name }</td>
												<td class="quantity">${item.productCount }</td>
												<td class="dealtime">
													<p class="date">${item.createTime }</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<!-- 成交记录显示
									<div class="color">
									<p>Color</p>
									<span>Blue, Black, Red</span>
									<div class="clearfix"></div>
								</div>
								<div class="color">
									<p>Size</p>
									<span>S, M, L, XL</span>
									<div class="clearfix"></div>
								</div>
 -->
							</div>
						</div>
						<div data-content="television" class="unselected">
							<c:import url="comment/product?productId=${product.id }"></c:import>
						</div>
						<div class="clearfix"></div>
						</ul>
					</div>
				</div>

				<div class=" bottom-product">
					<c:forEach var="product" items="${relate }">
						<div class="col-md-4 bottom-cd simpleCart_shelfItem">
							<div class="product-at ">
								<a target="_blank" href="product/product?id=${product.id}"><img
									class="img-responsive" src="${product.defaultPicturePath}"
									alt="">
									<div class="pro-grid">
										<span class="buy-in">宝贝详情</span>
									</div> </a>
							</div>
							<p class="tun">
								<a target="_blank" href="product/product?id=${product.id}">${product.shortDescription }
								</a>
							</p>
							<a href="#" class="item_add" product-id="${product.id}"><p
									class="number item_price">
									<i> </i>¥ ${product.standardPrice}
								</p></a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-3 product-price">

				<!---->
				<div class="product-bottom">
					<div class="of-left-in">
						<h3 class="best">推荐商品</h3>
					</div>

					<c:forEach var="product" items="${suggest }">
						<div class="product-go">
							<div class=" fashion-grid">
								<a target="_blank" href="product/product?id=${product.id}"><img
									class="img-responsive " src="${product.defaultPicturePath}"
									alt=""></a>

							</div>
							<div class=" fashion-grid1">
								<h6 class="best2">
									<a target="_blank" href="product/product?id=${product.id}">${product.shortDescription }
									</a>
								</h6>

								<span class=" price-in1"> ¥ ${product.standardPrice}</span>
							</div>

							<div class="clearfix"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>