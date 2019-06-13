<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
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
					
					<form action="contactus/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONTACTUS_ID" id="CONTACTUS_ID" value="${pd.CONTACTUS_ID}"/>
						<textarea style="display: none;" name="CONTENT" id="CONTENT" >${pd.CONTENT}</textarea>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">经度:</td>
								<td><input type="number" name="LONGITUDE" id="LONGITUDE" value="${pd.LONGITUDE }" maxlength="200" placeholder="这里输入经度" title="经度" style="width:98%;"/></td>
								<td rowspan="2" style="width:79px;">
									<a class="btn btn-app btn-light btn-xs"  onclick="openMap();">
									<i class="ace-icon fa fa-globe"></i>地图选点
									</a>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">纬度:</td>
								<td><input type="number" name="DIMENSION" id="DIMENSION" value="${pd.DIMENSION }" maxlength="200" placeholder="这里输入纬度" title="纬度" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">拉伸</td>
								<td><input type="number" name="PZOOM" id="PZOOM" value="${pd.PZOOM }" maxlength="2" placeholder="这里输入1-30" title="拉伸" style="width:98%;"/></td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td>
								  <script id="editor" type="text/plain" style="width:96%;height:200px;">${pd.CONTENT}</script>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 百度富文本编辑框-->
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			$("#CONTENT").val(getContent());
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function openMap(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="地图";
			 diag.URL ="<%=basePath%>contactus/mapXY.do";
			 diag.Width = 650;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 var DIMENSION  = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_X').value;
				 var LONGITUDE  = diag.innerFrame.contentWindow.document.getElementById('ZUOBIAO_Y').value;
				 if(DIMENSION !='' && LONGITUDE != ''){
					 document.getElementById("DIMENSION").value = DIMENSION;
					 document.getElementById("LONGITUDE").value = LONGITUDE;
				 }
				diag.close();
			 };
			 diag.show();
		}
		
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		//ueditor有标签文本
		function getContent() {
		    var arr = [];
		    arr.push(UE.getEditor('editor').getContent());
		    return arr.join("");
		}
		
		</script>
</body>
</html>