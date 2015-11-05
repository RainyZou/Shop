<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>个人中心 - 我的收藏</title>
<base href="<%=basePath%>">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
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
<link rel="stylesheet" href="css/pagination.css" />
<link rel="stylesheet" type="text/css" href="css/rainy.css">
<script type="text/javascript" src="js/jquery.pagination.js"></script>
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
			} else if (url.indexOf("?page=") > 0) {
				star = url.indexOf("?page=");
				url = url.substring(0, star);
				location.href = url + "?page=" + page_id;
			} else {

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
<script src="js/simpleCart.min.js"></script>


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
				<h1>文章</h1>
				<div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkall" /></th>
								<th>标题</th>
								<th>类别</th>
								<th>时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${pList}">
								<tr>
									<td><input type="checkbox" name="ids"
										value="${product.id }" /></td>
									<td><a href="post/admin/add?id=${product.id}">${product.name }</a></td>
									<td><c:forEach var="category"
											items="${product.categorys }" varStatus="status">
											${category.cname }
											<c:if
												test="${fn:length(product.categorys) -1 != status.index}">,</c:if>
										</c:forEach></td>

									<td>${product.datetime }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="Pagination" class="meneame"></div>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>

	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>