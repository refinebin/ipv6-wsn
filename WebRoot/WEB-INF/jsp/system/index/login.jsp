<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="static/login/css/shards.min.css">
<link rel="stylesheet" href="static/login/css/shards-demo.css?v=1.1.0">

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="static/login/js/jquery-1.5.1.min.js"></script>
<!-- 软键盘控件start -->
<link href="static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/>
<!-- 软键盘控件end -->
 <style type="text/css">
    /*
   body{
    -webkit-transform: rotate(-3deg);
    -moz-transform: rotate(-3deg);
    -o-transform: rotate(-3deg);
	padding-top:20px;
    }
    */
      .cavs{
    	z-index:1;
    	position: fixed;
    	width:95%;
    	margin-left: 20px;
    	margin-right: 20px;
    }
  </style>
  <script>
  		//window.setTimeout(showfh,3000); 
  		var timer;
		function showfh(){
			fhi = 1;
			//关闭提示晃动屏幕，注释掉这句话即可
			// timer = setInterval(xzfh2, 10);
		};
		var current = 0;
		function xzfh(){
			current = (current)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current>360){current = 0;}
		};
		var fhi = 1;
		var current2 = 1;
		function xzfh2(){
			if(fhi>50){
				document.body.style.transform = 'rotate(0deg)';
				clearInterval(timer);
				return;
			}
			current = (current2)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current2 == 1){current2 = -1;}else{current2 = 1;}
			fhi++;
		};
	</script>
</head>
<body>
<div class="loader"><div class="page-loader"></div></div>

<!-- Floating Shards -->
<img src="static/login/images/shard-1-5x-3.png" alt="Shard" class="shard">

<!-- Welcome Section -->
<div class="welcome d-flex justify-content-center flex-column">
	<div class="inner-wrapper mt-auto mb-auto">
		<h2 class="slide-in">高校实验室火灾主动预警系统</h2>
		<p class="slide-in">Be as solid as rocks.</p>
		<div class="action-links slide-in">
			<div class="row mb-2">
				<div class="col-12">
					<div id="windows1">
						<div id="loginbox" >
							<form action="" method="post" name="loginForm" id="loginForm">
								<div class="control-group">
									<div class="controls">
										<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
										</div>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png" /></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
										</div>
									</div>
								</div>
								<div style="float:right;padding-right:10%;">
									<div style="float: left;margin-top:3px;margin-right:2px;">
										<font color="white">记住密码</font>
									</div>
									<div style="float: left;">
										<input name="form-field-checkbox" id="saveid" type="checkbox"
											   onclick="savePaw();" style="padding-top:0px;" />
									</div>
								</div>
								<div class="form-actions">
									<div style="width:86%;padding-left:8%;">

										<div style="float: left;padding-top:2px;">
											<i><img src="static/login/yan.png" /></i>
										</div>
										<div style="float: left;" class="codediv">
											<input type="text" name="code" id="code" class="login_code"
												   style="height:16px; padding-top:4px;" />
										</div>
										<div style="float: left;">
											<i><img style="height:22px;" id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
										</div>
										<c:if test="${pd.isZhuce == 'yes' }">
											<span class="pull-right" style="padding-right:3%;"><a href="javascript:changepage(1);" class="btn btn-success">注册</a></span>
										</c:if>
										<span class="pull-right"><a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">登录</a></span>
									</div>
								</div>
							</form>
							<div class="controls">
								<div class="main_input_box">
									<font color="white"><span id="nameerr">Copyright © FH Admin qq313596790 2100</span></font>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product-by">
		<a href="#" target="_blank">
			<!--<p>A Product By</p>-->
			<!--<img src="https://dgc2qnsehk7ta.cloudfront.net/general/designrevision-logo.png" alt="DesignRevision - Making powerful tools for web professionals">-->
		</a>
	</div>
</div>
	<c:if test="${pd.isMusic == 'yes' }">
	<div style="display: none">
	    <audio src="static/login/music/fh1.mp3" autoplay=""></audio>
	</div>	
	</c:if>

	<%--<div id="templatemo_banner_slide" class="container_wapper">--%>
		<%--<div class="camera_wrap camera_emboss" id="camera_slide">--%>
			<%--<!-- 背景图片 -->--%>
			<%--<c:choose>--%>
				<%--<c:when test="${not empty pd.listImg}">--%>
					<%--<c:forEach items="${pd.listImg}" var="var" varStatus="vs">--%>
						<%--<div data-src="static/login/images/${var.FILEPATH }"></div>--%>
					<%--</c:forEach>--%>
				<%--</c:when>--%>
				<%--<c:otherwise>--%>
					<%--<div data-src="static/login/images/banner_slide_01.jpg"></div>--%>
					<%--<div data-src="static/login/images/banner_slide_02.jpg"></div>--%>
					<%--<div data-src="static/login/images/banner_slide_03.jpg"></div>--%>
					<%--<div data-src="static/login/images/banner_slide_04.jpg"></div>--%>
					<%--<div data-src="static/login/images/banner_slide_05.jpg"></div>--%>
				<%--</c:otherwise>--%>
			<%--</c:choose>--%>
		<%--</div>--%>
		<%--<!-- #camera_wrap_3 -->--%>
	<%--</div>--%>

	<script type="text/javascript">
		//服务器校验
		function severCheck(){
			if(true){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="<%=basePath%>main/index";
						}else if("usererror" == data.result){
						    alert("用户名或密码有误")
							// $("#loginname").tips({
							// 	side : 1,
							// 	msg : "用户名或密码有误",
							// 	bg : '#FF5080',
							// 	time : 15
							// });
							// showfh();
							// $("#loginname").focus();
						}else if("codeerror" == data.result){
                            alert("验证码输入有误");
							// $("#code").tips({
							// 	side : 1,
							// 	msg : "验证码输入有误",
							// 	bg : '#FF5080',
							// 	time : 15
							// });
							// showfh();
							// $("#code").focus();
						}else{
						    alert("缺少参数")
							// $("#loginname").tips({
							// 	side : 1,
							// 	msg : "缺少参数",
							// 	bg : '#FF5080',
							// 	time : 15
							// });
							// showfh();
							// $("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
			$("#zcodeImg").bind("click", changeCode2);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		function changeCode2() {
			$("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {
			alert("1");
			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#code").focus();
				alert("3")
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});
            alert("2");
			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	//js  日期格式
	function date2str(x,y) {
	     var z ={y:x.getFullYear(),M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	     return y.replace(/(y+|M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-(v.length>2?v.length:2))});
	 	};
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/login/js/bootstrap.min.js"></script>
	<%--<script src="static/js/jquery-1.7.2.js"></script>--%>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script src="static/login/js/ban.js"></script>
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	
	<!-- 软键盘控件start -->
	<script type="text/javascript" src="static/login/keypad/js/form/keypad.js"></script>
	<script type="text/javascript" src="static/login/keypad/js/framework.js"></script>
	<!-- 软键盘控件end -->
	<script src="js/buttons.js"></script>
	<script src="static/login/js/jquery-3.2.1.min.js" ></script>
	<script src="static/login/js/demo.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script src="js/shards.min.js"></script>
</body>

</html>