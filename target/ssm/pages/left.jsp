<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bianhaodong
  Date: 2020-02-11
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${SPRING_SECURITY_CONTEXT.authentication.principal.username}- ${SPRING_SECURITY_CONTEXT.authentication.principal.authorities=='[ROLE_ADMIN]'?'超级管理员':'管理员'}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <!--<form action="#" method="get" class="sidebar-form">
    <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="搜索...">
        <span class="input-group-btn">
        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
        </button>
      </span>
    </div>
</form>-->
        <!-- /.search form -->


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="${pageContext.request.contextPath}/index/findAll.do"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>奶牛管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="cow-list">
                        <a href="${pageContext.request.contextPath}/cow/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 奶牛列表
                        </a>
                    </li>

<%--                    <li id="product-add">--%>
<%--                        <a href="${pageContext.request.contextPath}/pages/product-add.jsp">--%>
<%--                            <i class="fa fa-circle-o"></i> 添加--%>
<%--                        </a>--%>
<%--                    </li>--%>

                    <li id="cow-add">
                        <a href="${pageContext.request.contextPath}/cow/findAllOxtall.do">
                            <i class="fa fa-circle-o"></i> 新建奶牛信息
                        </a>
                    </li>

<%--                    <li id="admin-500">--%>
<%--                        <a href="all-admin-500.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 500页--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-blank">--%>
<%--                        <a href="all-admin-blank.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 空白页--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-datalist">--%>
<%--                        <a href="all-admin-datalist.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 数据列表页--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-dataform">--%>
<%--                        <a href="all-admin-dataform.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 表单页--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-profile">--%>
<%--                        <a href="all-admin-profile.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 个人中心--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-invoice">--%>
<%--                        <a href="all-admin-invoice.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 发票--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="admin-invoice-print">--%>
<%--                        <a href="all-admin-invoice-print.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 发票打印--%>
<%--                        </a>--%>
<%--                    </li>--%>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>牛舍管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="oxtall-list">
                        <a href="${pageContext.request.contextPath}/oxtall/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 牛舍列表
                        </a>
                    </li>

                    <li id="oxtall-add">
                        <a href="${pageContext.request.contextPath}/pages/oxtall-add.jsp">
                            <i class="fa fa-circle-o"></i> 新增牛舍信息
                        </a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>饲料管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="fodder-list">
                        <a href="${pageContext.request.contextPath}/fodder/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 饲料列表
                        </a>
                    </li>

                    <li id="fodder-add">
                        <a href="${pageContext.request.contextPath}/pages/fodder-add.jsp">
                            <i class="fa fa-circle-o"></i> 新建饲料信息
                        </a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>喂养管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="feed-list">
                        <a href="${pageContext.request.contextPath}/feed/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 喂养记录
                        </a>
                    </li>

                    <li id="feed-add">
                        <a href="${pageContext.request.contextPath}/feed/add.do">
                            <i class="fa fa-circle-o"></i> 记录喂养信息
                        </a>
                    </li>

                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>权限操作</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="user-list">
                        <a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                    </li>

                    <li id="role-list">
                        <a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a>
                    </li>

                    <li id="permission-list">
                        <a href="${pageContext.request.contextPath}/permission/findAll.do">
                            <i class="fa fa-circle-o"></i> 权限管理
                        </a>
                    </li>

                    <li id="user-add">
                        <a href="${pageContext.request.contextPath}/pages/user-add.jsp">
                            <i class="fa fa-circle-o"></i> 新建用户
                        </a>
                    </li>

                    <li id="role-add">
                        <a href="${pageContext.request.contextPath}/pages/role-add.jsp">
                            <i class="fa fa-circle-o"></i> 新建角色
                        </a>
                    </li>

                    <li id="permission-add">
                        <a href="${pageContext.request.contextPath}/pages/permission-add.jsp">
                            <i class="fa fa-circle-o"></i> 新建权限
                        </a>
                    </li>

                </ul>
            </li>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-laptop"></i> <span>博客管理</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="elements-general">--%>
<%--                        <a href="all-elements-general.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 标准 General--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-icons">--%>
<%--                        <a href="all-elements-icons.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 图标 Icons--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-buttons">--%>
<%--                        <a href="all-elements-buttons.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 按钮 Buttons--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-sliders">--%>
<%--                        <a href="all-elements-sliders.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 滑块 Sliders--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-timeline">--%>
<%--                        <a href="all-elements-timeline.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 时间线 Timeline--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-modals">--%>
<%--                        <a href="all-elements-modals.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 对话框样式 Modals--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="elements-widgets">--%>
<%--                        <a href="all-elements-widgets.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 窗体小部件 widgets--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-edit"></i> <span>页面设置</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="form-general">--%>
<%--                        <a href="all-form-general.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 基础表单元素--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="form-advanced">--%>
<%--                        <a href="all-form-advanced.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 高级表单元素--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="form-editors">--%>
<%--                        <a href="all-form-editors.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 编辑器--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-table"></i> <span>系统管理</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="syslog-list">--%>
<%--                        <a href=""${pageContext.request.contextPath}/syslog/findAll.do"">--%>
<%--                            <i class="fa fa-circle-o"></i> 系统日志--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="tables-data">--%>
<%--                        <a href="all-tables-data.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 数据表格--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-cube"></i> <span>个人中心</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="order-manage">--%>
<%--                        <a href="all-order-manage-list.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 全部订单--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="order-cancel">--%>
<%--                        <a href="all-order-cancel-list.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 退款--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-book"></i> <span>样例-游记管理</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="travellog-manage">--%>
<%--                        <a href="all-travellog-manage-list.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 游记列表--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="travellog-review">--%>
<%--                        <a href="all-travellog-review-list.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 游记点评--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li id="travellog-setting">--%>
<%--                        <a href="all-travellog-setting-edit.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 游记设置--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-cogs"></i> <span>样例-系统管理</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--                        <i class="fa fa-angle-left pull-right"></i>--%>
<%--                    </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>

<%--                    <li id="system-setting">--%>
<%--                        <a href="all-system-setting-edit.html">--%>
<%--                            <i class="fa fa-circle-o"></i> 系统设置--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </li>--%>



            <!-- 菜单 /-->

<%--            <li id="admin-documentation"><a href="documentation.html" target="_blank"><i class="fa fa-book"></i> <span>AdminLTE汉化文档</span></a></li>--%>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>