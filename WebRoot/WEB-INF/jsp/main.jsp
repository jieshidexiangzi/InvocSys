<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#main div.left,#main div.right{
		float: left;
	}
	.right{
		width: 600px;
		height: 500px;
		border: 2px solid blue;
	}
</style>
</head>
<body>
	<p>欢迎：${sessionScope.user.realName },<a href="javascript:void(0);" onclick="if(confirm('确定要退出系统吗?')) {window.location.href = '${pageContext.request.contextPath }/user/loginout.html';}">退出登录</a> </p>
	<div id="main">
		<div class="left">
			<p><a href="${pageContext.request.contextPath }/sale/addInput.html">销售</a></p>
			<p><a href="${pageContext.request.contextPath }/sale/saleList.html">销售信息查询</a></p>
			<p><a href="${pageContext.request.contextPath }/sale/queryInput.html">查看库存</a></p>
		</div>
		<div class="right">
			<h1>欢迎使用小型进销存系统</h1>
		</div>
	</div>
</body>
</html>