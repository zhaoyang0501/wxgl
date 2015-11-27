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
function AngelMoney(s){
	   if(/[^0-9\.]/.test(s)) return "不是数字！";
	   s=s.replace(/^(\d*)$/,"$1.");
	   s=(s+"00").replace(/(\d*\.\d\d)\d*/,"$1");
	   s=s.replace(".",",");
	   var re=/(\d)(\d{3},)/;
	   while(re.test(s))
	           s=s.replace(re,"$1,$2");
	   s=s.replace(/,(\d\d)$/,".$1");
	   return "" + s.replace(/^\./,"0.")
	}
	function fun_getitem(){
		$.ajax({
			type : "POST",
			url : $.ace.getContextPath() + "/admin/item/get",
			data:{
				"id":$("#itemid").val()
			},
			success : function(json) {
				$("#itemimg").attr("src","../upload/"+json.resultMap.object.imgPath);
				$("#itemcount").html(json.resultMap.object.count+"件");
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
								<h3>商品销售</h3>
							</div>
							
							<div class="widget-container">
							<form action="${pageContext.request.contextPath}/admin/order/dosell" method="post">
							<div class="control-group">
								<label for="title" class="control-label">商品：</label>
								<div class="controls">
									<select id='itemid' name="order.item.id" onchange="fun_getitem()">
										<c:forEach items="${items}" var="bean">
												<option value="${bean.id }">${bean.name }</option>
										</c:forEach>
									</select>
									<div style="color: red;display: none" id='itemdetail' >
									<img  id='itemimg' title="product" alt="product" src="../upload/" height="50" width="50">
									 库存：<span id='itemcount'></span> </div>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">客户（会员卡）：</label>
								<div class="controls">
										<input type="text" name='order.card'/>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">数量：</label>
								<div class="controls">
									<input type="text" name='order.count'/>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">单价：</label>
								<div class="controls input-prepend input-append">
								
										<span class="add-on">￥</span>
										<input style="width: 176px" type="text" name='order.perPrice'  onchange="this.value=AngelMoney(this.value)"/>
									</div>
								
								
							</div>
								<div class="modal-footer center" id="div_footer">
									<button type="submit" class='btn btn-primary'>售出</button>
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