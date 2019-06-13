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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<form action="ourbusiness/list.do" method="post" name="Form" id="Form">
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:10px;">	
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<th class="center" style="width:100px;">介绍上</th>
											<td>${var.TITLE1}</td>
										</tr>
										<tr>
											<th class="center">介绍下</th>
											<td>${var.TITLE2}</td>
										</tr>
										<tr>
											<th class="center">内容上</th>
											<td>${var.CONTENT1}</td>
										</tr>
										<tr>
											<th class="center">内容上</th>
											<td>${var.CONTENT2}</td>
										</tr>
										<tr>
											<th class="center">内容链接</th>
											<td>${var.TOURL}</td>
										</tr>
										<tr>
											<th class="center">(模版2)其它1</th>
											<td>${var.OTHER1}</td>
										</tr>
										<tr>
											<th class="center">(模版2)其它2</th>
											<td>${var.OTHER2}</td>
										</tr>
										<tr>
											<th class="center">(模版2,5)图1</th>
											<td  onmouseover="showTU('IMG1','yulantu1');" onmouseout="hideTU('yulantu1');">
											${var.IMG1}
											<input type="hidden" name="IMG1" id="IMG1" value="${var.IMG1}">
											<div class="yulantu" id="yulantu1"></div>
											</td>
										</tr>
										<tr>
											<th class="center">(模版2,5)图2</th>
											<td  onmouseover="showTU('IMG2','yulantu2');" onmouseout="hideTU('yulantu2');">
											${var.IMG2}
											<input type="hidden" name="IMG2" id="IMG2" value="${var.IMG2}">
											<div class="yulantu" id="yulantu2"></div>
											</td>
										</tr>
										<tr>
											<th class="center">(模版5)图3</th>
											<td  onmouseover="showTU('IMG3','yulantu3');" onmouseout="hideTU('yulantu3');">
											${var.IMG1}
											<input type="hidden" name="IMG3" id="IMG3" value="${var.IMG3}">
											<div class="yulantu" id="yulantu3"></div>
											</td>
										</tr>
										<tr>
											<th class="center">(模版5)图4</th>
											<td  onmouseover="showTU('IMG4','yulantu4');" onmouseout="hideTU('yulantu4');">
											${var.IMG2}
											<input type="hidden" name="IMG4" id="IMG4" value="${var.IMG4}">
											<div class="yulantu" id="yulantu4"></div>
											</td>
										</tr>
										<tr>
											<th class="center">(模版3)标题</th>
											<td>${var.M3_TITLE}</td>
										</tr>
										<tr>
											<th class="center">(模版3)内容1</th>
											<td>${var.M3_CONTENT1}</td>
										</tr>
										<tr>
											<th class="center">(模版3)内容2</th>
											<td>${var.M3_CONTENT2}</td>
										</tr>
										<tr>
											<th class="center">(模版3)内容3</th>
											<td>${var.M3_CONTENT3}</td>
										</tr>
										<tr>
											<th class="center">操作</th>
											<td>
												<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.OURBUSINESS_ID}');">
													<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
												</a>
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
			 diag.URL = '<%=basePath%>ourbusiness/goEdit.do?OURBUSINESS_ID='+Id;
			 diag.Width = 800;
			 diag.Height = 615;
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