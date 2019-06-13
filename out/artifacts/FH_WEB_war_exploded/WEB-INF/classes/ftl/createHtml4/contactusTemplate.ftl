<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-联系我们</title>
<meta charset="utf-8">
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">

<link rel="stylesheet" href="fh_static_4/css/bootstrap.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="fh_static_4/css/responsive.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="fh_static_4/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="fh_static_4/css/touchTouch.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="fh_static_4/css/kwicks-slider.css"
	type="text/css" media="screen">

<script type="text/javascript" src="fh_static_4/js/jquery.js"></script>
<script type="text/javascript" src="fh_static_4/js/superfish.js"></script>
<script type="text/javascript"
	src="fh_static_4/js/jquery.flexslider-min.js"></script>
<script type="text/javascript"
	src="fh_static_4/js/jquery.kwicks-1.5.1.js"></script>
<script type="text/javascript" src="fh_static_4/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="fh_static_4/js/jquery.cookie.js"></script>
<script type="text/javascript" src="fh_static_4/js/touchTouch.jquery.js"></script>
<script type="text/javascript">
	if ($(window).width() > 1024) {
		document
				.write("<"+"script src='fh_static_4/js/jquery.preloader.js'></"+"script>");
	}
</script>

<script>
	jQuery(window).load(function() {
		$x = $(window).width();
		if ($x > 1024) {
			jQuery("#content .row").preloader();
		}
		jQuery('.magnifier').touchTouch();
		jQuery('.spinner').animate({
			'opacity' : 0
		}, 1000, 'easeOutCubic', function() {
			jQuery(this).css('display', 'none')
		});
	});
</script>

	<!--[if lt IE 9]>
    <link rel="stylesheet" href="fh_static_4/css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="fh_static_4/css/ie.css" type="text/css" media="screen">
    <![endif]-->

<style type="text/css">
		#allmap {width: 100%;height: 400px;overflow: hidden;margin-top:0px}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=40GWXiduhOft266lK4N1dopL"></script>
</head>

<body>
	<div class="spinner"></div>
	<!-- header start -->
	
	<!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl"> 
	<!-- header 包含导航菜单 -->

	<div class="bg-content">

	 <!-- content -->
	    <div id="content"><div class="ic"></div>
	    <div class="container">
	        <div class="row">
	        <article class="span8">
	              <h3>Contact us</h3>
	              <div class="inner-1">
	            	<form id="contact-form">
	                  <fieldset>
		                <div>
		                    <label class="name">
		                    <input type="text" id="NAME" name="NAME" maxlength="10" placeholder="您的姓名">
		                  	<br>
		                    </label>
		                </div>
		                <div>
		                    <label class="emaill">
		                    <input type="email" id="EMAIL" name="EMAIL" maxlength="20" placeholder="电子邮箱">
		                    <br>
		                    </label>
		                </div>
		                <div>
		                    <label class="name">
		                    <input type="text" id="ADDRESS" name="ADDRESSESS" maxlength="50" placeholder="您的地址">
		                    <br>
		                    </label>
		                </div>
		                <div>
		                    <label class="message">
		                    <textarea id="LCONTENT" name="LCONTENT" maxlength="2000" placeholder="留言给我们" ></textarea>
		                    <br>
		                    </label>
		                </div>
		                <div class="buttons-wrapper"><a class="btn btn-1" data-type="submit" onclick="save()">发送</a></div>
	              	</fieldset>
	               </form>
	          </div>
	            </article>
	        <article class="span4">
	          <h3>Contact info</h3>
	          <address class="address-1">
          		<strong>
	          		${CONTACTUS}
              	</strong>
	          </address>
	         </article>
	      </div>
	       <div id="allmap"></div>
	      </div>
	  </div>

	</div>

	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->

	<script type="text/javascript" src="fh_static_4/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
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
