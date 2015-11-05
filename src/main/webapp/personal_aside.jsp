<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class=" rsidebar span_1_of_left">
	<div class="of-left">
		<h3 class="cate">个人信息</h3>
	</div>
	<ul class="menu">
		<li class="item1"><a>账户设置 </a>
			<ul class="cute">
				<li class="subitem1"><a href="user/personal">基本信息 </a></li>
				<li class="subitem2"><a href="user/changePassword">修改密码 </a></li>
<!-- 				<li class="subitem3"><a href="#">更换图像 </a></li> -->
			</ul></li>
		<li class="item2"><a>收货地址 </a>
			<ul class="cute">
				<li class="subitem1"><a href="user/address/list">地址列表 </a></li>
				<li class="subitem2"><a href="user/address/add">新增地址 </a></li>
			</ul></li>
	</ul>
</div>

<div class=" rsidebar span_1_of_left">
	<div class="of-left">
		<h3 class="cate">商品订单</h3>
	</div>
	<ul class="menu">
		<li class="item4"><a>订单管理</a>
			<ul class="cute">
				<li class="subitem1"><a href="order/manager?searchType=ALL">全部订单 </a></li>
				<li class="subitem1"><a href="order/manager?searchType=PAY">待付款订单 </a></li>
				<li class="subitem2"><a href="order/manager?searchType=SHIP">待发货订单 </a></li>
				<li class="subitem2"><a href="order/manager?searchType=RECEIVE">待收货订单 </a></li>
				<li class="subitem3"><a href="order/manager?searchType=EVALUACTION">待评价订单</a></li>
				<li class="subitem3"><a href="order/manager?searchType=CANCEL">被取消订单</a></li>
			</ul></li>
		<li class="item3"><a href="#">我的收藏</a>
			<ul class="cute">
				<li class="subitem1"><a href="favorites/list">商品收藏 </a></li>
				<li class="subitem2"><a href="#">浏览记录 </a></li>
			</ul></li>
	</ul>
</div>
