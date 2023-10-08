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
    <div class="content-wrapper " >

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
        <section class="content">
            <%--            <div class="callout callout-warning">--%>
            <%--                <h4>Warning!</h4>--%>

            <%--                <p><b>Morris.js</b> charts are no longer maintained by its author. We would recommend using any of the other charts that come with the template.</p>--%>
            <%--            </div>--%>
            <div class="row">

                <div class="col-xs-12">
                    <!-- interactive chart -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <i class="fa fa-bar-chart-o"></i>

                            <h3 class="box-title">服务器CPU实时负载量</h3>

                            <div class="box-tools pull-right">
                                实时显示
                                <div class="btn-group" id="realtime" data-toggle="btn-toggle">
                                    <button type="button" class="btn btn-default btn-xs active" data-toggle="on">开启</button>
                                    <button type="button" class="btn btn-default btn-xs" data-toggle="off">关闭</button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="interactive" style="height: 300px; padding: 0px; position: relative;"><canvas class="flot-base" width="2000" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1000px; height: 300px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 23px; text-align: center;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 117px; text-align: center;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 215px; text-align: center;">20</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 312px; text-align: center;">30</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 410px; text-align: center;">40</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 507px; text-align: center;">50</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 605px; text-align: center;">60</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 703px; text-align: center;">70</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 800px; text-align: center;">80</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 90px; top: 282px; left: 898px; text-align: center;">90</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 269px; left: 14px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 215px; left: 8px; text-align: right;">20</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 161px; left: 8px; text-align: right;">40</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 108px; left: 8px; text-align: right;">60</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 54px; left: 8px; text-align: right;">80</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 1px; text-align: right;">100</div></div></div><canvas class="flot-overlay" width="2000" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1000px; height: 300px;"></canvas></div>
                        </div>
                        <!-- /.box-body-->
                    </div>
                    <!-- /.box -->

                </div>

            </div>
            <!-- /.row -->

        </section>

        <section class="content">

            <div class="row">
                <div class="col-md-6">
                    <!-- Line chart -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <i class="fa fa-bar-chart-o"></i>

                            <h3 class="box-title">牛舍容纳数据</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="line-chart" style="height: 300px; padding: 0px; position: relative;"><canvas class="flot-base" width="870" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 435px; height: 300px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 24px; text-align: center;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 83px; text-align: center;">2</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 142px; text-align: center;">4</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 201px; text-align: center;">6</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 261px; text-align: center;">8</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 317px; text-align: center;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 54px; top: 282px; left: 376px; text-align: center;">12</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 269px; left: 1px; text-align: right;">-1.5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 224px; left: 1px; text-align: right;">-1.0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 179px; left: 1px; text-align: right;">-0.5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 135px; left: 5px; text-align: right;">0.0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 90px; left: 5px; text-align: right;">0.5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 45px; left: 5px; text-align: right;">1.0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 5px; text-align: right;">1.5</div></div></div><canvas class="flot-overlay" width="870" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 435px; height: 300px;"></canvas></div>
                        </div>
                        <!-- /.box-body-->
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col -->

                <div class="col-md-6">
                    <!-- Bar chart -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <i class="fa fa-bar-chart-o"></i>

                            <h3 class="box-title">喂养数据</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="bar-chart" style="height: 300px; padding: 0px; position: relative;"><canvas class="flot-base" width="870" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 435px; height: 300px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 21px; text-align: center;">January</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 88px; text-align: center;">February</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 166px; text-align: center;">March</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 241px; text-align: center;">April</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 313px; text-align: center;">May</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 72px; top: 282px; left: 381px; text-align: center;">June</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 269px; left: 7px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 202px; left: 7px; text-align: right;">5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 135px; left: 1px; text-align: right;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 68px; left: 1px; text-align: right;">15</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 1px; text-align: right;">20</div></div></div><canvas class="flot-overlay" width="870" height="600" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 435px; height: 300px;"></canvas></div>
                        </div>
                        <!-- /.box-body-->
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col -->
            </div>

        </section>
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
            locale: 'zh-CN'
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


    $(function() {
        /*
         * Flot Interactive Chart
         * -----------------------
         */
        // We use an inline data source in the example, usually data would
        // be fetched from a server
        var data = [],
            totalPoints = 100;

        function getRandomData() {

            if (data.length > 0)
                data = data.slice(1);

            // Do a random walk
            while (data.length < totalPoints) {

                var prev = data.length > 0 ? data[data.length - 1] : 50,
                    y = prev + Math.random() * 10 - 5;

                if (y < 0) {
                    y = 0;
                } else if (y > 100) {
                    y = 100;
                }

                data.push(y);
            }

            // Zip the generated y values with the x values
            var res = [];
            for (var i = 0; i < data.length; ++i) {
                res.push([i, data[i]]);
            }

            return res;
        }

        var interactive_plot = $.plot("#interactive", [getRandomData()], {
            grid: {
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0, // Drawing is faster without shadows
                color: "#3c8dbc"
            },
            lines: {
                fill: true, //Converts the line chart to area chart
                color: "#3c8dbc"
            },
            yaxis: {
                min: 0,
                max: 100,
                show: true
            },
            xaxis: {
                show: true
            }
        });

        var updateInterval = 500; //Fetch data ever x milliseconds
        var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
        function update() {

            interactive_plot.setData([getRandomData()]);

            // Since the axes don't change, we don't need to call plot.setupGrid()
            interactive_plot.draw();
            if (realtime === "on")
                setTimeout(update, updateInterval);
        }

        //INITIALIZE REALTIME DATA FETCHING
        if (realtime === "on") {
            update();
        }
        //REALTIME TOGGLE
        $("#realtime .btn").click(function() {
            if ($(this).data("toggle") === "on") {
                realtime = "on";
            } else {
                realtime = "off";
            }
            update();
        });
        /*
         * END INTERACTIVE CHART
         */


        /*
         * LINE CHART
         * ----------
         */
        //LINE randomly generated data

        var sin = [],
            cos = [];
        for (var i = 0; i < 14; i += 0.5) {
            sin.push([i, Math.sin(i)]);
            cos.push([i, Math.cos(i)]);
        }
        var line_data1 = {
            data: sin,
            color: "#3c8dbc"
        };
        var line_data2 = {
            data: cos,
            color: "#00c0ef"
        };
        $.plot("#line-chart", [line_data1, line_data2], {
            grid: {
                hoverable: true,
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0,
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            lines: {
                fill: false,
                color: ["#3c8dbc", "#f56954"]
            },
            yaxis: {
                show: true,
            },
            xaxis: {
                show: true
            }
        });
        //Initialize tooltip on hover
        $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
            position: "absolute",
            display: "none",
            opacity: 0.8
        }).appendTo("body");
        $("#line-chart").bind("plothover", function(event, pos, item) {

            if (item) {
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);

                $("#line-chart-tooltip").html(item.series.label + " of " + x + " = " + y)
                    .css({
                        top: item.pageY + 5,
                        left: item.pageX + 5
                    })
                    .fadeIn(200);
            } else {
                $("#line-chart-tooltip").hide();
            }

        });
        /* END LINE CHART */



        /*
         * BAR CHART
         * ---------
         */

        var bar_data = {
            data: [
                <c:forEach items="${feeds}" var="feed">
                ["${feed.timelogStr}",${feed.uselevel} ],
                </c:forEach>
            ],
            color: "#3c8dbc"
        };
        $.plot("#bar-chart", [bar_data], {
            grid: {
                borderWidth: 1,
                borderColor: "#f3f3f3",
                tickColor: "#f3f3f3"
            },
            series: {
                bars: {
                    show: true,
                    barWidth: 0.5,
                    align: "center"
                }
            },
            xaxis: {
                mode: "categories",
                tickLength: 0
            }
        });
        /* END BAR CHART */


        /*
         * END DONUT CHART
         */

    });

    /*
     * Custom Label formatter
     * ----------------------
     */
    function labelFormatter(label, series) {
        return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">' +
            label +
            "<br>" +
            Math.round(series.percent) + "%</div>";
    }

    // 激活导航位置
    setSidebarActive("charts-flot");
</script>


</html>
<!---->