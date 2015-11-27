jQuery.adminAdminuser = {
		adminuserDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.adminuserDataTable == null) {
				this.adminuserDataTable = $('#dt_adminuser_view').dataTable({
					"sDom" : "<'row-fluid'<'span6'l>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oLanguage" : {
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						"sZeroRecords" : "抱歉， 暂时没有记录",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sSearch" : "",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "前一页",
							"sNext" : "后一页",
							"sLast" : "尾页"
						}
					},
					"bAutoWidth" : false,
					"iDisplayLength" : 10,
					"aLengthMenu" : [ 5, 10, 25, 50],
					"bServerSide" : true,
					"sServerMethod" : "POST",
					"bProcessing" : true,
					"bSort" : false,
					"sAjaxSource" : $.ace.getContextPath() + "/admin/adminuser/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#adminuser_name").val();
						var realname = $("#realname_").val();
						if (!!name) {
							aoData.push({
								"name" : "name",
								"value" : name
							});
						}
						if (!!realname) {
							aoData.push({
								"name" : "realname",
								"value" : realname
							});
						}
						$.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : function(data){
								fnCallback(data.resultMap);
							}
						});
					},
					"aoColumns" : [ {
						"mDataProp" : "name"
					}, {
						"mDataProp" : "password"
					}, {
						"mDataProp" : "remark"
					}, {
						"mDataProp" : "realname"
					}, {
						"mDataProp" : "tel"
					}, {
						"mDataProp" : "job"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [6],
							'fnRender' : function(oObj, sVal) {
								return "<button class=\"btn2 btn-info\" onclick=\"$.adminAdminuser.showEdit("+oObj.aData.id+")\"><i class=\"icon-pencil\"></i>修改</button>"+
								 "  <button class=\"btn2 btn-info\" onclick=\"$.adminAdminuser.deleteAdminuser("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.adminuserDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.adminuserDataTable.fnDraw(oSettings);
			}

		},
		deleteAdminuser :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/adminuser/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminAdminuser.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminAdminuser.toSave=true;
			$("#user_modal_header_label").text("新增");
			$("#adminuser_modal").modal('show');
		},
		save : function (){
			if($.adminAdminuser.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/adminuser/save",
	    			data:{
	    				"adminuser.name":$("#name").val(),
	    				"adminuser.password":$("#password").val(),
	    				"adminuser.realname":$("#realname").val(),
	    				"adminuser.tel":$("#tel").val(),
	    				"adminuser.job":$("#job").val(),
	    				"adminuser.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminAdminuser.initSearchDataTable();
	    					$("#adminuser_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/adminuser/update",
	    			data:{
	    				"adminuser.id":$("#adminuserId").val(),
	    				"adminuser.name":$("#name").val(),
	    				"adminuser.password":$("#password").val(),
	    				"adminuser.realname":$("#realname").val(),
	    				"adminuser.tel":$("#tel").val(),
	    				"adminuser.job":$("#job").val(),
	    				"adminuser.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminAdminuser.initSearchDataTable();
	    					$("#adminuser_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#adminuserId").val(id);
			$.adminAdminuser.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/adminuser/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改权限");
    					$("#adminuser_modal").modal('show');
    					$("#name").val(json.resultMap.adminuser.name);
    					$("#password").val(json.resultMap.adminuser.password);
    					$("#realname").val(json.resultMap.adminuser.realname);
    					$("#tel").val(json.resultMap.adminuser.tel);
    					$("#job").val(json.resultMap.adminuser.job);
    					$("#remark").val(json.resultMap.adminuser.remark);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};