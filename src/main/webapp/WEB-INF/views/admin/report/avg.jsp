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
<script src="${pageContext.request.contextPath}/js/echart/echarts-all.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
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
	
	function fun_query(){
		$.ajax({
			type : "POST",
			url : $.ace.getContextPath() + "/admin/report/avgreportlist",
			data:{
				"begain":$("#begain").val(),
				"end":$("#end").val()
			},
			success : function(json) {
				 option = {
						    title : {
						        text: '盈利情况'
						    },
						    tooltip : {
						        trigger: 'axis'
						    },
						    toolbox: {
						        show : true,
						        feature : {
						            mark : {show: true},
						            dataView : {show: true, readOnly: false},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    calculable : true,
						    xAxis : [
						        {
						            type : 'category',
						            data : json.resultMap.dates
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    series : [
						        {
						            name:'盈利',
						            type:'bar',
						            data:json.resultMap.avgs,
						            markPoint : {
						                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'}
						                ]
						            }
						        }
						    ]
						};
				 var tmp_report = echarts.init(document.getElementById('report')); 
				 tmp_report.setOption(option);     
			}
		});	
		                
	}
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
								<h3>利润报表</h3>
							</div>
							<div class="box well form-inline">
								<span>日期起：</span>
								<div class="input-append date">
									 <input id="begain" style="width:80px;" type="text" value="2015-01-01" readonly="readonly">
									 <span class="add-on"><i class="icon-th"></i></span>
								</div>
								<span>日期止：</span>
								<div class="input-append date">
									 <input id="end" style="width:80px;" type="text" value="2015-11-01" readonly="readonly">
									 <span class="add-on"><i class="icon-th"></i></span>
								</div>
								<input type="hidden" id="state" value="出库"/>
								<a onclick="fun_query()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
								<div id="report" style="width: 1000px;height: 400px;"></div>
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