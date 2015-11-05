<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function favorite_add() {
		var productId = ${productId};
		$.ajax({
			url : "favorites/add?productId=" + productId,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				if (data.code == 1) {
// 					alert("添加收藏成功!");
					$("#count").html($("#count").val() + 1);
				} else {
					alert(data.message);
				}
			}
		});
	}
</script>

<ul class="tb-ul">
	<li class="tb-li"><a href="#"
		onclick="favorite_add();return false;"> <i
			class="tb-icon tb-favorite"></i> 收藏宝贝<em> (<span id="count">${count}</span>人气)</em>
	</a></li>
	<li class="tb-li"><a href="#" onclick="return false;"> <i
			class="tb-icon tb-share"></i> 分享
	</a></li>
</ul>
