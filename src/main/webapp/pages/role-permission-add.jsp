<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bianhaodong
  Date: 2020-02-11
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<jsp:include page="${pageContext.request.contextPath}/pages/mate.jsp"></jsp:include>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/top.jsp"></jsp:include>

    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/left.jsp"></jsp:include>

    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">


        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                角色管理 <small>添加权限表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/role/findAll.do">角色管理</a></li>
                <li class="active">添加权限表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <form
                action="${pageContext.request.contextPath}/role/addPermissionToRole.do"
                method="post">
            <!-- 正文区域 -->
            <section class="content">

                <input type="hidden" name="id" value="${role.id}">

                <table id="dataList"
                       class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="" style="padding-right: 0px">
                            <input id="selall"
                                   type="checkbox" class="icheckbox_square-blue"></th>
                        <th class="sorting_asc">ID</th>
                        <th class="sorting">权限名称</th>
                        <th class="sorting">权限URL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${permissionList}" var="permission">
                        <tr>
                            <td>

                                <input name="permissionIds" type="checkbox" value="${permission.id}">

                            </td>
                            <td>${permission.id}</td>
                            <td>${permission.permissionName }</td>
                            <td>${permission.url}</td>

                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">保存</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/--> </section>
            <!-- 正文区域 /-->
        </form>
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/bottom.jsp"></jsp:include>

    <!-- 底部导航 /-->

</div>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"></jsp:include>

</body>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function() {
        $('#datepicker-a3').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
    });

    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("user-list");
        $("#datepicker-a3").datetimepicker({
            format : "yyyy-mm-dd hh:ii",

        });

    });
</script>
</html>
<!---->