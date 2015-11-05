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
<title>添加商品</title>
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
	$(document)
			.ready(
					function() {
						$(".memenu").memenu();
						var detailsDiv = UE.getEditor('detailsDiv');
						var shortDescriptionDiv = UE.getEditor(
								'shortDescriptionDiv', {
									toolbars : [ [ 'bold', 'italic',
											'underline', 'fontborder',
											'backcolor', 'fontsize',
											'fontfamily', 'forecolor' ] ],
									pasteplain : true
								});
						var ueD = UE.getEditor('upImage');
						var addImage = UE.getEditor("addImage");
						detailsDiv.ready(function() {
							detailsDiv.setContent("${product.details}", false);

						});
						shortDescriptionDiv.ready(function() {
							shortDescriptionDiv.setContent(
									"${product.shortDescription}", false);
						});
						ueD.addListener('beforeInsertImage', function(t, arg) {
							$("#imageId").attr("src",
									arg[0].src.replace(/\.\.\//g, ""));
						});
						addImage
								.addListener(
										"beforeInsertImage",
										function(t, arg) {

											var imagePath = arg[0].src.replace(
													/\.\.\//g, "");
											var uuid = '' + $.uuid();

											$("ul.listimage")
													.append(
															"<li><input type='hidden' name='pictures' value='"+imagePath+"' ></input><img src='"
																	+ imagePath
																	+ "' alt='"
																	+ uuid
																	+ "' onmouseover=\"showDeleteDiv('"
																	+ uuid
																	+ "')\"; onmouseout=\"imgOnmouseout(),hideDeleteDiv('"
																	+ uuid
																	+ "');\" ></img></li>");
											$("img[alt='" + uuid + "']").each(
													setImage);
										});

					});
	function setText() {
		$('#details').val(UE.getEditor('detailsDiv').getContent());
		$('#shortDescription').val(
				UE.getEditor('shortDescriptionDiv').getContent());
		$("#defaultPicturePath").val($("#imageId").attr("src"));
	}

	function upImage() {
		var ueD = UE.getEditor('upImage');
		var myImage = ueD.getDialog("insertimage");
		myImage.open();
	}

	function addImage() {
		var ueD = UE.getEditor('addImage');
		var myImage = ueD.getDialog("insertimage");
		myImage.open();
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
						<c:when test="${not empty product.id }">更新商品</c:when>
						<c:otherwise>添加商品</c:otherwise>
					</c:choose>
				</h3>
				<form id="add_address_form" class="grid-form" method="post"
					action="product/admin/add" onsubmit="return setText();">
					<input type="hidden" name="type"  value="product" />
					<div class="col-md-7">
						<div>
							<p>商品名称</p>
							<input type="text" name="name" value="${product.name}"><label></label>
						</div>
						<div>
							<p>市场价格：</p>
							<input type="text" name="standardPrice"
								value="${product.standardPrice}"><label></label>
						</div>
						<div>
							<p>折后价格</p>
							<input type="text" name="currentPrice"
								value="${product.currentPrice}"><label></label>
						</div>
						<div>
							<p>商品类别</p>
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
					</div>
					<div class="col-md-5" align="center">
						<div style="min-height: 60px; margin: 2px;">
							<div>
								<img id="imageId" alt="" src="${product.defaultPicturePath }"
									style="width: 70%; height: 60%">
							</div>
							<div style="display: none;">
								<script id="upImage" type="text/plain"
									style="width:1px;height:1px;"></script>
							</div>

						</div>
						<div>
							<input type="hidden" name="defaultPicturePath"
								id="defaultPicturePath" /> <a href="javascript:void(0);"
								onclick="upImage();">选择封面图片</a>
						</div>
						<div class="clearfix"></div>
						<div class="flexslider" style="min-height: 60px; margin: 2px">
							<ul class="slides listimage">
								<c:forEach items="${product.pictures}" var="picture"
									varStatus="status">
									<li data-thumb="${picture.picturePath}"><input
										type="hidden" name="pictures" value="${picture.picturePath }"></input><img
										src="${picture.picturePath}" alt="${status.index }"
										onclick="previewPhoto('${status.index}');"
										onmouseover="showDeleteDiv('${status.index}');"
										onmouseout="imgOnmouseout(),hideDeleteDiv('${status.index}');"></img></li>
								</c:forEach>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div>
							<div style="display: none;">
								<script id="addImage" type="text/plain"
									style="width:1px;height:1px;"></script>
							</div>
							<a href="javascript:void(0);" onclick="addImage();">添加滚动图片</a>
						</div>

						<div class="clearfix"></div>
					</div>

					<div class="clearfix"></div>
					<div>
						<p>简要描述</p>
						<input name="shortDescription" type="hidden" id="shortDescription">
						<script id="shortDescriptionDiv" type="text/plain"
							style="width:100%;height:150px;"></script>
					</div>
					<div>
						<p>详细描述</p>
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