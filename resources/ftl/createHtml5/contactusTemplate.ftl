<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-联系我们</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- bootstrap-css -->
<link href="fh_static_5/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->

<!-- css -->
<link rel="stylesheet" href="fh_static_5/css/style.css" type="text/css" media="all" />
<!--// css -->

<!-- font-awesome icons -->
<link href="fh_static_5/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->

<script src="fh_static_5/js/jquery-1.11.1.min.js"></script>
<script src="fh_static_5/js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script> 
<!--[if lt IE 9]>
  <script src="fh_static_5/js/html5shiv.js"></script>
<![endif]-->

   <style type="text/css">
		#allmap {width: 100%;height: 400px;overflow: hidden;margin-bottom:12px}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=40GWXiduhOft266lK4N1dopL"></script>
</head>
<body>
	<!-- banner -->
	<div class="banner about-banner">
		<div class="header">
			<div class="container">
				<div class="header-left">
					<div class="w3layouts-logo">
						<h1>
							<a href="index.html">
								<img alt="${NAME}" title="${NAME}" src="${LOGO}" />
							</a>
						</h1>
					</div>
				</div>
				<div class="header-right">
					<div class="agileinfo-social-grids">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
							<li><a href="#"><i class="fa fa-vk"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="top-nav">
						<nav class="navbar navbar-default">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<!--  包含导航菜单 -->
							<#include "headerTemplate.ftl"> 
							<!--  包含导航菜单 -->	
						</nav>		
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	
	<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
					<div class="w3layouts-contact-form-top">
						<h3>联系我们</h3>
						<p>
							${CONTACTUS}
						</p>
					</div>
				</div>
				<div class="col-md-6 contact-form-right">
					<div class="contact-form-top">
						<h3>留言给我们 </h3>
					</div>
					<div class="agileinfo-contact-form-grid">
							<input type="text" id="NAME" name="NAME" placeholder="姓名" required="">
							<input type="email" id="EMAIL" name="EMAIL" placeholder="邮箱" required="">
							<input type="text" id="ADDRESS" name="ADDRESSESS" placeholder="地址" required="">
							<textarea id="LCONTENT" name="LCONTENT" placeholder="内容" required=""></textarea>
							<button class="btn1" onclick="save()">提交</button>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			<div class="w3agile-map">
				<div id="allmap"></div>
			</div>
		</div>
	</div>
	<!-- //contact -->
	
	<!-- footer -->
	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->
	<!-- //footer -->
	<!-- copyright -->

	<script src="fh_static_5/js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="fh_static_5/js/move-top.js"></script>
	<script type="text/javascript" src="fh_static_5/js/easing.js"></script>
	<!-- parallax -->
	<script type="text/javascript">
     	$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
    </script>
	<!-- //parallax -->
	
	<script type="text/javascript">
		$(window).load(function() {
			$("#index").addClass("list-border"); 
			$("#contactus").addClass("active"); 
		});
		
		function save(){
			var NAME = $("#NAME").val();
			var EMAIL = $("#EMAIL").val();
			var ADDRESS = $("#ADDRESS").val();
			var LCONTENT = $("#LCONTENT").val();
			if("" == NAME){
				alert("请填写姓名");
				$("#NAME").focus();
				return false;
			}
			if("" == EMAIL){
				alert("请填写邮箱");
				$("#EMAIL").focus();
				return false;
			}
			if("" == LCONTENT){
				alert("请填写内容");
				$("#LCONTENT").focus();
				return false;
			}
			$.ajax({
				type: "POST",
				url: 'web/saveLeavemsg.do',
		    	data: {NAME:NAME,EMAIL:EMAIL,ADDRESS:ADDRESS,LCONTENT:LCONTENT,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("00" == data.result){
					 	$("#NAME").val("");
						$("#EMAIL").val("");
						$("#ADDRESS").val("");
						$("#LCONTENT").val("");
						alert("提交成功");
					 }
				}
			});
		}
	</script>
	
	<script type="text/javascript">
		// 百度地图API功能
		var map = new BMap.Map("allmap");
		map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
		
		map.addControl(new BMap.ScaleControl());                    // 添加默认比例尺控件
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));                    // 左上
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));                    // 右上
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));                    // 左下
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));                    // 右下

		map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
		map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}));  //右上角，仅包含平移和缩放按钮
		map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN}));  //左下角，仅包含平移按钮
		map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  //右下角，仅包含缩放按钮
		
		//创建跳动的位置图标
		var point = new BMap.Point(${LONGITUDE}, ${DIMENSION});
		map.centerAndZoom(point, ${PZOOM});
		var marker = new BMap.Marker(point);  // 创建标注
		map.addOverlay(marker);               // 将标注添加到地图中
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	</script>
</body>	
</html>
