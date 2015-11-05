<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="GlobalProvinces_main.js"></script>
<script type="text/javascript" src="GlobalProvinces_extend.js"></script>
<script type="text/javascript" src="initLocation.js"></script>
</head>
<body>

	<form action="info/type/add" method="post" id='info'
		style="margin: 0px;" target="submitObj">
		<select id="sheng" name="province">
		</select> 省 <select id="shi" name="city">
		</select> 市 <select id="xian" name="country">
		</select> 县 <select id="xiang" name="street">
		</select> 镇或街道
	</form>

	<script type="text/javascript">
		$(function() {
			initLocation({
				sheng_val : "四川",
				shi_val : "成都",
				xian_val : "<?php echo $v['country']?>",
				xiang_val : "<?php echo $v['street']?>"
			});
		})
	</script>
</body>
</html>