<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.order.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$.adminOrder.initSearchDataTable();
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>进货明细</h3>
							</div>
							<div class="box well form-inline">
								<span>日期起：</span>
								<div class="input-append date">
									 <input id="begain" style="width:80px;" type="text" value="" readonly="readonly">
									 <span class="add-on"><i class="icon-th"></i></span>
								</div>
								<span>日期止：</span>
								<div class="input-append date">
									 <input id="end" style="width:80px;" type="text" value="" readonly="readonly">
									 <span class="add-on"><i class="icon-th"></i></span>
								</div>
								<input type="hidden" id="state" value="入库"/>
								<a onclick="$.adminOrder.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<table class="responsive table table-striped table-bordered"
									id="dt_order_view">
									<thead>
										<tr>
											<th >流水号</th>
											<th >创建日期</th>
											<th >供应商</th>
											<th >操作人</th>
											<th >商品</th>
											<th >数量</th>
											<th >单价</th>
											<th >总价</th>
											<th >状态</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="order_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="order_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="orderId" value="">
							<div class="control-group">
								<label for="name" class="control-label">分类名称：</label>
								<div class="controls">
									<input type="text" id="name" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">备注：</label>
								<div class="controls">
									<textarea id="remark" placeholder="" rows="3">
									</textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminOrder.save()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>