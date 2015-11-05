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
<title>个人中心-订单管理</title>
<base href="<%=basePath%>">

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
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
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
				<h4>订单管理</h4>
				<hr>
				<div>
					<div>
						<b>订单号：</b>${vo.order.orderId } <b>状态：</b>${vo.order.orderStatus }
					</div>
					<div class="text-right">
						<button class="btn btn-default">评论</button>
					</div>
				</div>
				<div>
					<p>如果没有收到货，或收到货后出现问题</p>
					<p>淘海鲜平台不会以订单异常、系统升级为由，要求您点击任何网址链接进行退款操作</p>
					<p>
						如果您有任何问题，请联系我们的客服人员 <a target="_blank"
							href="http://wpa.qq.com/msgrd?v=3&uin=446478857&site=qq&menu=yes"><img
							border="0" src="http://wpa.qq.com/pa?p=2:446478857:51" alt="联系客服"
							title="联系客服" />联系我们</a>
					</p>
				</div>
				<p>
					<br> <br>
				</p>
				<h4>物流信息</h4>
				<hr>
				<div>
					<div>
						<b>发货方式：</b>快递
					</div>
					<div>
						<b>物流公司：</b>${express.name }
					</div>
					<div>
						<b>运单号码：</b>${express.order }
					</div>
					<ol id="J_ExList">
					<c:choose>
						<c:when test="${fn:length(express.data) >0 }">
							<br>
							<c:forEach var="item" items="${express.data }">
								<li class="">${item.time }&nbsp;${item.content }&nbsp;</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li class="">暂时未查到该快递的运输信息</li>		
						</c:otherwise>
					</c:choose>
					</ol>


					<p>
						<br> <br>
					</p>
					<h4>订单信息</h4>
					<hr>
					<div>
						<div>
							<b>收&nbsp;货&nbsp;人：</b>${vo.address.name }
						</div>
						<div>
							<b>地&nbsp;&nbsp;&nbsp;&nbsp;址：</b>${vo.address.addressSheng }${vo.address.addressShi }${vo.address.addressXian }
							${vo.address.addressZhen }${vo.address.addressDetail }
						</div>
						<div>
							<b>手机号码：</b>${vo.address.phone }
						</div>
						<div>
							<b>创建时间：</b>${vo.order.createTime }
						</div>
						<div>
							<b>付款时间：</b>${vo.order.payTime }
						</div>
						<div>
							<b>发货时间：</b>${vo.order.deliverTime }
						</div>
						<div>
							<b>商品清单：</b>
						</div>
						<table class="table table-bordered table-hover text-center"
							style="text-align: center">
							<thead>
								<tr class="info">
									<th width="10%">编号</th>
									<th width="15%">图片</th>
									<th width="45%">名称</th>
									<th width="10%">价格</th>
									<th width="10%">数量</th>
									<th width="10%">优惠</th>
								</tr>
							</thead>
							<tbody id="">
								<c:forEach var="item" items="${vo.order.details }">
									<tr>
										<td>${item.product.id }</td>
										<td><a target="_blank"
											href="http://localhost:8080/Shop/product/product?id=${item.product.id }">
												<img width="60" height="60" title=""
												src="${item.product.defaultPicturePath }" class="">
										</a></td>
										<td><a target="_blank"
											href="http://localhost:8080/Shop/product/product?id=${item.product.id }">${item.product.name }</a></td>
										<td>${item.product.standardPrice }</td>
										<td>x${item.productCount }</td>
										<td>-${item.product.standardPrice - item.product.currentPrice }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							订单总金额：<strong style="color: red">${vo.order.allPrice }</strong>元
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!--//content-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>