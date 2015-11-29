<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftbar leftbar-close clearfix">
	<div class="admin-info clearfix">
		<div class="admin-thumb">
			<i class="icon-user"></i>
		</div>
		<div class="admin-meta">
			<ul>
				<li class="admin-username" style="margin-top: 10px;">欢迎你 ${sessionScope.adminuser.name}，${sessionScope.adminuser.job}</li>
				<li><a href="${pageContext.request.contextPath}/admin/loginout">
				<i class="icon-lock"></i> 退出</a></li>
			</ul>
		</div>
	</div>

	<div class="left-nav clearfix">
		<div class="left-primary-nav">
			<ul id="myTab">
				<li  class="active"><a href="#dailyreport" class=" icon-user" data-original-title="基础数据管理"></a></li>
			</ul>
		</div>
		<div class="responsive-leftbar">
			<i class="icon-list"></i>
		</div>
		<div class="left-secondary-nav tab-content" >
			<div class="tab-pane active dailyreport" id="dailyreport">
				<ul id="nav" class="accordion-nav" >
				<c:if test="${sessionScope.adminuser.job=='客服'}">
					<li><a href="${pageContext.request.contextPath}/admin/adminuser/centerdetail"><i class="icon-upload"></i>个人中心 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-upload"></i> 零部件查询 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/create"><i class="icon-upload"></i>工单录入</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/send"><i class="icon-upload"></i>工单分配</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/notice"><i class="icon-upload"></i>通知客户取车</a></li>
				</c:if>
				<c:if test="${sessionScope.adminuser.job=='维修工'}">
					<li><a href="${pageContext.request.contextPath}/admin/adminuser/centerdetail"><i class="icon-upload"></i>个人中心 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-upload"></i> 零部件查询 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/work"><i class="icon-upload"></i>工单处理</a></li>
				</c:if>
				<c:if test="${sessionScope.adminuser.job=='仓管员'}">
					<li><a href="${pageContext.request.contextPath}/admin/adminuser/centerdetail"><i class="icon-upload"></i>个人中心 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-upload"></i> 零部件类管理 </a></li>
				</c:if>
				<c:if test="${sessionScope.adminuser.job=='管理员'}">
					<li><a href="${pageContext.request.contextPath}/admin/adminuser/centerdetail"><i class="icon-upload"></i>个人中心 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminuser/index"><i class="icon-zoom-in"></i>员工管理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category/index"><i class="icon-upload"></i> 零部件类管理 </a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/create"><i class="icon-upload"></i>工单录入</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/send"><i class="icon-upload"></i>工单分配</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/work"><i class="icon-upload"></i>工单处理</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/item/notice"><i class="icon-upload"></i>通知客户取车</a></li>
				</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>