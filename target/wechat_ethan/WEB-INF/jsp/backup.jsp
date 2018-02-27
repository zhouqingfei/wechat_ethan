<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/themes/icon.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons.js"></script>
	
		<script>
			$(function(){
				 $("#addUserForm").submit(function(){
					 var username = $("#username").val();
				     var password=$("#password").val();
				     var age = $("#age").val();
					$.ajax({
						 type: "GET",
						 url : "user.do/addUser",
						
						 data: {
							 username:username,
							 password:password,
							 age:age
						 },
						 dataType: "text",
						 contentType : 'application/json; charset=utf-8',
						 success: function(data){
						 	alert("1111" + data);
						 },
						 error:function(){
							 alert("出错");
						 }
					})
					
					return true;
				 })
				 
				 
			})
			
			function register(){
				 	var username = $("#username").val();
			     	var password=$("#password").val();
			     	var age = $("#age").val();
					$.ajax({
						 type: "GET",
						 url : "user.do/addUser",
						 async:false,  // 设置同步方式
					     cache:false,  
						 data: {
							 username:username,
							 password:password,
							 age:age
						 },
						 dataType: "text",
						 contentType : 'application/json; charset=utf-8',
						 success: function(data){
						 	alert("1111" + data);
						 },
						 error:function(){
							 alert("出错");
						 }
					})
				 }
				 
				 function appointment(){
					 	var taocan = $("#taocan").val();
				     	var username=$("#username").val();
				     	var telephone = $("#telephone").val();
				     	var date = $("#date").val();
				     	var time=$("#time").val();
				     	var fromDes = $("#fromDes").val();
				     	var toDes = $("#toDes").val();
				     	var note=$("#note").val();
						$.ajax({
							 type: "GET",
							 //url : "appointment.do/addAppointment",
							 url : "${pageContext.request.contextPath}/appointment.do/addAppointment",
							 async:false,  // 设置同步方式
						     cache:false,  
							 data: {
								 taocan:taocan,
								 username:username,
								 telephone:telephone,
								 date:date,
								 time:time,
								 fromDes:fromDes,
								 toDes:toDes,
								 note:note
							 },
							 dataType: "text",
							 contentType : 'application/json; charset=utf-8',
							 success: function(data){
							 	alert("1111" + data);
							 },
							 error:function(){
								 alert("出错");
							 }
						})
					 }
		</script>
	</head>
	<body>
		<h2>Hello World!</h2>
		<%-- <form id="addUserForm" action="${pageContext.request.contextPath}/user.do/addUser" method="post"> --%>
		<form id="addUserForm">
			姓名<input  id ="username1"/>
			密码<input  id="password" />
			年龄<input  id="age" />
			<input type="button" onclick="register();"></input>
		</form>
		<input type="button" onclick="register();" value="提交" />
		<input id="path" value="${pageContext.request.contextPath}" />
		
			Taocan<input  id="taocan"/>
			UserName<input  id="username" />
			Telephone<input  id="telephone" />
			Date<input  id ="date"/>
			Time<input  id="time" />
			From<input  id="fromDes" />
			To<input  id="toDes" />
			Note<input  id="note" />
			
			<input type="button" onclick="appointment();" value="预约" />
	</body>
</html>
