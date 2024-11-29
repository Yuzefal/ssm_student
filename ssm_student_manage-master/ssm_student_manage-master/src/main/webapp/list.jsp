<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteStudentById(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/deleteStudentById?id="+id;
            }
        }
        window.onload = function() {
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function () {
                if (confirm("您确定要删除选中条目吗？")) {

                    var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked) {
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }

                    if (flag) {//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }

            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function () {
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("uid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;

                }

            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">学生信息列表</h3>
    <div style="float: left;">

        <form class="form-inline" action="${pageContext.request.contextPath}/findStudentByPage" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${student.name}" class="form-control" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputSex2">性别</label>
                <input type="text" name="sex" value="${student.sex}" class="form-control" id="exampleInputSex2" >
            </div>

            <div class="form-group">
                <label for="exampleInputAddress2">地址</label>
                <input type="text" name="address" value="${student.address}" class="form-control" id="exampleInputAddress2"  >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加学生信息</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>

    </div>

    <form id="form" action="${pageContext.request.contextPath}/deleteSelectedStudent" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>邮箱</th>
                <th>地址</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${git.list}" var="student" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" value="${student.id}"></td>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.age}</td>
                    <td>${student.sex}</td>
                    <td>${student.date}</td>
                    <td>${student.email}</td>
                    <td>${student.address}</td>
                    <td>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findStudentById?id=${student.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteStudentById(${student.id});">删除</a></td>
                    </td>
                </tr>

            </c:forEach>

        </table>
    </form>

    <div style="text-align: center;">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <%--上一页--%>
                <c:if test="${pageInfo.pageNum == 1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pageInfo.pageNum != 1}">
                     <li>
                </c:if>
                      <a href="${pageContext.request.contextPath}/findStudentByPage?pageNum=${pageInfo.pageNum - 1}&pageSize=5&name=${student.name}&sex=${student.sex}&address=${student.address}"aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>

                <%--页码 判断页码状态--%>
                <c:forEach begin="1" end="${pageInfo.pages}" var="i" >
                    <c:if test="${pageInfo.pageNum == i}">
                         <li class="active"><a href="${pageContext.request.contextPath}/findStudentByPage?pageNum=${i}&pageSize=5&name=${student.name}&sex=${student.sex}&address=${student.address}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum != i}">
                         <li><a href="${pageContext.request.contextPath}/findStudentByPage?pageNum=${i}&pageSize=5&name=${student.name}&sex=${student.sex}&address=${student.address}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <%--下一页 判断页码状态--%>
                <c:if test="${pageInfo.pageNum >= pageInfo.pages}">
                    <li class="disabled">
                </c:if>

                <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findStudentByPage?pages=${pageInfo.pages}&pageNum=${pageInfo.pageNum  + 1}&pageSize=5&name=${student.name}&sex=${student.sex}&address=${student.address}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                    <br>
                    <br>
                <%--显示记录和总页码--%>
                <span style="font-size: 17px;color: red;">
                共${pageInfo.total}条记录，共${pageInfo.pages}页
                </span>
            </ul>
        </nav>
    </div>






</div>


</body>
</html>



