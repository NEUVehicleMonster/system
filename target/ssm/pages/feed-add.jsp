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
    <script>
        var foddertotal;
        function getfodderById(){


            fodderId=$("#fodder_id").val();
            $.ajax({
                type:"POST",
                dataType:'json',
                contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath }/fodder/findByIdForAjax.do",
                data:JSON.stringify({ // 直接发送的是一个json字符串
                    id:fodderId
                }),
                success:function(Data){

                    if(Data.success){

                        $("#fodder_name").text(Data.fodder.name);
                        $("#fodder_total").val(Data.fodder.total);
                        foddertotal=Data.fodder.total;
                    }else{
                       alert("发生错误");
                    }
                },
                error:function(jqXHR){
                    console.log("发生错误："+jqXHR.status);
                }
            });

        }
        function getFodderTotal() {
            fodderUse = $("#fodder_use").val();
            foddertotal=foddertotal-fodderUse;
            $("#fodder_total").val(foddertotal);
        }
        function getOxtallByCowId(){


            cowId=$("#cow_id").val();
            $.ajax({
                type:"POST",
                dataType:'json',
                contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath }/cowOxtall/findByCowIdForAjax.do",
                data:JSON.stringify({ // 直接发送的是一个json字符串
                    cow_id:cowId
                }),
                success:function(Data){

                    if(Data.success){

                        $("#oxtall_id").text(Data.cowOxtall.oxtall.node);

                    }else{
                        alert("发生错误");
                    }
                },
                error:function(jqXHR){
                    console.log("发生错误："+jqXHR.status);
                }
            });

        }

        
    </script>
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
        <form action="${pageContext.request.contextPath}/feed/save.do"
              method="post">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default box box-primary">
                    <div class="box-title panel-heading">新增喂养信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">奶牛编号</div>
                        <div class="col-md-4 data">
                            <select class="form-control select2" style="width: 100%"
                                    name="cow_id" id="cow_id" onchange="getOxtallByCowId()">
                                <c:forEach items="${cows}" var="cow">
                                    <option value="${cow.id}">${cow.node}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2 title">牛舍编号</div>
                        <div class="col-md-4 data text" id="oxtall_id">
                            COW-OX
                        </div>
                        <div class="col-md-2 title">饲料ID</div>
                        <div class="col-md-4 data" onchange="getfodderById()" >
                            <select class="form-control select2" style="width: 100%"
                                    name="fodder_id" id="fodder_id" onchange="getfodderById()">
                                <c:forEach items="${fodders}" var="fodder">
                                <option onchange="getfodderById()" value="${fodder.id}">${fodder.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2 title">饲料名称</div>
                        <div class="col-md-4 data text" id="fodder_name">
                            品牌
                        </div>
                        <div class="col-md-2 title">本次用量</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" id="fodder_use" name="uselevel" onchange="getFodderTotal()"
                                   placeholder="斤" value="">
                        </div>
                        <div class="col-md-2 title">余量</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" id="fodder_total" name="total"
                                   placeholder="斤" value="">
                        </div>
                        <div class="col-md-2 title rowHeight2x">其他信息</div>
                        <div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="其他信息"
                                      name="info"></textarea>
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
        setSidebarActive("feed-add");
        $("#datepicker-a3").datetimepicker({
            format : "yyyy-mm-dd hh:ii",

        });

    });
</script>
</html>
<!---->