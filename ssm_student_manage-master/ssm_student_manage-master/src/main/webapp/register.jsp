<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>注册页面</title>

	<!-- 1. 导入CSS的全局样式 -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- 2. jQuery导入，建议使用1.9以上的版本 -->
	<script src="js/jquery-2.1.0.min.js"></script>
	<!-- 3. 导入bootstrap的js文件 -->
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="width: 400px;background-color: #e8e9ed63; margin-top: 120px;margin-right: 150px;float: right">
	<h3 style="text-align: center; font-family: 微软雅黑;font-weight: bolder">注册页面</h3>
	<form action="${pageContext.request.contextPath}/user/register" method="post">
		<div class="form-group">
			<label for="user">用户名：</label>
			<input type="text" name="username" class="form-control" id="user" placeholder="请输入用户名"/>
		</div>

		<div class="form-group">
			<label for="password">密码：</label>
			<input type="password" name="password" class="form-control" id="password"  placeholder="请输入密码"/>
		</div>

		<div class="form-group" style="text-align: center;">
			<input class="btn btn btn-primary" type="submit" value="注册">
		</div>
		<div class="form-group">
			<a href="login.jsp" style="float: right">已有账号?去登陆</a>
		</div>
	</form>

</div>
</body>
</html>