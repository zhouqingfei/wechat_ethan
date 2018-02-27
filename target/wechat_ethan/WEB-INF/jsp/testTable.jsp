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
	<script>
		$(function() {
	
		});
	</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true">
		<!-- Begin of toolbar -->
		<div id="wu-toolbar-2">
			<div class="wu-toolbar-button">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="execBatch()" plain="true">批量执行</a> 
			</div>
			<div class="wu-toolbar-search">
				<label>起始时间：</label><input class="easyui-datebox"
					style="width: 100px"> <label>结束时间：</label><input
					class="easyui-datebox" style="width: 100px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-search">开始检索</a>
			</div>
		</div>
		<!-- End of toolbar -->
		<div regin='center' style='height: 100%'>
		<table id="wu-datagrid-2" class="easyui-datagrid"
			toolbar="#wu-toolbar-2"></table>
		</div>			
	</div>
	<!-- Begin of easyui-dialog -->
	<div id="wu-dialog-2" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width: 400px; padding: 10px;">
		<form id="wu-form-2" method="post">
			<table>
				<tr>
					<td width="60" align="right">姓 名:</td>
					<td><input type="text" name="name" class="wu-text" /></td>
				</tr>
				<tr>
					<td align="right">邮 箱:</td>
					<td><input type="text" name="email" class="wu-text" /></td>
				</tr>
				<tr>
					<td align="right">主 题:</td>
					<td><input type="text" name="subject" class="wu-text" /></td>
				</tr>
				<tr>
					<td valign="top" align="right">内 容:</td>
					<td><textarea name="content" rows="6" class="wu-textarea"
							style="width: 260px"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- End of easyui-dialog -->
	<script type="text/javascript">
		/**
		 * Name 添加记录
		 */
		function add() {
			$('#wu-form-2').form('submit', {
				url : '',
				success : function(data) {
					if (data) {
						$.messager.alert('信息提示', '提交成功！', 'info');
						$('#wu-dialog-2').dialog('close');
					} else {
						$.messager.alert('信息提示', '提交失败！', 'info');
					}
				}
			});
		}

		/**
		 * Name 修改记录
		 */
		function edit() {
			$('#wu-form-2').form('submit', {
				url : '',
				success : function(data) {
					if (data) {
						$.messager.alert('信息提示', '提交成功！', 'info');
						$('#wu-dialog-2').dialog('close');
					} else {
						$.messager.alert('信息提示', '提交失败！', 'info');
					}
				}
			});
		}

		/**
		 * Name 删除记录
		 */
		function remove() {
			$.messager.confirm('信息提示', '确定要删除该记录？', function(result) {
				if (result) {
					var items = $('#wu-datagrid-2').datagrid('getSelections');
					var ids = [];
					$(items).each(function() {
						ids.push(this.productid);
					});
					//alert(ids);return;
					$.ajax({
						url : '',
						data : '',
						success : function(data) {
							if (data) {
								$.messager.alert('信息提示', '删除成功！', 'info');
							} else {
								$.messager.alert('信息提示', '删除失败！', 'info');
							}
						}
					});
				}
			});
		}

		/**
		 * Name 打开添加窗口
		 */
		function openAdd() {
			$('#wu-form-2').form('clear');
			$('#wu-dialog-2').dialog({
				closed : false,
				modal : true,
				title : "添加信息",
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : add
				}, {
					text : '取消',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#wu-dialog-2').dialog('close');
					}
				} ]
			});
		}

		/**
		 * Name 打开修改窗口
		 */
		function openEdit() {
			$('#wu-form-2').form('clear');
			var item = $('#wu-datagrid-2').datagrid('getSelected');
			//alert(item.productid);return;
			$.ajax({
				url : '',
				data : '',
				success : function(data) {
					if (data) {
						$('#wu-dialog-2').dialog('close');
					} else {
						//绑定值
						$('#wu-form-2').form('load', data)
					}
				}
			});
			$('#wu-dialog-2').dialog({
				closed : false,
				modal : true,
				title : "修改信息",
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : edit
				}, {
					text : '取消',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#wu-dialog-2').dialog('close');
					}
				} ]
			});
		}

		/**
		 * Name 分页过滤器
		 */
		function pagerFilter(data) {
			if (typeof data.length == 'number'
					&& typeof data.splice == 'function') {// is array                
				data = {
					total : data.length,
					rows : data
				}
			}
			var dg = $(this);
			var opts = dg.datagrid('options');
			var pager = dg.datagrid('getPager');
			pager.pagination({
				onSelectPage : function(pageNum, pageSize) {
					opts.pageNumber = pageNum;
					opts.pageSize = pageSize;
					pager.pagination('refresh', {
						pageNumber : pageNum,
						pageSize : pageSize
					});
					dg.datagrid('loadData', data);
				}
			});
			if (!data.originalRows) {
				data.originalRows = (data.rows);
			}
			var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
			var end = start + parseInt(opts.pageSize);
			data.rows = (data.originalRows.slice(start, end));
			return data;
		}

		var para = "${testCaseList}";
		var url = "${pageContext.request.contextPath}" + "/appointment.do/getAppointmentList";
		
		//alert(url);
		$('#wu-datagrid-2').datagrid({
							url : url,
							//fitColumns:true,
							fit : true,
							striped : true,
							loadMsg : "正在加载中......",
							//loadFilter:pagerFilter,
							rownumbers : true,
							singleSelect : true,
							checkOnSelect : false,
							selectOnCheck : false,
							pageNumber : 1,
							pageSize : 5,
							pageList : [ 5, 10, 15, 20, 50 ],
							pagination : true,
							multiSort : true,
							idField : 'id',
							frozenColumns : [ [ //冻结列特性 ,不要与fitColumns 特性一起使用
							{
								field : 'cx',
								checkbox : true
							}, {
								field : 'id',
								title : '用例序号',
								width : 60

							}, {
								field : 'taocan',
								title : "用例名称",
								width : 190,
							} ] ],
							columns : [ [
									/* { field:'id',title:'用例序号',width:30}, */
									/* { field:'name',title:'用例名称',width:150}, */
									{
										field : 'taocan',
										title : '编号',
										width : 180
									},
									{
										field : 'username',
										title : '版本',
										width : 180
									}

							] ],
							loadFilter: function(data){
								data.rows.forEach(function(e){
									if(e.taskStatus == "RUNNING"){
										runningTasks[e.id] = '';
									}
								});
								return data;
							},
							//events.
							onEndEdit : function(index, row) {

							},
							onBeforeEdit : function(index, row) {
								row.editing = true;
								$(this).datagrid('refreshRow', index);
							},
							onAfterEdit : function(index, row) {
								//commit the changed to server.
								submitScriptInfo(this, index);
								row.editing = false;
								$(this).datagrid('refreshRow', index);
							},
							onCancelEdit : function(index, row) {
								row.editing = false;
								$(this).datagrid('refreshRow', index);
							}
							
						});

		function getRowIndex(target) {
			var tr = $(target).closest('tr.datagrid-row');
			return parseInt(tr.attr('datagrid-row-index'));
		}
		function editrow(target) {
			$('#wu-datagrid-2').datagrid('beginEdit', getRowIndex(target));
		}
		function deleterow(target) {
			$.messager.confirm('Confirm', 'Are you sure?', function(r) {
				if (r) {
					$('#wu-datagrid-2').datagrid('deleteRow',
							getRowIndex(target));
				}
			});
		}
		function execrow(target) {
			var idx = getRowIndex(target);
			execTestCase('#wu-datagrid-2', idx);
		}
		function saverow(target) {
			$('#wu-datagrid-2').datagrid('endEdit', getRowIndex(target));

		}
		function cancelrow(target) {
			$('#wu-datagrid-2').datagrid('cancelEdit', getRowIndex(target));
		}
	</script>
</body>
</html>