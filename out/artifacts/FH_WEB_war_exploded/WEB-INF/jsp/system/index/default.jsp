<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<%--<div class="col-xs-12">--%>
							<%----%>
							<%--<div>--%>
							<%--<h3 class="header smaller lighter green">更新网站前台页面</h3>--%>
							<%--<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">--%>
								<%--<tr>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-purple btn-xs" onclick="proAll();">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 12px;">--%>
										<%--<h4 class="green smaller lighter">一键生成所有页面</h4>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 12px;" colspan="10" class="center">--%>
										<%--<h4 class="green smaller lighter">--%>
											<%--<b>--%>
												<%--<a class="btn btn-xs btn-success" title="编辑" onclick="openIndex();">--%>
													<%--访问网站首页--%>
												<%--</a>--%>
											<%--</b>--%>
										<%--</h4>--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proHome();" id="proHome">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">网站首页</h4>--%>
									<%--</td>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proAboutus();" id="proAboutus">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">关于我们页面</h4>--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proProduct();" id="proProduct">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">产品案例页面</h4>--%>
									<%--</td>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proCooperation();" id="proCooperation">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">合作共赢页面</h4>--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proNews();" id="proNews">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">新闻动态页面</h4>--%>
									<%--</td>--%>
									<%--<td style="width:150px;" class="center">--%>
									<%--<button class="btn btn-app btn-primary btn-xs" onclick="proContactus();" id="proContactus">--%>
												<%--<i class="ace-icon fa fa-print bigger-160"></i>--%>
												<%--生成--%>
									<%--</button>--%>
									<%--</td>--%>
									<%--<td style="padding-top: 19px;">--%>
										<%--<h4 class="green smaller lighter">联系我们页面</h4>--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%----%>
							<%--<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">--%>
								<%--<tr>--%>
									<%--<td class="center">模版1--%>
										<%--<img style="cursor:pointer;" alt="模版1" src="static/images/mo1.png" width="200px" onclick="setMoban('createHtml')">--%>
										<%--<input type="radio" id="moban1" name="moban"  onclick="setMoban('createHtml')"/>--%>
									<%--</td>--%>
									<%--<td class="center">模版2--%>
										<%--<img style="cursor:pointer;" alt="模版1" src="static/images/mo2.png" width="200px"  onclick="setMoban('createHtml2')">--%>
										<%--<input type="radio" id="moban2" name="moban" onclick="setMoban('createHtml2')" />--%>
									<%--</td>--%>
									<%--<td class="center">模版3--%>
										<%--<img style="cursor:pointer;" alt="模版3" src="static/images/mo3.png" width="169px"  onclick="setMoban('createHtml3')">--%>
										<%--<input type="radio" id="moban3" name="moban" onclick="setMoban('createHtml3')" />--%>
									<%--</td>--%>
									<%--<td class="center">模版4--%>
										<%--<img style="cursor:pointer;" alt="模版4" src="static/images/mo4.png" width="179px"  onclick="setMoban('createHtml4')">--%>
										<%--<input type="radio" id="moban4" name="moban" onclick="setMoban('createHtml4')" />--%>
									<%--</td>--%>
									<%--<td class="center">模版5--%>
										<%--<img style="cursor:pointer;" alt="模版5" src="static/images/mo5.png" width="179px"  onclick="setMoban('createHtml5')">--%>
										<%--<input type="radio" id="moban5" name="moban" onclick="setMoban('createHtml5')" />--%>
									<%--</td>--%>
								<%--</tr>--%>
							<%--<table>--%>
							<%----%>
							<%--</table>--%>
							<%----%>
							<%--</div>--%>
							<%----%>
						<%--</div>--%>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		
		$(top.hangge());
		
		//定位当前模版
		$(function(){
			var nowMoban = "${pd.moban}";
			if("createHtml" == nowMoban){
				$("#moban1").prop("checked", "checked");
			}else if("createHtml2" == nowMoban){
				$("#moban2").prop("checked", "checked");
			}else if("createHtml3" == nowMoban){
				$("#moban3").prop("checked", "checked");
			}else if("createHtml4" == nowMoban){
				$("#moban4").prop("checked", "checked");
			}else if("createHtml5" == nowMoban){
				$("#moban5").prop("checked", "checked");
			}
		});
		
		//选模版
		function setMoban(value){
			
			if("createHtml" == value){
				$("#moban1").prop("checked", "checked");
			}else if("createHtml2" == value){
				$("#moban2").prop("checked", "checked");
			}
			else if("createHtml3" == value){
				$("#moban3").prop("checked", "checked");
			}
			else if("createHtml4" == value){
				$("#moban4").prop("checked", "checked");
			}
			else if("createHtml5" == value){
				$("#moban5").prop("checked", "checked");
			}
			
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/setMoban.do',
		    	data: {moban:value,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					proAll();
					top.hangge();
				}
			});
		}
		
		//访问网站首页
		function openIndex(){
			window.open("<%=basePath%>"); 
		}
		
		//一键生成所有页面
		function proAll(){
			proHome();
			proCooperation();
			proAboutus();
			proProduct();
			proNews();
			proContactus();
		}
		
		//生成首页
		function proHome(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proHome.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proHome").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
		
		//生成合作共赢页面
		function proCooperation(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proCooperation.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proCooperation").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
		
		//生成关于我们页面
		function proAboutus(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proAboutus.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proAboutus").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
		
		//生成产品案例页面
		function proProduct(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proProduct.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proProduct").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
		
		//生成新闻动态页面
		function proNews(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proNews.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proNews").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
		
		//生成联系我们页面
		function proContactus(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createHtml/proContactus.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#proContactus").tips({
							side:3,
				            msg:'生成完毕',
				            bg:'#AE81FF',
				            time:5
				        });
					 }
					top.hangge();
				}
			});
		}
	</script>
</body>
</html>