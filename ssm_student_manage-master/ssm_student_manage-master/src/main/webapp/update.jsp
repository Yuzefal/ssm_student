<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改学生信息</h3>
    <form action="${pageContext.request.contextPath}/updateStudent" method="post">
        <!--  隐藏域 提交id-->
        <input type="hidden" name="id" value="${student.id}">

        <div class="form-group">
            <label for="name">姓名：</label>
            <%--readonly="readonly" 不可修改--%>
            <input type="text" class="form-control" id="name" name="name"  value="${student.name}" readonly="readonly" placeholder="请输入姓名" />
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" value="${student.age}" id="age"  name="age" placeholder="请输入年龄" />
        </div>

        <div class="form-group">
            <label>性别：</label>
                <input type="radio" name="sex" value="男"  <c:if test="${student.sex == '男'}"> checked </c:if> />男
                <input type="radio" name="sex" value="女"  <c:if test="${student.sex == '女'}"> checked </c:if> />女
        </div>

        <div class="form-group">
            <label for="date">出生日期：</label>
            <input type="date" class="form-control" name="date" value="${student.date}"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" id="email" class="form-control" value="${student.email}" name="email" placeholder="请输入邮箱地址"/>
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" id="address" class="form-control" >
                    <option value="北京市" <c:if test="${student.address == '北京市'}"> selected</c:if>>北京市</option>
                    <option value="上海市" <c:if test="${student.address == '上海市'}"> selected</c:if>>上海市</option>
                    <option value="浙江省" <c:if test="${student.address == '浙江省'}"> selected</c:if>>浙江省</option>
                    <option value="江苏省" <c:if test="${student.address == '江苏省'}"> selected</c:if>>江苏省</option>
                    <option value="安徽省" <c:if test="${student.address == '安徽省'}"> selected</c:if>>安徽省</option>
                    <option value="湖北省" <c:if test="${student.address == '湖北省'}"> selected</c:if>>湖北省</option>
                    <option value="湖南省" <c:if test="${student.address == '湖南省'}"> selected</c:if>>湖南省</option>
                    <option value="江西省" <c:if test="${student.address == '江西省'}"> selected</c:if>>江西省</option>
                    <option value="广东省" <c:if test="${student.address == '广东省'}"> selected</c:if>>广东省</option>
                    <option value="陕西省" <c:if test="${student.address == '陕西省'}"> selected</c:if>>陕西省</option>
                    <option value="广西省" <c:if test="${student.address == '广西省'}"> selected</c:if>>广西省</option>
                    <option value="江西省" <c:if test="${student.address == '江西省'}"> selected</c:if>>江西省</option>
            </select>
        </div>



        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
</html>