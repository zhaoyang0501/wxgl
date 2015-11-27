<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.category.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
function fun_query(){
	$.ajax({
		type : "POST",
		url : $.ace.getContextPath() + "/admin/order/get",
		data:{
			"id":$("#orderid").val()
		},
		success : function(json) {
			$("#itemname").html(json.resultMap.orderSub.item.name);
			$("#seller").html(json.resultMap.orderSub.seller.name);
			$("#count").html(json.resultMap.orderSub.count);
			$("#price").html(json.resultMap.orderSub.totalPrice);
			$("#itemdetail").show();
		}
	});
}

	$(document).ready(function(){
		if("${tip}" != null && "${tip}" != ""){
			noty({"text":"${tip}","layout":"top","type":"success","timeout":"2000"});
		}
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
								<h3>退货处理</h3>
							</div>
							
							<div class="widget-container">
							<form action="${pageContext.request.contextPath}/admin/order/doback" method="post">
							<div class="control-group">
								<label for="title" class="control-label">输入需要退货的单据号查询：</label>
								<div class="controls">
									<input type="text" name='order.id' id='orderid'/>
									<a onclick="fun_query()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">商品名称：<span id='itemname'></span></label>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">供应商：<span id='seller'></span></label>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">数量：<span id='count'></span></label>
								<div class="controls">
									
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">总价：<span id='price'></span></label>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">退货说明：</label>
								<div class="controls">
									<textarea name='name' rows="3" cols=""></textarea>
								</div>
							</div>
								<div class="modal-footer center" id="div_footer">
									<button type="submit" class='btn btn-primary'>确定</button>
								</div>
						</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>
</body>
</html>