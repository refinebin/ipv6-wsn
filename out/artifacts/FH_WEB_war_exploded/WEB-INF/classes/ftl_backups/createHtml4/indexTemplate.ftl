<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}</title>
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

</head>

<body>

	<div class="spinner"></div>
	<!-- header start -->
	
	<!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl"> 
	<!-- header 包含导航菜单 -->

	<div class="bg-content">
		<div class="container">
			<div class="row">
				<div class="span12">
					<!-- 轮播图 -->
					<div class="flexslider">
						<ul class="slides">
							<#list fieldList1 as var>
							<li><img src="${var[1]}" alt="${var[0]}" /></li>
							</#list>
						</ul>
					</div>
					<span id="responsiveFlag"></span>
					<div class="block-slogan">
						<h2>${TITLE1}</h2>
						<div>
							<p>${TITLE2}</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- content -->

		<div id="content" class="content-extra">
			<div class="ic"></div>
			<div class="row-1">
				<div class="container">
					<div class="row">
						<article class="span12">
							<h4>项目案例</h4>
						</article>
						<div class="clear"></div>
						<ul class="portfolio clearfix">
						
							<#list fieldList2 as var>
								<li class="box">
									<a href="${var[1]}" class="magnifier"><img src="${var[1]}" alt="${var[0]}" ></a>
									<div onclick="javascript:window.location.href='${var[2]}';" style="cursor:pointer;" target="_blank" >${var[0]}</div>
								</li>
							</#list>
									
						</ul>
					</div>
				</div>
			</div>
			<div class="row-2">
				<div class="container">
					<h3>${CONTENT1}</h3>
					<p>${CONTENT2}</p>
					<a href="${TOURL}" target="_blank" class="btn btn-1">详情</a>
				</div>
			</div>
			<div class="row-1">
				<div class="container">
					<div class="row">
						<article class="span12">
							<h4>合作伙伴</h4>
						</article>
						<ul class="thumbnails thumbnails-1">
							<#list fieldList3 as var>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<h3>${var[0]}</h3>
									<img src="${var[1]}" alt="${var[0]}">
									<section>
										<div class="clear"></div>
										<p>${var[3]}</p>
										<a href="${var[2]}" target="_blank" class="btn btn-1">了解更多</a>
									</section>
								</div>
							</li>
							</#list>
						</ul>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<article class="span6">
						<h3>${NAME}</h3>
						<div class="wrapper">
							<figure class="img-indent">
								<img src="${LOGO}" alt="${NAME}" />
							</figure>
							<div class="inner-1 overflow extra">
								<div class="txt-1">${ABOUTUS1}</div>
								${ABOUTUS2}
							</div>
						</div>
					</article>
					<article class="span6">
						<h3>最新消息</h3>
						<div class="wrapper">
							<div class="inner-1 overflow extra">
								<div class="txt-1">${NEW1}</div>
								<div class="txt-1">${NEW2}</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</div>

	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->

	<script type="text/javascript" src="fh_static_4/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$("#index").addClass("active"); 
		});
	</script>
</body>
</html>
