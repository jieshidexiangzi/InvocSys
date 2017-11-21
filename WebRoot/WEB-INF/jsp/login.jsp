<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
${errMsg }
</head>
<body>
	<div>
		<h1>小型进销存系统</h1>
		<form action="${pageContext.request.contextPath }/user/login.html" method="post">
			<table>
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="userName"/></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="登录"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>