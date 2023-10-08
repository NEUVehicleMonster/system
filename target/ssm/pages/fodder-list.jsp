<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                饲料管理 <small>全部饲料</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/fodder/findAll.do">饲料管理</a></li>

                <li class="active">全部饲料</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content"> <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>
                <form action="${pageContext.request.contextPath}/fodder/dropByIds.do" method="post">
                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">
                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/pages/fodder-add.jsp'">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>

                                    <button type="submit" class="btn btn-default" title="删除">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>

                                    <button onclick="window.location.reload()" type="button" class="btn btn-default"  title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm"
                                       placeholder="搜索"> <span
                                    class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px"><input
                                        id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="text-center">ID</th>
                                <th class="text-center">编号</th>
                                <th class="text-center">名称</th>
                                <th class="text-center">饲料配方</th>
                                <th class="text-center">余量</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${pageInfo.list}" var="fodder">
                                <tr>
                                    <td ><input name="ids" value="${fodder.id }" type="checkbox"></td>
                                    <td >${fodder.id }</td>
                                    <td>COW-OX${fodder.node }</td>
                                    <td>${fodder.name }</td>
                                    <td class="text-center">${fodder.info }</td>
                                    <td class="text-center">${fodder.total }斤</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/fodder/findById.do?id=${fodder.id}" class="btn bg-olive btn-xs">详情</a>
                                        <a href="${pageContext.request.contextPath}/fodder/updateBtn.do?id=${fodder.id}" class="btn bg-blue btn-xs">修改</a>
                                        <a  onclick="location.href='${pageContext.request.contextPath}/fodder/dropByIds.do?ids=${fodder.id}'" class="btn bg-red btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <!--
                        <tfoot>
                        <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                        </tr>
                        </tfoot>-->
                        </table>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                </form>
                <!-- /.box-body -->


                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
                            <select class="form-control" id="changePageSize" onchange="changePageSize()" selected="6">

                                <option value="4" >4</option>
                                <option value="6" >6</option>
                                <option value="8" >8</option>
                                <option value="10"  >10</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/fodder/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/fodder/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">

                                <li><a href="${pageContext.request.contextPath}/fodder/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>

                            </c:forEach>

                            <li><a href="${pageContext.request.contextPath}/fodder/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/fodder/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->

            </div>

        </section>
        <!-- 正文区域 /-->
    </div>


    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/bottom.jsp"></jsp:include>

    <!-- 底部导航 /-->
</div>


<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
    function getAll()
    {
        var tit = document.getElementById("operAll");
        var inputs = document.getElementsByTagName("input");
        for(var i = 0; i < inputs.length; i++)
        {
            if(inputs[i].type == "checkbox")
            {
                if(tit.checked == true)
                {
                    inputs[i].checked = true;
                }else{
                    inputs[i].checked = false;
                }
            }
        }
    }
</script>
<script>
    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("fodder-list");
        $("#datepicker-a3").datetimepicker({
            format : "yyyy-mm-dd hh:ii",

        });

        $("#changePageSize").val(${pageInfo.pageSize});

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });

    function changePageSize() {
        var pageSize = $("#changePageSize").val();

        location.href = "${pageContext.request.contextPath}/fodder/findAll.do?page=${pageInfo.pageNum}&size="+pageSize;

        // $("#changePageSize option[value='6']").prop("selected",true);
    }
</script>

</html>
