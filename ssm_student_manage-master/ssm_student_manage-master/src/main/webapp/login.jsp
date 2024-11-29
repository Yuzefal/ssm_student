<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>学生登录</title>

	<!-- 1. 导入CSS的全局样式 -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- 2. jQuery导入，建议使用1.9以上的版本 -->
	<script src="js/jquery-2.1.0.min.js"></script>
	<!-- 3. 导入bootstrap的js文件 -->
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
        //切换验证码
        function refreshCode(){
            //1.获取验证码图片对象
            var vcode = document.getElementById("vcode");

            //2.设置其src属性，加时间戳
            vcode.src = "${pageContext.request.contextPath}/user/checkCode?time="+new Date().getTime();
        }
	</script>
	<style>
		.masg{
			font-family: 微软雅黑;
			font-size: 16px;
			font-weight: bolder;
			color: #333536;
		}


	</style>
</head>
<body>
<div class="container" style="width: 400px;background-color: #e8e9ed63; margin-top: 120px;margin-right: 150px;float: right">
	<h3 style="text-align: center; font-family: 微软雅黑;font-weight: bolder">学生登录</h3>
	<form action="${pageContext.request.contextPath}/user/login" method="post">
		<div class="form-group">
			<label for="username">用户名：</label>
			<input type="text" name="username" class="form-control" id="username" <%--value="${cookie.uu_name.value}" --%>placeholder="请输入用户名"/>
		</div>

		<div class="form-group">
			<label for="password">密码：</label>
			<input type="password" name="password" class="form-control" id="password"  placeholder="请输入密码"/>
		</div>
		<div class="form-inline">
			<label for="vcode">验证码：</label>
			<input type="text" name="checkCode" class="form-control" id="checkCode" placeholder="请输入验证码" style="width: 120px;"/>
			<a href="javascript:refreshCode();">
				<img src="${pageContext.request.contextPath}/user/checkCode" title="看不清点击刷新" id="vcode"/>
			</a>
		</div>
		<br>
		<div class="form-group">
			<label>记住用户名：<input type="checkbox" name="check_user" id="check_user" value="true" /></label>
		</div>
		<div class="form-group">
			<label>自动登陆：<input type="checkbox" name="check_auto" id="check_auto" value="true" /></label>
		</div>


		<hr/>
		<div class="form-group" style="text-align: center;">
			<input class="btn btn btn-primary" type="submit" value="登录">
		</div>
		<div class="form-group">
			<a href="register.jsp" style="float: right">还没账号?去注册</a>
		</div>
	</form>

	<%--出错信息提示--%>
	<div class="masg">${login_error}</div>
	<div class="masg">${cc_error}</div>

</div>
</body>
</html>