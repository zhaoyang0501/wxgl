<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.item.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.adminItem.initSearchDataTable();
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
		if("${tip}" != null && "${tip}" != ""){
			noty({"text":"${tip}","layout":"top","type":"success","timeout":"2000"});
		}
	});
</script>
</head>
	
	<script type="text/javascript">
		$(function() {
		});
	</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets ">
						<div class="widget-head  bondi-blue">
							<h3>填写维修单</h3>
						</div>
						<div class="widget-container">
							<form id='dayoffform' class="form-horizontal " method="post" action="item/save">
							 <input type="hidden" name="token" id='token' value="${token}">
								<table id='' class=" responsive table table-striped table_bordered_black table-condensed formtable" >
									<tr>
										<td colspan="6">
											<div class="table_title">
												 <h3>汽车维修单</h3> 
											</div>
										</td>
									</tr>
									<tr>
										<td class='lable'>客户姓名</td>
										<td><input type="text" value=" " name='item.name'></input></td>
										<td class='lable'>客户电话：</td>
										<td><input type="text" value=""  name='item.tel'></input></td>
										<td class='lable'>车牌号码：</td>
										<td><input type="text" value=""   name='item.carid'></input> </td>
									</tr>
									<tr>
										<td class='lable'>送车时间：</td>
										<td colspan="2" >
											<div class="input-append date">
											 <input id="createDate" name="item.createDate" type="text" readonly="readonly" class="form_datetime">
											 <span class="add-on"><i class="icon-th"></i></span>
										    </div>
										</td>
										<td class='lable'>要求取车时间：</td>
										<td colspan="2" >
											<div class="input-append date">
											 <input id="createDate" name="item.needDate" type="text" readonly="readonly" class="form_datetime">
											 <span class="add-on"><i class="icon-th"></i></span>
										    </div>
										</td>
										</tr>
									<tr>
										<td class='lable'>客户地址：<span class="text-error">*</span></td>
										<td colspan="5" ><textarea  name='item.addr' style="width: 90%" rows="2" cols=""></textarea> </td>
									</tr>
									<tr>
										<td class='lable'>故障描述：<span class="text-error">*</span></td>
										<td colspan="5" ><textarea  name='item.remark' style="width: 90%" rows="2" cols=""></textarea> </td>
									</tr>
									<tr  class='remark'>
										<td colspan="6">
											<ol>
											  <li>送车时必须将车内贵重物品取出</li>
											  <li>请保持手机畅通</li>
											</ol>
										</td>
									</tr>
								</table>
								<div >
									<button type="submit" class="btn btn-primary" >提交</button>
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