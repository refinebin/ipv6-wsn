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
					
					<form action="image/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="IMAGE_ID" id="IMAGE_ID" value="${pd.IMAGE_ID}"/>
						<input type="hidden" name="TYPE" id="TYPE" value="${pd.TYPE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">路径:</td>
								<td><input type="text" name="IMGURL" id="IMGURL" value="${pd.IMGURL}" maxlength="255" placeholder="这里输入路径" title="路径" style="width:85%;" onmouseover="showTU('IMGURL','yulantu1');" onmouseout="hideTU('yulantu1');"/>
									<div class="yulantu" id="yulantu1"></div>
									<a class="btn btn-xs btn-info" style="margin-top: -5px;" title="选择" onclick="xuanTp('IMGURL');">选择 </a>
								</td>
							</tr>
							<tr>
								<td colspan="10">
								<p class="text-warning bigger-110 orange">节约服务器资源提高图片加载速度，可用图片外链,推荐用免费的新浪相册，把图片上传到新浪相册，然后把图片地址复制过来
								<a target="_blank" href="http://photo.weibo.com/">新浪相册</a>
								</p>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">链接:</td>
								<td><input type="text" name="TOURL" id="TOURL" value="${pd.TOURL}" maxlength="255" placeholder="这里输入链接" title="链接" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10"><p class="text-warning bigger-110 orange">提示:在新闻动态里添加一篇文章作详情页,链接链到那篇文章</p></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序:</td>
								<td><input type="text" name="FORDER" id="FORDER" value="${pd.FORDER}" maxlength="11" placeholder="这里输入排序" title="排序" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="BZ" id="BZ" value="${pd.BZ}" maxlength="2000" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#IMGURL").val()==""){
				$("#IMGURL").tips({
					side:3,
		            msg:'请输入路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMGURL").focus();
			return false;
			}
			if($("#FORDER").val()==""){
				$("#FORDER").tips({
					side:3,
		            msg:'请输入排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FORDER").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//选择图片
		function xuanTp(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择图片";
			 diag.URL = '<%=basePath%>pictures/listfortc.do';
			 diag.Width = 860;
			 diag.Height = 680;
			 diag.CancelEvent = function(){ //关闭事件
				 $("#"+ID).val('<%=basePath%>'+diag.innerFrame.contentWindow.document.getElementById('xzvalue').value);
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