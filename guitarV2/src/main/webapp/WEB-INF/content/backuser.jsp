<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/public/backpublic.jsp"%>
<title>后台模版管理</title>
<script>

function search() {
	if($('input[name="model"]').val()!=''&&$('input[name="builder"]').val()!=''&&$('input[name="type"]').val()!=''&&$('input[name="backWood"]').val()!=''&&$('input[name="topWood"]').val()!=''){
	$('#back-user').datagrid({url:"guitar_queryAllGuitar.action",queryParams:{
		serialNumber : $.trim($('input[name="serialNumber"]').val()), //过滤空格并且传递name=goodname的input的参数值	
		price : $.trim($('input[name="price"]').val()),
		model : $.trim($('input[name="model"]').val()),
		builder : $.trim($('input[name="builder"]').val()),
		type : $.trim($('input[name="type"]').val()),
		backWood : $.trim($('input[name="backWood"]').val()),
		topWood : $.trim($('input[name="topWood"]').val()),
		}});
	
	}else{
		$.messager.alert('我的消息', "请把必填项填写完整", 'info');
	}
}
function updateRole() {
	$('#edit').window('open');  // open a window  
	var row = $('#back-user').datagrid('getSelected');
	$("#name").setValue(row.username);
}



$(function(){
	$('#edit').window('close');  // close a window  
 	var editorRow=undefined;
 	
 
 	

 	
 

 	

	$('#back-user').datagrid({    
	    with:600,
	    title:'用户管理',
	    treeField:'name',
	    fit: true,
	    idField:'id',
	    pageSize:10,
	    pageList:[10,15,20],
	    columns:[[    
	        {field:'serialNumber',title:'serialNumber',width:200,formatter: function(value,row,index){
				if (row.serialNumber==undefined&&index==0){
				  return "sorry ,nothing exist to you";
				} else{
				  return row.serialNumber
				}
			}},  
			   {field:'price',title:'price',width:200,},    
	        {field:'builder',title:'builder',width:200,} , 	     
	     
	        {field:'model',title:'model',sortable:true,width:200,},	
	        {field:'type',title:'type',sortable:true,width:200,},
	        {field:'backWood',title:'backWood',sortable:true,width:200,},
	        {field:'topWood',title:'topWood',sortable:true,width:200,},	          	             	        
	    ]],   
		fitColumns:true,
		pagination:true,
		remoteSort:false,
		multiSort:true,
		nowrap:false,
		rownumbers:true,
		toolbar:'#tb',
	    striped:true,
	    url:'guitar_All.action',    

		 
	  });
});
</script>
</head>
<body>
	<table id="back-user"></table>
	<div id="tb">
		<div style="padding: 5px;">

			<!--  <a
				id="save" href="#" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onClick="obj.save();"
				style="display: none;">保存</a> <a id="redo" href="#"
				class="easyui-linkbutton" data-options="iconCls:'icon-undo'"
				onclick="obj.redo();" style="display: none;">取消编辑</a>  -->
			serialNumber<select class="easyui-textbox" id="serialNumber"
				name="serialNumber" data-options="iconCls:'icon-search'"
				style="width: 180px" prompt="请输入你要查询的用户名"></select> price<select
				class="easyui-textbox" id="price" name="price"
				data-options="iconCls:'icon-search'" style="width: 180px"
				prompt="请输入你要查询的用户名">
			</select>builder <select class="easyui-textbox" id="builder" name="builder"
				data-options="iconCls:'icon-search',required:true"
				style="width: 180px" prompt="请输入你要查询的用户名"></select>model <select
				class="easyui-textbox" id="model" name="model"
				data-options="iconCls:'icon-search',required:true"
				style="width: 180px" prompt="请输入你要查询的用户名"></select>type <select
				class="easyui-textbox" id="type" name="type"
				data-options="iconCls:'icon-search',required:true"
				style="width: 180px" prompt="请输入你要查询的用户名"></select>backWood<select
				class="easyui-textbox" id="backWood" name="backWood"
				data-options="iconCls:'icon-search',required:true"
				style="width: 180px" prompt="请输入你要查询的用户名"></select>topWood<select
				class="easyui-textbox" id="topWood" name="topWood"
				data-options="iconCls:'icon-search',required:true"
				style="width: 180px" prompt="请输入你要查询的用户名"></select>
			<button id="btn" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onClick="search()">查询</button>


		</div>

	</div>
	<div id="back-modelCategory"></div>


</body>
</html>