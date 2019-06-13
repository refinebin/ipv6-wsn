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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">


								<!-- 检索  -->
								<form action="chartsstatistics/pvcharts.do" method="post" name="Form" id="Form" style="padding-top: 13px;">
								<table style="margin-top:5px;">
									<tr>
										<td style="padding-left:2px;"><input class="span10 date-picker" name="CDATE" id="CDATE"  value="${CDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/></td>
										<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
									</tr>
								</table>
								<!-- 检索  -->
								</form>


								<div class="span6" style="padding-top: 13px;">
									<div class="tabbable">
							            <ul class="nav nav-tabs" id="myTab">
							              <li class="active"><a data-toggle="tab" href="#home"><i class="green icon-home bigger-110"></i>折线图</a></li>
							              <li><a data-toggle="tab" href="#profile"><i class="green icon-cog bigger-110"></i>柱状图</a></li>
							              <li><a><i class="green icon-cog bigger-110"></i>总点击量：${ZPVCOUNT}</a></li>
							            </ul>
							            <div class="tab-content">
										  <div id="home" class="tab-pane in active">
											<table style="width:865px;" border="0px;">
												<tr>
													<td>
														<jsp:include
														page="../../FusionChartsHTMLRenderer.jsp" flush="true">
														<jsp:param name="chartSWF" value="static/FusionCharts/Line.swf" />
														<jsp:param name="strURL" value="" />
														<jsp:param name="strXML" value="${str1}" />
														<jsp:param name="chartId" value="myNext" />
														<jsp:param name="chartWidth" value="860" />
														<jsp:param name="chartHeight" value="300" />
														<jsp:param name="debugMode" value="false" />
														</jsp:include>
													</td>
												</tr>
											</table>
										  </div>
										  <div id="profile" class="tab-pane">
											 <table style="width:865px;" border="0px;">
												<tr>
													<td>
														<jsp:include
														page="../../FusionChartsHTMLRenderer.jsp" flush="true">
														<jsp:param name="chartSWF" value="static/FusionCharts/Column3D.swf" />
														<jsp:param name="strURL" value="" />
														<jsp:param name="strXML" value="${str2}" />
														<jsp:param name="chartId" value="myNext" />
														<jsp:param name="chartWidth" value="860" />
														<jsp:param name="chartHeight" value="300" />
														<jsp:param name="debugMode" value="false" />
														</jsp:include>
													</td>
												</tr>
											</table>
										  </div>
							            </div>
									</div>
								 </div><!--/span-->
								 
								 
								 <div class="span6" style="padding-top: 13px;">
									<div class="tabbable">
							            <ul class="nav nav-tabs" id="myTab">
							              <li class="active"><a data-toggle="tab" href="#home2"><i class="green icon-home bigger-110"></i>折线图</a></li>
							              <li><a data-toggle="tab" href="#profile2"><i class="green icon-cog bigger-110"></i>柱状图</a></li>
							              <li><a data-toggle="tab" href="#profile3"><i class="green icon-cog bigger-110"></i>饼状图</a></li>
							              <li><a><i class="green icon-cog bigger-110"></i>总访客：${ZIPCOUNT}</a></li>
							            </ul>
							            <div class="tab-content">
										  <div id="home2" class="tab-pane in active">
											<table style="width:865px;" border="0px;">
												<tr>
													<td>
														<jsp:include
														page="../../FusionChartsHTMLRenderer.jsp" flush="true">
														<jsp:param name="chartSWF" value="static/FusionCharts/Line.swf" />
														<jsp:param name="strURL" value="" />
														<jsp:param name="strXML" value="${str3}" />
														<jsp:param name="chartId" value="myNext" />
														<jsp:param name="chartWidth" value="860" />
														<jsp:param name="chartHeight" value="300" />
														<jsp:param name="debugMode" value="false" />
														</jsp:include>
													</td>
												</tr>
											</table>
										  </div>
										  <div id="profile2" class="tab-pane">
											 <table style="width:865px;" border="0px;">
												<tr>
													<td>
														<jsp:include
														page="../../FusionChartsHTMLRenderer.jsp" flush="true">
														<jsp:param name="chartSWF" value="static/FusionCharts/Column3D.swf" />
														<jsp:param name="strURL" value="" />
														<jsp:param name="strXML" value="${str4}" />
														<jsp:param name="chartId" value="myNext" />
														<jsp:param name="chartWidth" value="860" />
														<jsp:param name="chartHeight" value="300" />
														<jsp:param name="debugMode" value="false" />
														</jsp:include>
													</td>
												</tr>
											</table>
										  </div>
										  <div id="profile3" class="tab-pane">
											  <table style="width:865px;" border="0px;">
												<tr>
													<td>
														<jsp:include
														page="../../FusionChartsHTMLRenderer.jsp" flush="true">
														<jsp:param name="chartSWF" value="static/FusionCharts/Pie3D.swf" />
														<jsp:param name="strURL" value="" />
														<jsp:param name="strXML" value="${str5}" />
														<jsp:param name="chartId" value="myNext" />
														<jsp:param name="chartWidth" value="860" />
														<jsp:param name="chartHeight" value="300" />
														<jsp:param name="debugMode" value="false" />
														</jsp:include>
													</td>
												</tr>
											</table>
										  </div>
							            </div>
									</div>
								 </div><!--/span-->
								 
						</div>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
	</script>


</body>
</html>