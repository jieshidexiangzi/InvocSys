<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
${msg }
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
			<h1>添加销售</h1>
			<form action="${pageContext.request.contextPath }/sale/add.html" method="post">
				商品名称：<select name="productId">
					    <option value="">--请选择商品--</option>
					    <c:forEach items="${plist }" var="pro">
					    	<option value="${pro.id }">${pro.productName }</option>
					    </c:forEach>
						
					</select><br>
				销售单价：<input type="text" name="price"/><br>
				销售数量：<input type="text" name="quantity"/><br>
				<input type="submit" value="保存"/>
			</form>
		</div>
	</div>
</body>
</html>