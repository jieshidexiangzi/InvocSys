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
<script type="text/javascript">
	function checkPro(){
		var productId = document.getElementById("productId");
		if(productId.value == ""){
			alert("请选择商品！");
			return false;
		}
		return true;
	}
</script>
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
			<table>
				<tr>
					<td colspan="4" style="font-weight: bold;">查看库存：</td>
					<td colspan="3">
						<form action="${pageContext.request.contextPath }/sale/query.html" method="post" onsubmit="return checkPro();">
							商品名称：<select name="productId" id="productId">
							    <option value="">--请选择商品--</option>
							    <c:forEach items="${plist }" var="pro">
							    	<option value="${pro.id }" <c:if test="${pro.id == productId }">selected="selected"</c:if>>${pro.productName }</option>
							    </c:forEach>
							</select>
							<input type="submit" value="查询"/>
						</form>
					</td>
				</tr>
				<c:if test="${product != null }">
					<tr align="center">
						<td colspan="7">
							<h2>该商品的库存数量是：${product.quantity }</h2>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>