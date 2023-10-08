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
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                控制面板
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <form action="${pageContext.request.contextPath}/cow/updateById.do"
              method="post">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default box box-primary">
                    <div class="box-title panel-heading">新增奶牛信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">奶牛编号</div>
                        <div class="col-md-10 data">
                            <input type="hidden" name="id" value="${cow.id}">
                            <input type="text" class="form-control" name="node"
                                   placeholder="COW-OX${cow.node}" value="${cow.node}" >
                        </div>
                        <div class="col-md-2 title">奶牛重量</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="weight"
                                   placeholder="${cow.weight}公斤" value="${cow.weight}" >
                        </div>

                        <div class="col-md-2 title">奶牛年龄</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="age"
                                   placeholder="${cow.age}年" value="${cow.age}">
                        </div>
                        <div class="col-md-2 title">奶牛品种</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="var"
                                   placeholder="${cow.var}" value="${cow.var}">
                        </div>

<%--                        <div class="col-md-2 title">出发时间</div>--%>
<%--                        <div class="col-md-4 data">--%>
<%--                            <div class="input-group date">--%>
<%--                                <div class="input-group-addon">--%>
<%--                                    <i class="fa fa-calendar"></i>--%>
<%--                                </div>--%>
<%--                                <input type="text" class="form-control pull-right"--%>
<%--                                       id="datepicker-a3" name="departureTime">--%>
<%--                            </div>--%>
<%--                        </div>--%>


                        <div class="col-md-2 title">奶产量/年</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="yield"
                                   placeholder="${cow.yield}斤" value="${cow.yield}">
                        </div>

                        <div class="col-md-2 title">产奶周期</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="${cow.period}天"
                                   name="period" value="${cow.period}">
                        </div>

                        <div class="col-md-2 title">总体评价</div>
                        <div class="col-md-4 data">
                            <select class="form-control select2" style="width: 100%"
                                    name="grade">
                                <c:if test="${cow.grade==0}">
                                <option value="0" selected="selected">优</option>
                                <option value="1" >良</option>
                                <option value="2">中</option>
                                <option value="3">差</option>
                                </c:if>
                                <c:if test="${cow.grade==1}">
                                    <option value="0" >优</option>
                                    <option value="1" selected="selected">良</option>
                                    <option value="2">中</option>
                                    <option value="3">差</option>
                                </c:if>
                                <c:if test="${cow.grade==2}">
                                    <option value="0" >优</option>
                                    <option value="1">良</option>
                                    <option value="2" selected="selected">中</option>
                                    <option value="3">差</option>
                                </c:if>
                                <c:if test="${cow.grade==3}">
                                    <option value="0" >优</option>
                                    <option value="1">良</option>
                                    <option value="2">中</option>
                                    <option value="3" selected="selected">差</option>
                                </c:if>
                            </select>
                        </div>

                        <div class="col-md-2 title rowHeight2x">其他信息</div>
                        <div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="其他信息"
                                      name="productDesc"></textarea>
                        </div>

                    </div>
                </div>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">保存</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/--> </section>
            <!-- 正文区域 /-->
        </form>
        <!-- 正文区域 /-->

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
        setSidebarActive("cow-add");
        $("#datepicker-a3").datetimepicker({
            format : "yyyy-mm-dd hh:ii",

        });

    });
</script>
</html>
<!---->