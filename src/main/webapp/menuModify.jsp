<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>菜单管理</title>
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

<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">

<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>


<script>
	$(document)
			.ready(
					function() {
						$(".memenu").memenu();
						$("#accordion").accordion({
							collapsible : true,
							heightStyle : "fill"
						});
						$("#sortable")
								.sortable(
										{
											placeholder : "ui-state-highlight",
											start : function(e, f) {
												console.log("start");
											},
											stop : function(a, c) {
												var index = $("#sortable li")
														.index($(c.item));
												var curP = c.position.left;
												var curM = parseInt($(c.item)
														.css("margin-left"));
												var fstP = parseInt($(
														"#sortable li").eq(
														index - 1).css(
														"margin-left"));

												var curI = pxToDepth(curM);
												if (curP > fstP + 30) {
													var pI = pxToDepth(fstP + 30);
													$(c.item)
															.removeClass(
																	"marginleft"
																			+ curI);
													$(c.item).addClass(
															"marginleft" + pI);
													$(c.item)
															.find(
																	"input[name='levels']")
															.val(pI);
												}

												if (curP < 0) {
													for (var i = 0; i < 100; i++) {
														if (fstP - 30 * i > 0
																&& curP < -30
																		* i) {
															if (curM - 30 >= 0) {
																var pI = pxToDepth(curM - 30);
																$(c.item)
																		.removeClass(
																				"marginleft"
																						+ curI);
																$(c.item)
																		.addClass(
																				"marginleft"
																						+ pI);
																$(c.item)
																		.find(
																				"input[name='levels']")
																		.val(pI);
															}
														} else {
															break;
														}
													}
												}
												if(curP>500 || curP<-500){
													$(c.item).remove();
												}
												console.log($(c.item).css(
														"margin-left"));
												console.log($("#sortable li")
														.eq(index - 1).css(
																"margin-left"));
											},
											change : function(a, d) {
												console.log("change");
											},
											sort : function(e, f) {
											}
										});
					});

	function pxToDepth(a) {
		return Math.floor(a / 30) + 1;
	}
	function addToMenu(table) {

		$("#" + table).find("input[name='ids']").each(function() {
			if (this.checked) {
				var name = $(this).parent().find("input[name='names']").val();
				var type = $(this).parent().find("input[name='types']").val();
				var url = $(this).parent().find("input[name='urls']").val();
				appendMenu(name, type, url);
			}
		});
	}

	function appendMenu(name, type, url) {
		var html = "<li class='marginleft1 ui-state-default'>" + name;
		html += "<input type='hidden' name='menuNames' value='"+name+"'/>";
		html += "<input type='hidden' name='types' value='"+type+"'/>";
		html += "<input type='hidden' name='urls' value='"+url+"'/>";
		html += "<input type='hidden' name='levels' value='1'/></li>";
		$("#sortable").append(html);
	}
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<script src="js/jquery.validation.min.js"></script>
<link href="css/rainy.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="address/GlobalProvinces_main.js"></script>
<script type="text/javascript" src="address/GlobalProvinces_extend.js"></script>
<script type="text/javascript" src="address/initLocation.js"></script>

<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="lang/UEditor/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="js/rainy.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-uuid.js">
	
</script>
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
				<div class="col-md-7">
					<form action="menu/list/add" method="post">
						<div>
							<input type="submit" value="保存菜单" />
						</div>
						<div>
							<ul id="sortable">
								<li class="ui-state-default" style="display: none"><input
									type="hidden" name="menuNames" /> <input type="hidden"
									name="levels" /> <input type="hidden" name="urls" /> <input
									type="hidden" name="types" />hidden</li>
								<c:forEach var="node" items="${nodes }">
									<li class="marginleft${node.level } ui-state-default">${node.name }<input
										type="hidden" name="menuNames" value="${node.name }" /> <input
										type="hidden" name="levels" value="${node.level }" /> <input
										type="hidden" name="urls" value="${node.url }" /> <input
										type="hidden" name="types" value="${node.type }" />
									</li>
								</c:forEach>
							</ul>
						</div>
					</form>
				</div>
				<div class="col-md-5">
					<div id="accordion" style="height: 800px;">
						<h3>文章</h3>
						<div>
							<div>
								<div>
									<table id="postTable" class="table table-striped">
										<thead>
											<tr>
												<th><input type="checkbox" name="checkall" /></th>
												<th>标题</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="post" items="${posts}">
												<tr>
													<td><input type="checkbox" name="ids"
														value="${post.id }" /><input type="hidden" name="urls"
														value="post/product?id=${post.id }"> <input
														type="hidden" name="names" value="${post.name }" /> <input
														type="hidden" name="types" value="${post.type }" /></td>
													<td><a href="post/admin/add?id=${post.id}">${post.name }</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div>
									<input type="button" value="添加到菜单"
										onclick="addToMenu('postTable')">
								</div>
							</div>
						</div>
						<h3>类别</h3>
						<div>
							<div>
								<div>
									<table id='categoryTable' class="table table-striped">
										<thead>
											<tr>
												<th><input type="checkbox" name="checkall" /></th>
												<th>类别名称</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="category" items="${categorys}">
												<tr>
													<td><input type="checkbox" name="ids"
														value="${category.id }" /><input type="hidden"
														name="urls" value="product/productList?id=${category.id }">
														<input type="hidden" name="names" value="${category.cname }" />
														<input type="hidden" name="types" value="category" /></td>
													<td><a href="category/admin/add?id=${category.id}">${category.cname }</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div>
									<input type="button" value="添加到菜单"
										onclick="addToMenu('categoryTable')">
								</div>
							</div>
						</div>
						<h3>商品</h3>
						<div>
							<div>
								<div>
									<table class="table table-striped">
										<thead>
											<tr>
												<th><input type="checkbox" name="checkall" /></th>
												<th>类别名称</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${products}">
												<tr>
													<td><input type="checkbox" name="ids"
														value="${product.id }" /><input type="hidden"
														name="urls" value="product/product?id=${product.id }">
														<input type="hidden" name="names" value="${product.name }" />
														<input type="hidden" name="types" value="${product.type }" /></td>
													<td><a href="product/admin/add?id=${product.id}">${product.name }</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div>
									<input type="button" value="添加到菜单" onclick="addToMenu()">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<script>
		
	</script>

	<!--//content-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>