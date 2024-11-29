<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>错误页面</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<style>
    .masg{
        font-family: 微软雅黑;
        font-size: 16px;
        font-weight: bolder;
        color: #333536;
        text-align: center;
    }
</style>
<body>
<div class="container" style="width: 400px;height:255px;background-color: #e8e9ed63; margin-top: 120px;margin-right: 150px;float: right">
    <h3 style="text-align: center; font-family: 微软雅黑;font-weight: bolder;font-size: 24px">错误页面</h3>

        <div class="masg">${error}</div>
        <div class="masg">
            <a href="${pageContext.request.contextPath}/register.jsp">重新注册</a>
        </div>

</div>
</body>
</html>