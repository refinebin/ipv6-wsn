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
					
					<form action="information/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INFORMATION_ID" id="INFORMATION_ID" value="${pd.INFORMATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">网站名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="30" placeholder="这里输入网站名称" title="网站名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关键词:</td>
								<td><input type="text" name="KEYWORDS" id="KEYWORDS" value="${pd.KEYWORDS}" maxlength="100" placeholder="这里输入关键词" title="关键词" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="200" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">logo:</td>
								<td><input type="text" name="LOGO" id="LOGO" value="${pd.LOGO}" maxlength="100" placeholder="这里输入logo" title="logo" style="width:86%;" onmouseover="showTU('LOGO','yulantu1');" onmouseout="hideTU('yulantu1');"/>
								<div class="yulantu" id="yulantu1"></div>
									<a class="btn btn-xs btn-info" style="margin-top: -5px;" title="选择" onclick="xuanTp('LOGO');">选择 </a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="20" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="50" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">QQ:</td>
								<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}" maxlength="20" placeholder="这里输入QQ" title="QQ" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">传真:</td>
								<td><input type="text" name="FAX" id="FAX" value="${pd.FAX}" maxlength="20" placeholder="这里输入传真" title="传真" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">官网:</td>
								<td><input type="text" name="WEBURL" id="WEBURL" value="${pd.WEBURL}" maxlength="50" placeholder="这里输入官网" title="官网" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="100" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版权:</td>
								<td><input type="text" name="COPYRIGHT" id="COPYRIGHT" value="${pd.COPYRIGHT}" maxlength="20" placeholder="这里输入版权" title="版权" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">技术支持:</td>
								<td><input type="text" name="TECHNOLOGY" id="TECHNOLOGY" value="${pd.TECHNOLOGY}" maxlength="20" placeholder="这里输入技术支持" title="技术支持" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备案:</td>
								<td><input type="text" name="BEIAN" id="BEIAN" value="${pd.BEIAN}" maxlength="15" placeholder="这里输入备案" title="备案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关于我们(上):</td>
								<td><input type="text" name="ABOUTUS1" id="ABOUTUS1" value="${pd.ABOUTUS1}" maxlength="255" placeholder="这里输入关于我们(上)" title="关于我们(上)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关于我们(下):</td>
								<td><input type="text" name="ABOUTUS2" id="ABOUTUS2" value="${pd.ABOUTUS2}" maxlength="255" placeholder="这里输入关于我们(下)" title="关于我们(下)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最新消息(1):</td>
								<td><input type="text" name="NEW1" id="NEW1" value="${pd.NEW1}" maxlength="255" placeholder="这里输入最新消息(1)" title="最新消息(1)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最新消息(2):</td>
								<td><input type="text" name="NEW2" id="NEW2" value="${pd.NEW2}" maxlength="255" placeholder="这里输入最新消息(2)" title="最新消息(2)" style="width:98%;"/></td>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入网站名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
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
			if($("#KEYWORDS").val()==""){
				$("#KEYWORDS").tips({
					side:3,
		            msg:'请输入关键词',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KEYWORDS").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#LOGO").val()==""){
				$("#LOGO").tips({
					side:3,
		            msg:'请输入logo',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOGO").focus();
			return false;
			}
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEL").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#QQ").val()==""){
				$("#QQ").tips({
					side:3,
		            msg:'请输入QQ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QQ").focus();
			return false;
			}
			if($("#FAX").val()==""){
				$("#FAX").tips({
					side:3,
		            msg:'请输入传真',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAX").focus();
			return false;
			}
			if($("#WEBURL").val()==""){
				$("#WEBURL").tips({
					side:3,
		            msg:'请输入官网',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WEBURL").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#COPYRIGHT").val()==""){
				$("#COPYRIGHT").tips({
					side:3,
		            msg:'请输入版权',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COPYRIGHT").focus();
			return false;
			}
			if($("#TECHNOLOGY").val()==""){
				$("#TECHNOLOGY").tips({
					side:3,
		            msg:'请输入技术支持',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TECHNOLOGY").focus();
			return false;
			}
			if($("#BEIAN").val()==""){
				$("#BEIAN").tips({
					side:3,
		            msg:'请输入备案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BEIAN").focus();
			return false;
			}
			if($("#ABOUTUS1").val()==""){
				$("#ABOUTUS1").tips({
					side:3,
		            msg:'请输入关于我们',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ABOUTUS1").focus();
			return false;
			}
			if($("#NEW1").val()==""){
				$("#NEW1").tips({
					side:3,
		            msg:'请输入最新消息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NEW1").focus();
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