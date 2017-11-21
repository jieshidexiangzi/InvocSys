<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<table>
				<tr>
					<td colspan="4" style="font-weight: bold;">销售信息查询：</td>
					<td colspan="3">
						<form action="${pageContext.request.contextPath }/sale/saleList.html" method="post">
							排序方式：<select name="orderName">
								<option value="saleDate" <c:if test="${orderName=='saleDate' }">selected="selected"</c:if>>销售日期</option>
								<option value="totalPrice" <c:if test="${orderName=='totalPrice' }">selected="selected"</c:if>>单笔总价</option>
							</select>
							<input type="submit" value="提交"/>
							<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
						</form>
					</td>
				</tr>
				<c:if test="${list != null }">
					<tr bgcolor="orange">
						<td>ID</td>
						<td>商品</td>
						<td>单价</td>
						<td>数量</td>
						<td>总价</td>
						<td>销售日期</td>
						<td>销售员</td>
					</tr>
				
					<c:forEach items="${list }" var="sale" varStatus="vs">
						<tr <c:if test="${vs.count%2 == 0 }">bgcolor="blue"</c:if>>
							<td>${sale.id }</td>
							<td>${sale.productName }</td>
							<td>${sale.price }</td>
							<td>${sale.quantity }</td>
							<td>${sale.totalPrice }</td>
							<td><fmt:formatDate value="${sale.saleDate }" pattern="yyyy-MM-dd"/> </td>
							<td>${sale.realName }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7">
							<a href="javascript:page_nav(document.forms[0],1);">首页</a>|
							<a href="javascript:page_nav(document.forms[0],${currentPageNo-1});">上一页</a>|
							<a href="javascript:page_nav(document.forms[0],${currentPageNo+1 });">下一页</a>|
							<a href="javascript:page_nav(document.forms[0],${totalPageCount });">末页</a>
							第${currentPageNo }页/共${totalPageCount }页(${totalCount }条记录)
						</td>
					</tr>
				</c:if>
				<c:if test="${list == null }">
					<tr>
						<td colspan="7">
							<h2>暂时没有销售记录</h2>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function page_nav(frm,num){
				frm.pageIndex.value = num;
				frm.submit();
		}
	</script>
</body>
</html>