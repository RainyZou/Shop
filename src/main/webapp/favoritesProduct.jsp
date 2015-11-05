<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="product-go">
	<div style="float:left;padding:0 20px 0 0 ;">
		<a target="_blank" href="product/product?id=${product.id}"><img width="50" height="50"
			class="img-responsive " src="${product.defaultPicturePath}"
			alt=""></a>
	</div>
	<div>
		<h4 class="best2">
			<a target="_blank" href="product/product?id=${product.id}">${product.shortDescription }
			</a>
		</h4>
		<a style="color:gray;" href="favorites/removeinlist?productId=${product.id}">取消收藏</a>
	</div>
	<div class="clearfix"></div>
</div>