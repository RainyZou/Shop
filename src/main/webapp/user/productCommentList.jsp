<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
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
<script src="js/main.js"></script>
<script src="js/simpleCart.min.js"></script>
<link href="css/alan.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
table, th, td {
	border: 1px solid rgba(51, 51, 51, 0.1);
}

td, th {
	padding: 0.4em
}
</style>
<!--content-->
<!---->
<div class="comment">
	<c:forEach var="c" items="${comments}">
		<div>
			<div class="top-comment-left" style="text-align: center; padding: 20px 0 20px 0;">
				<h3>${fn:substring(c.userName, 0, 4)}***</h3>
			</div>
			<div class="top-comment-right" style="padding: 20px 0 20px 0;">
				<h6>${c.createTime }</h6>
				<ul class="star-footer">
					<c:forEach var="i" begin="1" end="${c.stars }" step="1">
						<li><a href="#"><i> </i></a></li>
					</c:forEach>
				</ul>
				<div>${c.commentText }</div>
			</div>
		</div>
	</c:forEach>
</div>
