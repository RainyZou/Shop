<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>个人中心-订单管理 </title>
<base href="<%=basePath%>">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/orderManager.css" rel="stylesheet" type="text/css"
	media="all" />
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
	function cancelOrder(orderId) {
		var se = confirm("确定要取消订单吗?");
		if (se == true) {
			location.href = "order/cancel?orderId=" + orderId;
		}
	}
	
	function restoreOrder(orderId){
		var se = confirm("确定要恢复订单吗?");
		if (se == true) {
			location.href = "order/restore?orderId=" + orderId;
		}	
	}
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
	<c:import url="../header"></c:import>
	<!--content-->

	<div class="product">
		<div class="container">
			<div class="col-md-3 product-price">
				<jsp:include page="../personal_aside.jsp"></jsp:include>
			</div>
			
			<div class="col-md-9 product-price1">
			<h3 >
			<c:if test="${param.searchType == 'ALL' }">
				全部订单
			</c:if>
			<c:if test="${param.searchType == 'PAY' }">
				待付款订单
			</c:if>
			<c:if test="${param.searchType == 'SHIP' }">
				待发货订单
			</c:if>
			<c:if test="${param.searchType == 'RECEIVE' }">
				待收货订单
			</c:if>
			<c:if test="${param.searchType == 'EVALUACTION' }">
				待评价订单
			</c:if>
			<c:if test="${param.searchType == 'CANCEL' }">
				被取消订单
			</c:if>
			</h3>
			<hr>
				<div id="order02" class="mod-main mod-comm lefta-box mc">
					<table class="td-void order-tb">
						<thead>
							<tr>
								<th>订单详情</th>
								<th>收货人</th>
								<th>总计</th>
								<th>全部状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:forEach var="vo" items="${vos }">
							<tbody>

								<tr class="sep-row">
									<td colspan="5"></td>
								</tr>
								<tr class="tr-th">
									<td colspan="5"><span class="gap"></span> <span
										title="${vo.order.createTime }" class="dealtime">${vo.order.createTime }</span>
										<span class="number">订单号： <a href="#" target="_blank"
											id="" name="orderIdLinks">${vo.order.orderId }</a>
									</span></td>
								</tr>
								<c:forEach var="detail" items="${vo.order.details }"
									varStatus="status">
									<c:if test="${status.isFirst() }">
										<tr id="track9504327731" class="tr-bd">
											<td>
												<div class="goods-item p-862253">
													<div class="p-img">
														<a target="_blank"
															href="http://localhost:8080/Shop/product/product?id=${detail.product.id }">
															<img width="60" height="60"
															title="${detail.product.name }"
															src="${detail.product.defaultPicturePath}"
															class="">
														</a>
													</div>
													<div class="p-msg">
														<div class="p-name">
															<a title="${detail.product.name }" target="_blank"
																class="a-link"
																href="http://localhost:8080/Shop/product/product?id=${detail.product.id }">${detail.product.name }</a>
														</div>
													</div>
												</div>
												<div class="goods-number">x${detail.productCount }</div>
												<div class="clr"></div>
											</td>

											<td rowspan="${fn:length(vo.order.details)}"><span
												class="txt">${vo.address.name}</span></td>
											<td rowspan="${fn:length(vo.order.details)}">
												<div class="amount">
													<strong>¥${vo.order.allPrice}</strong> <br> <span
														class="ftx-13">${vo.order.payStatus}</span><br> <span
														class="ftx-13">${vo.order.payStyle}</span><br>
												</div>
											</td>
											<td rowspan="${fn:length(vo.order.details)}">
												<div class="status">
													<span class="order-status ftx-03">
														${vo.order.orderStatus} </span> <br> <a
														href="order/detail?orderId=${vo.order.id}">订单详情</a>
												</div>
											</td>
											<td id="operate9504327731"
												rowspan="${fn:length(vo.order.details)}">
												<div class="operate">
													<div id="pay-button-9504327731"></div>
													<c:if test="${vo.order.payStatus == '未支付'}">
														<a target="_blank" class="btn-again"
															href="javascript:void(0)"><b></b>立即付款</a>
														<br>
														<c:choose>
															<c:when test="${vo.order.orderStatus == '取消'}">
																<a class="btn-again" href="javascript:restoreOrder(${vo.order.id})"><b></b>恢复订单</a>
															</c:when>
															<c:otherwise>
																<a class="btn-again" href="javascript:cancelOrder(${vo.order.id})"><b></b>取消订单</a>
															</c:otherwise>
														</c:choose>
														<br>
													</c:if>
													<c:import url="../comment/status?orderId=${vo.order.id}"></c:import>
													<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=446478857&site=qq&menu=yes">
														<img border="0" src="http://wpa.qq.com/pa?p=2:446478857:51" alt="联系客服" title="联系客服"/>
													</a>
												</div>
											</td>
										</tr>
									</c:if>
									
									<c:if test="${status.isFirst() == false }">
										<tr id="track9504327731" class="tr-bd">
											<td>
												<div class="goods-item p-1089807">
													<div class="p-img">
														<a target="_blank"
															href="http://localhost:8080/Shop/product/product?id=${detail.product.id }">
															<img width="60" height="60"
															title="${detail.product.name }"
															src="${detail.product.defaultPicturePath}"
															class="">
														</a>
													</div>
													<div class="p-msg">
														<div class="p-name">
															<a title="${detail.product.name }" target="_blank"
																href="http://localhost:8080/Shop/product/product?id=${detail.product.id }">${detail.product.name }</a>
														</div>
													</div>
												</div>
												<div class="goods-number">x${detail.productCount }</div>
												<div class="clr"></div>
											</td>
										</tr>
									</c:if>

								</c:forEach>
							</tbody>
						</c:forEach>

					</table>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>

	<!--//content-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>