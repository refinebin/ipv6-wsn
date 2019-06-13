<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${TITLE}-联系我们</title>
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">

<!-- core CSS -->
<link href="fh_static_3/css/bootstrap.min.css" rel="stylesheet">
<link href="fh_static_3/css/font-awesome.min.css" rel="stylesheet">
<link href="fh_static_3/css/prettyPhoto.css" rel="stylesheet">
<link href="fh_static_3/css/main.css" rel="stylesheet">
<link href="fh_static_3/css/responsive.css" rel="stylesheet">
<link href="fh_static_3/css/owl.carousel.css" rel="stylesheet">
<link href="fh_static_3/css/owl.theme.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
   <style type="text/css">
		#allmap {width: 100%;height: 400px;overflow: hidden;margin-bottom:12px}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=40GWXiduhOft266lK4N1dopL"></script>
</head>

<body>

<!-- header 包含导航菜单 -->
<#include "headerTemplate.ftl"> 
<!-- header 包含导航菜单 -->

<div id="inner-page">
  <div class="top-center">
    <h2>联系我们  Contact Us</h2>
  </div>
  <div class="container">
    <div class="row contact_top">
    <div id="allmap"></div>
  		<p>
			${CONTACTUS}
		</p>
    </div>
    <div class="center">
      <h3>给我们留言</h3>
      <p class="lead">Send us a message</p>
    </div>
      <div class="row">
        <div  style="margin-left:20px;" class="col-sm-offset-1">
          <div class="form-group">
            <label>姓名 *</label>
            <input type="text" id="NAME" name="NAME" maxlength="10" class="form-control" required="required" style="width:79%;">
            <p class="help-block text-danger"></p>
          </div>
          <div class="form-group">
            <label>邮箱 *</label>
            <input type="text" id="EMAIL" name="EMAIL" maxlength="30"  class="form-control" required="required" style="width:79%;">
            <p class="help-block text-danger"></p>
          </div>
          <div class="form-group">
            <label>地址 *</label>
            <input type="tel" id="ADDRESS" name="ADDRESSESS" maxlength="50"  class="form-control" required="required" style="width:79%;">
            <p class="help-block text-danger"></p>
          </div>
          <div class="form-group">
            <label>内容 *</label>
            <input type="tel" id="LCONTENT" name="LCONTENT" maxlength="2000"  class="form-control" required="required" style="width:79%;">
            <p class="help-block text-danger"></p>
          </div>
          <div class="form-group">
            <label></label>
            <button type="submit" class="btn btn-primary btn-lg" onclick="save()">提交留言</button>
            <p class="help-block text-danger"></p>
          </div>
        </div>
      </div>
  </div>
</div>

<!-- footer 包含底部 -->
<#include "footerTemplate.ftl"> 
<!-- footer 包含底部  -->

<script type="text/javascript" src="fh_static_3/js/jquery.js"></script> 
<script type="text/javascript" src="fh_static_3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.prettyPhoto.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.isotope.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/owl.carousel.js"></script> 
<script type="text/javascript" src="fh_static_3/js/main.js"></script>

<script type="text/javascript">
	$(window).load(function() {
		$("#contactus").addClass("active");
		var bheight = document.documentElement.clientHeight;
		if(bheight < 680){
		$("img").attr("style","");
		$("img").removeAttr("width");
		$("img").removeAttr("height");
		$("img").addClass("img-responsive center-block");　
		}
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
