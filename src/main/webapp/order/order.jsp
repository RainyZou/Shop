<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>Products</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/order.css" type="text/css"
	charset="utf-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
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
<script>
	function selectAddress(){
		var id = $("input[type='radio']:checked").attr("id");	
		$(".J_Addr").each(function(){
			$(this).removeClass("selected");
		});
		$("#select"+id).addClass("selected");
	}
	
	function submitOrder(){
		$("#addOrder").submit();	
	}
</script>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--content-->
	<div id="holyshit10" class="J_Page confirm-order"
		style="min-height: 600px">
		<form name="addOrder" id="addOrder" action="order/submit" method="post">
		<div class="buy-content ">
			<div id="holyshit11" class="stepbar">
				<div id="holyshit12" class="address">
						<h4>
							确认收货地址 <span class="manage-address"> <a
								href="user/address/list" target="_blank" title="管理我的收货地址"
								class="J_MakePoint">管理收货地址</a>
							</span>
						</h4>
						<hr>
						<ul id="address-list" class="address-list">
							<c:forEach var="address" items="${preVO.addresses }">
								<c:choose>
									<c:when test="${address.isDefault =='on' }">
										<li class="J_Addr J_MakePoint clearfix J_DefaultAddr selected " id="select${address.id }">
									</c:when>
									<c:otherwise>
										<li class="J_Addr J_MakePoint clearfix " id="select${address.id }">
									</c:otherwise>
								</c:choose>
								<i class="J_Marker marker iconfont icon-dituzuobiao"></i>
								<span class="marker-tip">寄送至</span>
								<div class="address-info">
									<a href="user/address/edit?addressId=${address.id }" target="_blank" class="J_Modify modify">修改本地址</a>
									<c:choose>
									<c:when test="${address.isDefault =='on' }">
										<input name="address" class="J_MakePoint" id="${address.id }" value="${address.id }" checked="checked" type="radio" onclick="selectAddress()">
									</c:when>
									<c:otherwise>
										<input name="address" class="J_MakePoint" id="${address.id }" value="${address.id }" type="radio" onclick="selectAddress()">
									</c:otherwise>
								</c:choose>
									<label for="addrId_5715360998" class="user-address">
										${address.addressSheng }${address.addressShi }${address.addressXian }${address.addressZhen }${address.addressDetail } (
										${address.name } 收) <em>${address.phone }</em>
									</label> 
									<c:if test="${address.isDefault =='on' }">
										<em class="tip ">默认地址</em> 
									</c:if>
								</div>
								</li>
							</c:forEach>
						</ul>

						<div class="address-bar">
							<a id="J_OtherAddressLink" class="edit J_MakePoint otherlink"
								href="user/address/add" target="_blank">增加新地址</a>
						</div>
				</div>
			</div>

			<!-- 需要改动-->
			<div class="buy-order-field ">
				<h4>确认订单信息</h4>
				<hr>
				<div class="buy-th-line clearfix">
					<span class="buy-th-title">店铺宝贝</span> <span class="buy-th-price">单价(元)</span>
					<span class="buy-th-quantity">数量</span> <span class="buy-th-promo">优惠方式(元)</span>
					<span class="buy-th-total">小计(元)</span>
				</div>


				<div class="order">
					<c:forEach var="vo" items="${preVO.cartVOs }">
					<input name="productIds" value="${vo.product.id }" type="hidden">
					<input name="cartIds" value="${vo.cart.id }" type="hidden">
					<div class="orderInfo blue-line"></div>
						
					<div class="item clearfix">
						<div  class="itemInfo item-title">
							<a target="_blank" href="" title="${vo.product.name }" class="itemInfo-link J_MakePoint"> 
							<span class="item-pic"> <span> <img class="itemInfo-pic" src="${vo.product.defaultPicturePath}"></span></span> 
							<span class="itemInfo-title J_MakePoint">${vo.product.name }</span>
							</a>
							<div class="itemInfo-sku">

								<span>分类:海鱼类 ${vo.product.name }</span> <span>尺寸:大</span> <span> </span>
							</div>

							<p class="c2c-extraInfo-container promo-extraInfo"></p>
						</div>
						<div class="item-price">
							<span class="itemInfo price"> <em
								class="style-normal-small-black J_ItemPrice">${vo.product.standardPrice}</em>
							</span>
						</div>
						<div class="quantity item-quantity">
							<p>${vo.cart.productCount}</p>
						</div>

						<div class="promotion item-promo">
							<div class="promotion-title">商品优惠：</div>

							<div class="promotion-sel">
								<div class="promotion-content-box">
									<select class="promotion-content J_PromotionContent">
										<option value="0">折扣： -
										<fmt:formatNumber value="${(vo.product.standardPrice - vo.product.currentPrice)*vo.cart.productCount}" pattern="#,#0.0"/>
										</option>

									</select>
								</div>
							</div>
						</div>
						<div class="itemPay item-total">
							<p class="itemPay-price price">
								<em class="style-normal-bold-red J_ItemTotal ">${vo.product.currentPrice*vo.cart.productCount}</em>

							</p>
						</div>
					</div>
					</c:forEach>
					
				</div>

				<div class="orderPay blue-line">
					<p>
						店铺合计(含运费)： <span class="price g_price "><span>&#165;</span><em
							class="style-middle-bold-red J_ShopTotal">${all }</em> </span>
					</p>
				</div>
				
				<br>
				<div class="buy-order-field ">
				<h4>给商家留言</h4>
				<hr>
				<textarea rows="3" cols="70" id="comment" name="comment"></textarea>
			</div>
			<br></br>
				
				
				<div class="order-go clearfix">
					<div class="address-confirm clearfix">
						<div class="box">
							<div id="holyshit33" class="realPay">
								<em class="t">实付款：</em> <span class="price g_price "> <span>&#165;</span>
									<em class="style-large-bold-red " id="J_ActualFee">${all }</em>
								</span>
							</div>
							<c:forEach var="address" items="${preVO.addresses }">
								<c:if test="${address.isDefault =='on' }">
									<div id="holyshit34" class="address">
								<div id="J_AddrBottomConfirm"></div>
								<p class="buy-footer-address">
									<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
										class="buy-footer-address-detail J_BuyFooterAddressDetail" id="confirmAddress">
										${address.addressSheng }${address.addressShi }${address.addressXian }${address.addressZhen }${address.addressDetail } </span>
								</p>
								<p class="buy-footer-address">
									<span class="buy-line-title">收货人：</span> <span
										class="buy-footer-address-detail J_BuyFooterAddressRec">
										${address.name }${address.phone } </span>
								</p>
							</div>
								</c:if>
							</c:forEach>
							

							<div id="holyshit35" class="submitOrder">
								<div class="go-btn-wrap">

									<a id="J_Go" href="javascript:submitOrder();" class="btn-go  "
										tabindex="0" title="点击此按钮，提交订单">提交订单</a>
								</div>

								<div class="msg hidden" id="J_GlobalErr">
									<p class="error"></p>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>

	<!--//content-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>