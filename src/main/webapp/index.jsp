<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>测试管理系统</title>
		
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/wu.css"/>
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/icon.css" />
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/contrm.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/jquery-1.8.0.min.js"></script>
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/themes/icon.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>		
		
		<script>
			 var basePath = "${pageContext.request.contextPath}";
		 	 var treeUrl = "${pageContext.request.contextPath}" + "/tree.do/loadTree";    
			 $(function() {
				 	var selectedNodeId;
		            $('#projectTree').tree({
		                url: treeUrl,
		                //checkbox: true,
		                
		                onContextMenu: function(e,node){
							//禁止浏览器的菜单打开
							e.preventDefault();
							$(this).tree('select',node.target);
							$('#projectMenu').menu('show', {
								left: e.pageX,
								top: e.pageY
							});
						},
						onClick:function(node){
							var parentNode=$('#projectTree').tree('getParent',node.target);
							
							var title = parentNode.text + ">" + node.text;
							//alert(parentNode.text);
							var tabUrl;
							//console.info(node);
							if (node.attributes.url) {
								tabUrl = basePath + node.attributes.url;
								//alert(tabUrl);
								addTab(title,tabUrl,title+node.id);
							}
						},

						onLoadSuccess:function(){
							$(this).tree('expand',$(this).tree('getRoot').target);
							if(selectedNodeId != null){
								var selectNode = $('#projectTree').tree('find', selectedNodeId);   
					            $('#projectTree').tree('select', selectNode.target);
							}
						},
						
						onSelect:function(node){
							selectedNodeId = node.id;
							//alert(selectedNodeId);
						}
		            });
		            
			 })
		</script>
		
	</head>

	<body class="easyui-layout">
	    <!--header -->
	    <div class="wu-header" data-options="region:'north',border:false,split:true">
	        <div class="wu-header-left">
	            <h1>有爱搬家后台管理系统</h1>
	        </div>
	        <div class="wu-header-right">
	            <p><strong class="easyui-tooltip" title="2条未读消息">admin</strong>，欢迎您！</p>
	            <p><a href="#">网站首页</a>|<a href="#">帮助中心</a>|<a href="#">安全退出</a></p>
	        </div>
	    </div>
	
	    <!-- idebar -->
	    <div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'">
	        <div class="easyui-accordion" data-options="border:false,fit:true">
	            <div title="后台管理" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">
	                <ul id="projectTree">
	                </ul>
	                
	                <div id="mydiv" title="" class="easyui-dialog" style="width:300px;" closed=true >
		  				<form id="myform" method="post">
	  						<input type="hidden" name="id" value="" />
	  						<input id="parent_id" type="hidden" value="" />
  							<table> 
  								<tr align="center">
  									<td style="padding-left:20px;">名称:</td>
  									<td><input style="width:185px;" type="text" id="name" name="name" value=""/></td>
  								</tr>
  								<tr align="center">
  									<td colspan="2">
  										<a style="margin-left:50px;" id="savebtn" class="easyui-linkbutton">确定</a>
  										<a style="margin-left:10px;" id="cancelbtn" class="easyui-linkbutton">取消</a>
  									</td>
  								</tr>  								  								
  							</table>
		  				</form>	
			  		</div>
	            </div>
	        </div>
	    </div>
		
		<div id="mainPanle" region="center" border="true" border="false">
			<div id="tabs" class="easyui-tabs" fit="true" border="false">
				
			</div> 
		</div>	

	    <!-- footer -->
	    <div class="wu-footer" data-options="region:'south',border:true,split:true">
	        &copy; 版权所有 有爱搬家股份有限公司
	    </div>
	</body>
</html>