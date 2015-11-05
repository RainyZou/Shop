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
<title>Products</title>
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
<link rel="stylesheet" href="css/pagination.css" />
<script type="text/javascript" src="js/jquery.pagination.js"></script>

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
					alert(data.count);
					setCartNumber(data.count);
				},
				error : function() {
					setLocalCart(productId);
				}
			});
		});
	});
	function pageselectCallback(page_id, jq) {
		TranUrl(page_id);
		return false;
	}
	function TranUrl(page_id) {
		var url = location.href;
		var star;
		if (url.indexOf("?") > 0) {
			if (url.indexOf("&page=") > 0) {
				star = url.indexOf("&page=");
				url = url.substring(0, star);
				location.href = url + "&page=" + page_id;
			} else if(url.indexOf("?page=") > 0){
				star = url.indexOf("?page=");
				url = url.substring(0, star);
				location.href = url + "?page=" + page_id;
			}else {
			
				location.href = url + "&page=" + page_id;
			}
		} else {
			location.href = url + "?page=" + page_id;
		}
	}
	$(function() {

		$("#Pagination").pagination('${pcount}', {
			callback : pageselectCallback,//PageCallback() 为翻页调用次函数。
			prev_text : " 上一页",
			next_text : "下一页 ",
			items_per_page : '${pagesize}', //每页的数据个数
			num_display_entries : 3, //两侧首尾分页条目数
			current_page : '${page}', //当前页码
			num_edge_entries : 2
		//连续分页主体部分分页条目数
		});
	});
</script>
<script src="js/main.js"></script>

</head>
<body>
	<c:import url="header"></c:import>
	<!--content-->

	<!--content-->
	<!---->
	<div class="product">
		<div class="container">
			<div class="col-md-3 product-price">

				<div class=" rsidebar span_1_of_left">
					<div class="of-left">
						<h3 class="cate">商品类别</h3>
					</div>
					<ul class="menu">
						<c:forEach var="category" items="${rootCategory.children }"
							varStatus="status">
							<li class="item${status.index+1}"><a
								href="product/productList?id=${category.id}">${category.cname}
							</a> <c:if test="${fn:length(category.children) > 0 }">
									<ul class="cute">
										<c:forEach var="node" items="${category.children }"
											varStatus="status2">
											<li class="subitem${status2.index+1 }"><a
												href="product/productList?id=${node.id}">${node.cname} </a></li>
										</c:forEach>
									</ul>
								</c:if></li>
						</c:forEach>
					</ul>

				</div>
				<!--initiate accordion-->
				<script type="text/javascript">
					$(function() {
						var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');
						menu_ul.hide();
						menu_a.click(function(e) {
							e.preventDefault();
							if (!$(this).hasClass('active')) {
								menu_a.removeClass('active');
								menu_ul.filter(':visible').slideUp('normal');
								$(this).addClass('active').next().stop(true,
										true).slideDown('normal');
							} else {
								$(this).removeClass('active');
								$(this).next().stop(true, true).slideUp(
										'normal');
							}
						});

					});
				</script>

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
			<div class="col-md-9 product1">
				<c:if test="${keyword != null }">
					<div>
						<h3 class="content-head">当前展示关键字：${keyword}</h3>
					</div>
				</c:if>
				<c:if test="${categoryName != null }">
					<div>
						<h3 class="content-head">当前展示类别：${categoryName}</h3>
					</div>
				</c:if>

				<c:forEach var="i" begin="0" end="${fn:length(pList)}" step="3">
					<div class=" bottom-product">
						<c:forEach var="product" items="${pList}" begin="${i}"
							end="${i+2}">
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
									<a target="_blank" href="product/product?id=${product.id}">${product.name}</a>
								</p>
								<a href="javascript:void(0)" class="item_add"
									product-id="${product.id}"><p class="number item_price">
										<i> </i>¥ ${product.standardPrice}
									</p></a>
							</div>
						</c:forEach>
						<div class="clearfix"></div>
					</div>
				</c:forEach>
			</div>
			<div id="Pagination" class="meneame"></div>
			<div class="clearfix"></div>
		</div>

	</div>


	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>