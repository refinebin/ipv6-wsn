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
<%@ include file="../../system/index/top.jsp"%>
	<style type="text/css">
	.yulantu{
		z-index: 9999999999999999;
		position:absolute;
		border:2px solid #76ACCD;
		display: none;
	}
	</style>
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
						<form action="information/list.do" method="post" name="Form" id="Form">
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<th class="center" width="100">网站名称</th>
											<td>${var.NAME}</td>
										</tr>
										<tr>
											<th class="center">标题</th>
											<td>${var.TITLE}</td>
										</tr>
										<tr>
											<th class="center">关键词</th>
											<td>${var.KEYWORDS}</td>
										</tr>
										<tr>
											<th class="center">描述</th>
											<td>${var.DESCRIPTION}</td>
										</tr>
										<tr>
											<th class="center">logo</th>
											<td  onmouseover="showTU('LOGO','yulantu1');" onmouseout="hideTU('yulantu1');">
											${var.LOGO}
											<input type="hidden" name="LOGO" id="LOGO" value="${var.LOGO}">
											<div class="yulantu" id="yulantu1"></div>
											</td>
										</tr>
										<tr>
											<th class="center">电话</th>
											<td>${var.TEL}</td>
										</tr>
										<tr>
											<th class="center">邮箱</th>
											<td>${var.EMAIL}</td>
										</tr>
										<tr>
											<th class="center">QQ</th>
											<td>${var.QQ}</td>
										</tr>
										<tr>
											<th class="center">传真</th>
											<td>${var.FAX}</td>
										</tr>
										<tr>
											<th class="center">官网</th>
											<td>${var.WEBURL}</td>
										</tr>
										<tr>
											<th class="center">地址</th>
											<td>${var.ADDRESS}</td>
										</tr>
										<tr>
											<th class="center">版权</th>
											<td>${var.COPYRIGHT}</td>
										</tr>
										<tr>
											<th class="center">技术支持</th>
											<td>${var.TECHNOLOGY}</td>
										</tr>
										<tr>
											<th class="center">备案</th>
											<td>${var.BEIAN}</td>
										</tr>
										<tr>
											<th class="center">关于我们(上)</th>
											<td>${var.ABOUTUS1}</td>
										</tr>
										<tr>
											<th class="center">关于我们(下)</th>
											<td>${var.ABOUTUS2}</td>
										</tr>
										<tr>
											<th class="center">最新消息(1)</th>
											<td>${var.NEW1}</td>
										</tr>
										<tr>
											<th class="center">最新消息(2)</th>
											<td>${var.NEW2}</td>
										</tr>
										<tr>
											<th class="center">操作</th>
											<td>
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.INFORMATION_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>information/goEdit.do?INFORMATION_ID='+Id;
			 diag.Width = 600;
			 diag.Height = 750;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//显示图片
		function showTU(ID,TPID){
			 $("#"+TPID).html('<img width="200" src="'+$("#"+ID).val()+'">');
			 $("#"+TPID).show();
		}
		
		//隐藏图片
		function hideTU(TPID){
			 $("#"+TPID).hide();
		}
	</script>

</body>
</html>