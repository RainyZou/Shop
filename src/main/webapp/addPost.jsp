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
<title>添加文章</title>
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
	$(document).ready(
			function() {
				$(".memenu").memenu();
				$(".memenu").memenu();
				var detailsDiv = UE.getEditor('detailsDiv');
				var shortDescriptionDiv = UE.getEditor('shortDescriptionDiv',
						{
							toolbars : [ [ 'bold', 'italic', 'underline',
									'fontborder', 'backcolor', 'fontsize',
									'fontfamily', 'forecolor' ] ],
							pasteplain : true
						});
				detailsDiv.ready(function() {
					detailsDiv.setContent("${product.details}", false);

				});
				shortDescriptionDiv.ready(function() {
					shortDescriptionDiv.setContent(
							"${product.shortDescription}", false);
				});
			});
	function setText() {
		$('#details').val(UE.getEditor('detailsDiv').getContent());
		$('#shortDescription').val(
				UE.getEditor('shortDescriptionDiv').getContent());
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
				<h3>
					<c:choose>
						<c:when test="${not empty product.id }">更新文章</c:when>
						<c:otherwise>添加文章</c:otherwise>
					</c:choose>
				</h3>
				<form id="add_address_form" class="grid-form" method="post"
					action="post/admin/add" onsubmit="return setText();">

					<input type="hidden" name="type" value="post" />

					<div>
						<p>文章标题</p>
						<input type="text" name="name" value="${product.name}"><label></label>
					</div>
					<div>
						<p>文章类别</p>
						<ul class="categorysli">
							<c:forEach var="category" items="${rootCategory.children }"
								begin="1">
								<c:set var="iscontain" value="false" />
								<c:forEach var="productCategory" items="${product.categorys }">
									<c:if test="${productCategory.id == category.id }">
										<c:set var="iscontain" value="true" />
									</c:if>
								</c:forEach>
								<li><input type="checkbox" name="categorys"
									value="${category.id }"
									<c:if test="${iscontain =='true'}">checked="checked"</c:if> />${category.cname }</li>
							</c:forEach>
						</ul>
						<div class="clearfix"></div>
						<input type="hidden" name="categorys" />
					</div>


					<div>
						<p>文章概要</p>
						<input name="shortDescription" type="hidden" id="shortDescription">
						<script id="shortDescriptionDiv" type="text/plain"
							style="width:100%;height:150px;"></script>
					</div>
					<div>
						<p>文章内容</p>
						<input name="details" type="hidden" id="details">
						<script id="detailsDiv" type="text/plain"
							style="width:100%;height:600px;"></script>
					</div>


					<div>
						<input type="hidden" name="id" value="${product.id}"> <input
							type="submit" value="添加"> <label id="message"
							class="error">${message}</label>
					</div>
				</form>
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