<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		if (getLocalCartCount() != 0) {
			var count = getLocalCartCount();
			setCartNumber(count);
		}
	});
	function setCartNumber(num) {
		$("#cartNum1").html(num);
	}
	
	function getLocalCartParam(){
		var param = "[";
		var storage = window.localStorage;
		for (var i = 0, len = storage.length; i < len; i++) {
			var key = storage.key(i);
			if(key.indexOf("THX") == -1){
				continue;
			}
			var item = storage.getItem(key);
			param += ("{\"productId\":" + key + ",\"count\":" + item + "},");
		}
		param += "]";
		return param;
	}
	
	function getLocalCartCount(){
		var storage = window.localStorage;
		var count = 0;
		for (var i = 0, len = storage.length; i < len; i++) {
			var key = storage.key(i);
			if(key.indexOf("THX") != -1){
				count ++;	
			}
		}	
		return count;
	}
	
	function setLocalCart(productId){
		var storage = window.localStorage;
		var bl = true;
		var tempProductId = "THX"+productId;
		for (var i = 0, len = storage.length; i < len; i++) {
			var key = storage.key(i);
			if (tempProductId == key) {
				var value = storage.getItem(key);
				localStorage.setItem(tempProductId, parseInt(value) + 1);
				bl = false;
				break;
			}
		}
		if (bl) {
			localStorage.setItem(tempProductId, 1);
		}
		var count = getLocalCartCount();
		setCartNumber(count);
	}
	
	function cartList() {
		if (getLocalCartCount() != 0) {
			var param = getLocalCartParam();
			var temp = document.createElement("form");
		    temp.action = "cart/list";
		    temp.method = "post";
		    temp.style.display = "none";
		    var opt = document.createElement("input");
	        opt.name = "param";
	        opt.value = param;
	        temp.appendChild(opt);
		    document.body.appendChild(temp);
		    temp.submit();
		} else {
			location.href = "cart/list";
		}

	}
</script>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="search">
					<form target="_blank" action="product/search" >
						<input name="keyword" type="text" value="输入关键字搜索商品" onfocus="if (this.value == '输入关键字搜索商品') {this.value = '';}"
							onblur="if (this.value == '') {this.value = '输入关键字搜索商品';}">
						<input type="submit" value="搜索">
					</form>
				</div>
				<div class="header-left">
					<ul>
						<c:choose>
							<c:when test="${user==null}">
								<li><a target="_blank" class="lock" href="user/login">登陆</a></li>
								<li><a target="_blank" class="lock" href="user/register">注册</a></li>
							</c:when>

							<c:otherwise>
								<li><a target="_blank" class="lock" href="user/personal">${user.username}</a></li>
								<li><a target="_blank" class="lock" href="user/logout">登出</a></li>
							</c:otherwise>
						</c:choose>
						<c:if test="!empty sessionScope.user">
						</c:if>
						<li></li>

					</ul>
					<div class="cart box_1">
						<a href="javascript:cartList()">
							<h3>
								<img id="toImg" src="images/cart.png" alt="" />
								<div class="total">
									购物车 <span id="cartNum1" style="color: red">${count }</span>
								</div>

							</h3>
						</a>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="logo">
					<a href="#"><img src="images/logo.png" alt=""></a>
				</div>
				<div class=" h_menu4">
					<ul class="memenu skyblue">

						<c:forEach var="node1" items="${node.children}">
							<c:choose>
								<c:when test="${fn:length(node1.children) == 0 }">
									<li class="grid"><a class="color6" href="${node1.url }">
											${node1.name }</a></li>
								</c:when>
								<c:otherwise>
									<li><a target="_blank" class="color1" href="${node1.url }">${node1.name }</a>
										<div class="mepanel">
											<div class="row">
												<fmt:formatNumber
													value="${fn:length(node1.children)/3 + 0.499 }" var="step" type="NUMBER" pattern="#0">
												</fmt:formatNumber>
												<c:forEach var="i" begin="0"
													end="${fn:length(node1.children)}" step="${step }">
													<div class="col1">
														<div class="h_nav">
															<ul>
																<c:forEach var="node2" items="${node1.children}"
																	begin="${i}" end="${i+step-1}">
																	<li><a target="_blank" href="${node2.url }">${node2.name }</a></li>
																</c:forEach>
															</ul>
														</div>
													</div>
												</c:forEach>
											</div>
										</div></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>