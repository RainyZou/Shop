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
<title>购物车列表</title>
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
	function goOrder(){
		var nologin = '<%=session.getAttribute("user") == null%>';
		if(nologin == "true"){
			alert("请登录后结算");	
		}else{
			location.href = "order/preView";
		}
	}
	
	function decrement(cartId,productId){
		var count = $("#count"+productId).val();
		var newCount =  parseInt(count)-1;
		updateCount(newCount,cartId,productId);
			
	}
	
	function increment(cartId,productId){
		var count = $("#count"+productId).val();
		var newCount =  parseInt(count)+1;
		updateCount(newCount,cartId,productId);
	}
	
	function updateCount(newCount,cartId,productId){
		if(newCount < 1){
			alert("亲,我不能再瘦了！");
			return;
		}
		var nologin = '<%=session.getAttribute("user") == null%>';
		if(nologin == "true"){
			var storage = window.localStorage;
			var tempProductId = "THX"+productId;
			for (var i = 0, len = storage.length; i < len; i++) {
				var key = storage.key(i);
				if (tempProductId == key) {
					var value = storage.getItem(key);
					localStorage.setItem(tempProductId, newCount);
					cartList();
					break;
				}
			}
		}else{
			$.ajax({
				url : "cart/update",
				type : 'post',
				dataType : 'text',
				data:{count:newCount,
					  id:cartId},
				success : function(data) {
					cartList();
				},
				error : function() {
					alert("网络异常，请稍后再试。")	
				}
			});
		}
			
	}
	function favorite_add(productId) {
		$.ajax({
			url : "favorites/add?productId=" + productId,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				if (data.code == 1) {
					alert("添加收藏成功!");
				} else {
					alert(data.message);
				}
			}
		});
	}
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>


</head>
<body>
	<c:import url="header"></c:import>
	<div class="container">
		<div class="check">
			<h1>
				购物车 (<span id="cartNum2">${count}</span>)
			</h1>
			<div class="col-md-9 cart-items">

				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						var cartId = $(this).attr("id");
						$.ajax({
		                    url: "cart/delete",
		                    type: "post",
		                    data: {
		                    	id:cartId
		                    },
		                    error: function (data) {
		                        alert("删除失败，请稍后再试");
		                    },
		                    success: function (data) {
		                    	alert(data.message);
/* 		                    	$('#cart'+cartId).fadeOut('slow', function(c){
									$('#cart'+cartId).remove();
								}); */
		                    	cartList();
		                    }
		                });
						});	  
					});
			   </script>
				<c:forEach var="item" items="${cartsVO }">
					<div class="cart-header" id="cart${item.cart.id }">
						<div class="close1" id="${item.cart.id}"></div>
						<div class="cart-sec simpleCart_shelfItem">
							<div class="cart-item cyc">
								<a target="_blank" href="product/product?id=${item.product.id}"><img
									src="${item.product.defaultPicturePath}" class="img-responsive"
									alt="" /></a>
							</div>
							<div class="cart-item-info">
								<h3>
									<a target="_blank" href="product/product?id=${item.product.id}">${item.product.name}</a><span>商品号码:
										3578</span>
								</h3>
								<ul class="qty">
									<li><p>大小 : 5</p></li>
									<li><p>
											数量 : <a id="" class="decrement "
												href="javascript:decrement(${item.cart.id},${item.cart.productId});">-</a>
											<input type="text" id="count${item.cart.productId}"
												value="${item.cart.productCount}" class="itxt"> <a
												id="" class="increment"
												href="javascript:increment(${item.cart.id},${item.cart.productId});">+</a>
										</p></li>

								</ul>

								<div class="delivery">
									<p style="color: red">折扣价 :
										${item.product.currentPrice}&nbsp;&nbsp;&nbsp;&nbsp;</p>

									<p>
										原价 : <strike>${item.product.standardPrice}<strike>
									</p>
									<span> <a href="#"
										onclick="favorite_add(${item.product.id});return false;">移入收藏夹</a>
									</span>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="clearfix"></div>

						</div>
					</div>
				</c:forEach>


			</div>
			<div class="col-md-3 cart-total">
				<a class="continue" href="">继续购物</a>
				<div class="price-details">
					<h3>价格预览</h3>
					<span>总价</span> <span class="total1">${standardAll }</span> <span>折扣</span>
					<span class="total1">${cutAll }</span> <span>运费</span> <span
						class="total1">0.00</span>
					<div class="clearfix"></div>
				</div>
				<ul class="total_price">
					<li class="last_price">
						<h4>总计</h4>
					</li>
					<li class="last_price"><span>${all }</span></li>
					<div class="clearfix"></div>
				</ul>


				<div class="clearfix"></div>
				<a class="order" href="javascript:goOrder()">去结算</a>
				<div class="total-item">
					<h3>优惠券</h3>
					<h4>优惠券</h4>
					<a class="cpns" href="#">使用优惠券</a>
					<p>
						<a href="#">登陆</a> 登陆以后查看您的优惠卷
					</p>
				</div>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>