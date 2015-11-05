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
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>

<style>
.t1 {
	text-align: center;
	vertical-align: center;
	color: #666;
	background-color: #EFEFEF;
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
}

.t2 {
	resize: none;
	display: block;
	outline: 0px none;
	overflow: auto;
	padding: 0px;
	margin: 0px;
	width: 100%;
	border-top: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-right: 1px solid lightgray;
	/* 	#E7E7E7; */
}

.t3 {
	height: 90px;
}

.t4 {
	border-top: 1px solid lightgray;
	height: 30px;
	line-height: 30px;
}

.t5 {
	line-height: 80px;
}
</style>
<script>
function selectStar(id, count){
	var i = 1;
	for(; i <= 5; i++){
		document.getElementById(id + '_star' + i).setAttribute('class', 'glyphicon glyphicon-star-empty');
	}
	i = 1;
	for(; i <= count; i++){
		document.getElementById(id + '_star' + i).setAttribute('class', 'glyphicon glyphicon-star');
	}
	document.getElementById("stars_" + id).setAttribute('value', count);
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!--content-->

	<div class="product">
		<div class="container">
			<c:forEach var="pc" items="${productComments}">
				<c:choose>
					<c:when test="${pc.comment == null}">
						<form action="comment/add">
							<input type="hidden" name="orderId" value="${orderId }" /> <input
								type="hidden" name="productId" value="${pc.product.id }" /> <input
								type="hidden" name="stars" id="stars_${pc.product.id }" />
							<div style="float: left; padding: 0 20px 0 0;">
								<a target="_blank" href="product/product?id=${pc.product.id}"><img
									width="120" height="120" class="img-responsive "
									src="${pc.product.defaultPicturePath}" alt=""></a>
							</div>
							<div class="row">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-2 t1 t4">星级评价</div>
										<div class="col-md-10 star">
											<a href=""
												onclick="selectStar(${pc.product.id}, 1);return false;"><span
												id="${pc.product.id}_star1"
												class="glyphicon glyphicon-star-empty"></span></a> <a href=""
												onclick="selectStar(${pc.product.id}, 2);return false;"><span
												id="${pc.product.id}_star2"
												class="glyphicon glyphicon-star-empty"></span></a> <a href=""
												onclick="selectStar(${pc.product.id}, 3);return false;"><span
												id="${pc.product.id}_star3"
												class="glyphicon glyphicon-star-empty"></span></a> <a href=""
												onclick="selectStar(${pc.product.id}, 4);return false;"><span
												id="${pc.product.id}_star4"
												class="glyphicon glyphicon-star-empty"></span></a> <a href=""
												onclick="selectStar(${pc.product.id}, 5);return false;"><span
												id="${pc.product.id}_star5"
												class="glyphicon glyphicon-star-empty"></span></a>
											<script>
												selectStar(${pc.product.id}, 4);
											</script>
										</div>
									</div>
									<div class="row">
										<div class="col-md-2 t1 t3 t5">文字评价</div>
										<div class="col-md-10">
											<textarea class="t2 t3" name="commentText">${pc.comment.commentText}</textarea>
										</div>
									</div>
								</div>
								<div class="col-md-2">
									<input type="submit" value="提交" />
								</div>
							</div>
							<div class="clearfix"></div>
							<br />
						</form>
					</c:when>

					<c:otherwise>
						<div style="float: left; padding: 0 20px 0 0;">
							<a target="_blank" href="product/product?id=${pc.product.id}"><img
								width="120" height="120" class="img-responsive "
								src="${pc.product.defaultPicturePath}" alt=""></a>
						</div>
						<div class="row">
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-2 t1 t4">星级评价</div>
									<div class="col-md-10 star">
										<a><span id="${pc.product.id}_star1"
											class="glyphicon glyphicon-star-empty"></span></a> <a><span
											id="${pc.product.id}_star2"
											class="glyphicon glyphicon-star-empty"></span></a> <a><span
											id="${pc.product.id}_star3"
											class="glyphicon glyphicon-star-empty"></span></a> <a><span
											id="${pc.product.id}_star4"
											class="glyphicon glyphicon-star-empty"></span></a> <a><span
											id="${pc.product.id}_star5"
											class="glyphicon glyphicon-star-empty"></span></a>
									</div>
								</div>
								<script>
									selectStar(${pc.product.id}, ${pc.comment.stars});
								</script>
								<div class="row">
									<div class="col-md-2 t1 t3 t5">文字评价</div>
									<div class="col-md-10">
										${pc.comment.commentText}
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<br />
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<!--//content-->

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>