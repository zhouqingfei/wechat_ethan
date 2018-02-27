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

	<table style="padding-top:0px;" id="appointmentsDg" class="easyui-datagrid" toolbar="#wu-toolbar-2"></table>

	
	<script type="text/javascript">
		//var url = "${pageContext.request.contextPath}" + "/appointment.do/getAppointmentList";
		var url = "${pageContext.request.contextPath}" + "/appointment.do/getAppointmentList";
		$('#appointmentsDg').datagrid({
							idField:"id",
							url : url,
							height:400,
							loadMsg:"数据正在加载中......",
							rownumbers:true,
							striped:true,
							fitColumns:true,
							singleSelect:true,
							columns:[[
								{
									field:"id",
									title:"订单编号",
									width:80
								},
								{
									field:"userName",
									title:"姓名",
									width:80
								},
								{
									field:"telephone",
									title:"电话",
									width:80
								},
								{
									field:"date",
									title:"日期",
									width:80
								},
								{
									field:"time",
									title:"时间",
									width:80
								},
								{
									field:"fromDes",
									title:"起点",
									width:80
								},
								{
									field:"toDes",
									title:"终点",
									width:80
								},
								{
									field:"note",
									title:"备注",
									width:80
								}
							]],
							pagination:true,
							pageSize:10,
							pageList:[10,20,40,50]
						
		 });
	</script>
</body>
</html>