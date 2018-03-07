<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>测试</title>
	
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/wu.css"/>
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/icon.css" />
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/contrm.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/jquery-1.8.0.min.js"></script>
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>		

	<style>
	
	</style>
</head>

<body>
	<div id="toolbar">
		<div class="wu-toolbar-button">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="add()" plain="true">新增订单</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit()" plain="true">修改</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
		</div>
	</div>
	
	<table style="padding-top:0px;" id="appointmentsDg" class="easyui-datagrid" toolbar="#toolbar"></table>
	
	<div id="appointmentDialog" title="新增订单" modal=true draggable=true class="easyui-dialog" closed=true style="width:290px;">
   		<form id="appointmentForm" action="" method="post">
   				<input type="hidden" name="id" value="" />
   				<table>
   					<tr hidden>
   						<td>id:</td>
   						<td><input name="id" id="id" style="width:200px;" type="text" value=""/></td>
   					</tr>
   					
   					<tr id="stateTr">
   						<td>订单状态:</td>
   						<td>
   							<!-- <input name="taocan" class="easyui-combobox" valueField="id" textField="value"  value="" /> -->
   							<input name="state" style="width:200px;" class="easyui-combobox" id="state" 
							    data-options="valueField:'id',textField:'value',
							    data:[{
							                id:'未处理',
							                value:'未处理'
							            },
							            {
							                id:'已确认',
							                value:'已确认'
							            },
							            {
							                id:'已结束',
							                value:'已结束'
							            }]"/>
   						</td>
   					</tr>
   					
   					<tr>
   						<td>套餐类型:</td>
   						<td>
   							<!-- <input name="taocan" class="easyui-combobox" valueField="id" textField="value"  value="" /> -->
   							<input name="taocan" style="width:200px;" required=true class="easyui-combobox" id="taocan" 
							    data-options="valueField:'id',textField:'value',
							    data:[{
							                id:'小零碎套餐',
							                value:'小零碎套餐'
							            },
							            {
							                id:'手拉手套餐',
							                value:'手拉手套餐'
							            },
							            {
							                id:'小家庭套餐',
							                value:'小家庭套餐'
							            },
							            {
							                id:'大家庭套餐',
							                value:'大家庭套餐'
							            }]"/>
   						</td>
   					</tr>
   					
   					<tr>
   						<td>搬家时间:</td>
   						<td><input name="appointTime" id="appointTime" style="width:200px;" type="text" value=""/></td>
   					</tr>
   					
   					<tr>
   						<td>起点名称:</td>
   						<td>
   							<input type="text" style="width:197px;" name="fromMapName" class="easyui-validatebox" required=true validType="midLength[1,100]" missingMessage="起点名称必填!" invalidMessage="起点名称必须在1到100个字符之间!"  value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr id="fromMapAddressTr">
   						<td>起点地址:</td>
   						<td>
   							<input type="text" style="width:197px;" name="fromMapAddress" class="easyui-validatebox" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>详细地址:</td>
   						<td>
   							<input type="text" style="width:197px;" name="fromDes" class="easyui-validatebox" required=true missingMessage="详细地址必填!" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>起点楼层:</td>
   						<td>
   							<input type="text" style="width:197px;" name="fromFloor" class="easyui-validatebox" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>终点名称:</td>
   						<td>
   							<input type="text" style="width:197px;" name="toMapName" class="easyui-validatebox" required=true  missingMessage="终点名称必填!"  value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr id="tomMapAddressTr">
   						<td>终点地址:</td>
   						<td>
   							<input type="text" style="width:197px;" name="toMapAddress" onmouseover="this.select()" class="easyui-validatebox" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>详细地址:</td>
   						<td>
   							<input type="text" style="width:197px;" name="toDes" class="easyui-validatebox" required=true missingMessage="详细地址必填!" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>终点楼层:</td>
   						<td>
   							<input type="text" style="width:197px;" name="toFloor" class="easyui-validatebox" value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>客户姓名:</td>
   						<td>
   							<input type="text" style="width:197px;" name="userName" class="easyui-validatebox" required=true validType="midLength[2,5]" missingMessage="客户姓名必填!" invalidMessage="用户名必须在2到5个字符之间!"  value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>联系方式:</td>
   						<td>
   							<input type="text" style="width:197px;" name="telephone" class="easyui-validatebox" required=true  missingMessage="联系方式必填!"  value="" />
   						</td>   				   					
   					</tr>
   					
   					<tr>
   						<td>备注:</td>
   						<td>
   							<input type="text" style="width:197px;" name="note"  value="" />
   						</td>   				   					
   					</tr>   				
   					   					   				
   					<tr  align="center">
   						<td colspan="2">
   							<a style="margin-left:50px;" id="btnConfirm" class="easyui-linkbutton">确定</a>
   							<a id="btnCancel" class="easyui-linkbutton">关闭</a>
   						</td>
   					</tr>   					 					    					    					    					    					    					    					    					
   				</table>
   		</form> 			
	</div>
	
	
	<script type="text/javascript">
		$('#appointTime').datetimebox({
			required:true , 
			missingMessage:'搬家时间必填!' ,
			editable:false
		});
	
		var url = "${pageContext.request.contextPath}" + "/appointment.do/getAppointmentList";
		$('#appointmentsDg').datagrid({
							idField:"id",
							fit:true,
							url : url,
							height:400,
							loadMsg:"数据正在加载中......",
							rownumbers:true,
							striped:true,
							//fitColumns:true,
							//singleSelect:true,
							frozenColumns : [[ //冻结列特性 ,不要与fitColumns 特性一起使用
								{
									field : 'cx',
									checkbox : true
								},
								{
									field:"id",
									title:"订单编号"
								},
								{
									field:"state",
									title:"订单状态",
									align:"center",
									styler:function(value , record){
										if(value == '未处理'){
											return 'color:green;';
										}
									}
								},
								{
									field:"taocan",
									title:"套餐类型"
								},
								{
									field:"appointTime",
									title:"搬家时间"
								}
							]],
							columns:[[
								
								{
									field:"fromMapName",
									title:"起始地点名称"
								},
								{
									field:"fromMapAddress",
									title:"起始地点"
								},
								{
									field:"fromDes",
									title:"起始地点详细地址"
								},
								{
									field:"fromFloor",
									title:"起始楼层"
								},
								{
									field:"toMapName",
									title:"目的地点名称"
								},
								{
									field:"toMapAddress",
									title:"目的地点"
								},
								{
									field:"toDes",
									title:"目的地详细地址",
									width:80
								},
								{
									field:"toFloor",
									title:"目的地楼层"
								},
								{
									field:"userName",
									title:"姓名"
								},{
									field:"telephone",
									title:"电话"
								},
								{
									field:"note",
									title:"备注"
								},
								{
									field:"submitTime",
									title:"提交时间"
								}
							]],
							pagination:true,
							pageSize:10,
							pageList:[10,20,40,80]
						
		 });
		
		 function add(){
			flag = 'add';
			$('#appointmentDialog').dialog({
					title:'新增订单' 
			});
			
			//$('#stateTr').type("hidden");
			//$("#stateTr input[type='text'],#importBox input[type='file']")
			//$("#stateTr").attr("type","hidden");
			$("#stateTr").hide();
			$("#fromMapAddressTr").hide();
			//$("#stateTr").show();
			//$('#myform').find('input[name!=sex]').val("");
			//$('#myform').get(0).reset();
			//$('#appointmentForm').form('clear');
			$('#appointmentForm').get(0).reset();
			$("#state").val("未处理");
			//alert($("#state").val());
			$('#appointmentDialog').dialog('open');
		 };
		 
		 function edit(){
				flag = 'edit';
				var arr =$('#appointmentsDg').datagrid('getSelections');
				if(arr.length != 1){
					$.messager.show({
						title:'提示信息!',
						msg:'只能选择一条记录进行修改!'
					});
				}else {
					$('#appointmentDialog').dialog({
						title:'修改订单'
					});
					$("#stateTr").show();
					$("#fromMapAddressTr").show();
					$('#appointmentDialog').dialog('open'); //打开窗口
					$('#appointmentForm').get(0).reset();   //清空表单数据 
					$('#appointmentForm').form('load',{	   //调用load方法把所选中的数据load到表单中,非常方便
						id:arr[0].id ,
						state:arr[0].state ,
						taocan:arr[0].taocan ,
						appointTime:arr[0].appointTime ,
						
						fromMapName:arr[0].fromMapName ,
						fromMapAddress:arr[0].fromMapAddress ,
						fromDes:arr[0].fromDes ,
						fromFloor:arr[0].fromFloor ,
						
						toMapName:arr[0].toMapName ,
						toMapAddress:arr[0].toMapAddress ,
						toDes:arr[0].toDes ,
						toFloor:arr[0].toFloor ,

						userName:arr[0].userName ,
						telephone:arr[0].telephone ,
						note:arr[0].note
					});
				} 
		 };
		 
		 $('#btnConfirm').click(function(){
			 if(flag == "add"){
				 if($('#appointmentForm').form('validate')){
						$.ajax({
							type: 'get' ,
							url: "${pageContext.request.contextPath}/appointment.do/addAppointment",
							cache:false ,
							data:$('#appointmentForm').serialize() ,
							dataType:'text' ,
							success:function(result){
								//1 关闭窗口
								$('#appointmentDialog').dialog('close');
								//2刷新datagrid 
								$('#appointmentsDg').datagrid('reload');
								//3 提示信息
								if(result == "成功"){
									$.messager.show({
										title:"提示信息!" , 
										msg:"新增订单成功"
									});
								}							
							} ,
							error:function(){
								 $.messager.show({
									title:"提示信息!" , 
									msg:"新增订单失败"
								});
							}
						});
					} else {
						 $.messager.show({
							title:'提示信息!' ,
							msg:'数据验证不通过,不能保存!'
						 });
					}
			 }else{
				 if($('#appointmentForm').form('validate')){
						$.ajax({
							type: 'get' ,
							url: "${pageContext.request.contextPath}/appointment.do/updateAppointment",
							cache:false ,
							data:$('#appointmentForm').serialize() ,
							dataType:'text' ,
							success:function(result){
								//1 关闭窗口
								$('#appointmentDialog').dialog('close');
								//2刷新datagrid 
								$('#appointmentsDg').datagrid('reload');
								//3 提示信息
								if(result == "成功"){
									$.messager.show({
										title:"提示信息!" , 
										msg:"修改订单成功"
									});
								}							
							} ,
							error:function(){
								 $.messager.show({
									title:"提示信息!" , 
									msg:"修改订单失败"
								});
							}
						});
					} else {
						 $.messager.show({
							title:'提示信息!' ,
							msg:'数据验证不通过,不能保存!'
						 });
					}
			 }
			 
		 });
		 
		 $('#btnCancel').click(function(){
			 $('#appointmentDialog').dialog('close');
		 });
	</script>
</body>
</html>