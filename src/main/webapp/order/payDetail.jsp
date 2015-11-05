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
<title>订单支付</title>
<base href="<%=basePath%>">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
<!--theme-style-->
<link href="css/payDetail.css" rel="stylesheet" media="all">
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


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--content-->
	<div class="wrap">
	<div>
	<br>
	<p>请您及时付款，以便订单尽快处理！ 订单号：10431638929</p>	
	<p>应付金额：888元</p>
	<p>收货地址：广东珠海市香洲区城区锦柠路388号锦绣柠溪4栋2单元701 收货人：蒋风浪 159****2900</p>
	<p>商品名称：鲍鱼干货5KG </p>
	</div>
		<form class="form-horizontal pay_form" onsubmit="return false;">
			<div class="form-horizontal pay_form">
				<div class="zhuanzhang_tag" id="bank_list">
					<ul id="zhuanzhangTag">
						<li class="cur" title="ONLINE_BANK|DC">快捷支付</li>
					</ul>
				</div>
				<div id="zhuanzhangCon">

					<dl class="recharge_form pay_info_dl" style="display: block;">
						<dd class="clearfix">
							<ul class="icons_list">
								<li><input class="ie6_radio" id="bankICBC" title="ICBC"
									name="instId" value="1" type="radio" checked> <label
									class="icon_boxBig" for="bankICBC"> 
									<img alt="货到付款" src="images/hdfk.jpg">
								</label></li>
								<li><input class="ie6_radio" id="bankICBC" title="ICBC"
									name="instId" value="1" type="radio" disabled="disabled"> <label
									class="icon_boxBig" for="bankICBC"> 
									<img alt="支付宝" src="images/icon_r_zfb.png">
								</label></li>
								<li><input class="ie6_radio" id="bankABC" title="ABC"
									name="instId" value="2" type="radio" disabled="disabled"> <label
									class="icon_boxBig" for="bankABC"> 
									<img alt="微信" src="images/icon_r_wxzf.png">
								</label></li>
								<li><input class="ie6_radio" id="bankBOC" title="BOC"
									name="instId" value="3" type="radio" disabled="disabled"> <label
									class="icon_boxBig"> 
									<img alt="快钱" src="images/icon_r_kq.png">
								</label></li>
							</ul>
						</dd>
					</dl>

				</div>
			</div>
			<div class="form-horizontal pay_form">
				<div class="zhuanzhang_tag" id="bank_list">
					<ul id="zhuanzhangTag">
						<li class="cur" title="ONLINE_BANK|DC">储蓄卡(即将上线)</li>
					</ul>
				</div>
				<div id="zhuanzhangCon">

					<dl class="recharge_form pay_info_dl" style="display: block;">
						<dd class="clearfix">
							<ul class="icons_list">
								<li><input class="ie6_radio" id="bankICBC" title="ICBC"
									name="instId" value="1" type="radio"> <label
									class="icon_box" for="bankICBC"> 
									<img alt="中国工商银行" src="images/r_bank_gs.png">
								</label></li>
								<li><input class="ie6_radio" id="bankABC" title="ABC"
									name="instId" value="2" type="radio"> <label
									class="icon_box" for="bankABC"> 
									<img alt="中国农业银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankBOC" title="BOC"
									name="instId" value="3" type="radio"> <label
									class="icon_box" for="bankBOC">
										<img alt="中国银行" src="images/r_bank_gs.png">
								</label></li>
								<li><input class="ie6_radio" id="bankCCB" title="CCB"
									name="instId" value="4" type="radio"> <label
									class="icon_box" for="bankCCB"> 
										<img alt="中国建设银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankCOMM" title="COMM"
									name="instId" value="5" type="radio"> <label
									class="icon_box" for="bankCOMM"> 
										<img alt="交通银行" src="images/r_bank_gs.png">
								</label></li>
								<li><input class="ie6_radio" id="bankCMB" title="CMB"
									name="instId" value="6" type="radio"> <label
									class="icon_box" for="bankCMB"> 
										<img alt="招商银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankCEB" title="CEB"
									name="instId" value="7" type="radio"> <label
									class="icon_box" for="bankCEB"> 
										<img alt="中国光大银行" src="images/r_bank_gs.png">
								</label></li>
								
								<li><input class="ie6_radio" id="bankGDB" title="GDB"
									name="instId" value="12" type="radio"> <label
									class="icon_box" for="bankGDB"> 
										<img alt="广发银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankPSBC" title="PSBC"
									name="instId" value="13" type="radio"> <label
									class="icon_box" for="bankPSBC"> 
										<img alt="中国邮政储蓄银行" src="images/r_bank_gs.png">
								</label></li>
								<li><input class="ie6_radio" id="bankGDB" title="GDB"
									name="instId" value="12" type="radio"> <label
									class="icon_box" for="bankGDB"> 
										<img alt="广发银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankPSBC" title="PSBC"
									name="instId" value="13" type="radio"> <label
									class="icon_box" for="bankPSBC"> 
										<img alt="中国邮政储蓄银行" src="images/r_bank_gs.png">
								</label></li>
								<li><input class="ie6_radio" id="bankGDB" title="GDB"
									name="instId" value="12" type="radio"> <label
									class="icon_box" for="bankGDB"> 
										<img alt="广发银行" src="images/r_bank_ny.png">
								</label></li>
								<li><input class="ie6_radio" id="bankPSBC" title="PSBC"
									name="instId" value="13" type="radio"> <label
									class="icon_box" for="bankPSBC"> 
										<img alt="中国邮政储蓄银行" src="images/r_bank_gs.png">
								</label></li>
							</ul>
						</dd>
					</dl>

				</div>
			</div>
			<div>
				<input id="paySubmit" class="ui-button-XL"  type="submit" onclick="combinSubmitPay()" value="立即支付">
			</div>
			<br>
		</form>
	</div>

	<!--//content-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>