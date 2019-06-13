<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}</title>
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
<!-- //font -->

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

</head>
<body>
	<div class="banner-top">
		<div class="slider">
			<div class="callbacks_container">
				<ul class="rslides callbacks callbacks1" id="slider4">
				
				<!-- 轮播图 -->
				<#list fieldList1 as var>
				
					<li>
						<div style="background: url(${var[1]}) no-repeat 0px 0px;background-size: cover;">
							<div class="container">
								<div class="agileits-banner-info">
									<h3>${var[0]}</span></h3>
									<p>${var[3]}</p>
									<div class="w3-button">
										<a href="${var[2]}">More</a>
									</div>
								</div>	
							</div>
						</div>
					</li>
					
				</#list>	
					
				</ul>
			</div>
			<div class="clearfix"> </div>
			<script src="js/responsiveslides.min.js"></script>
			<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider4").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
			</script>
			<!--banner Slider starts Here-->
		</div>
	</div>
	<!-- banner -->
	
	<div class="banner">
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
	<!-- welcome -->
	<div class="welcome">
		<div class="container">
			<div class="w3-welcome-grids">
				<div class="col-md-5 w3l-welcome-left">
					<h2>${TITLE1}</h2>
					<p>${TITLE2}</p>
				</div>
				<div class="col-md-7 w3l-welcome-right">
					<div class="w3l-welcome-right-grids">
						<div class="col-sm-5 w3l-welcome-right-img">
							<img src="${IMG1}"/>
						</div>
						<div class="col-sm-7 w3l-welcome-right-img1">
							<img src="${IMG2}"/>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //welcome -->
	<!-- services 公司理念 -->
	<div class="services">
		<div class="container">
			<div class="agileits-services-grids">
				<div class="col-md-4 agileinfo-services-left">
					<h3>Our <span>Services</span></h3>
					<p>${CPTITLE1},${CPTITLE2},${CPTITLE3},${CPTITLE4}</p>
				</div>
				<div class="col-md-8 agileinfo-services-right">
					<div class="col-md-6 w3-agileits-services-grid">
						<i class="fa fa-cogs" aria-hidden="true"></i>
						<h4>${CPTITLE1}</h4>
						<p>${CPCONTENT1}</p>
					</div>
					<div class="col-md-6 w3-agileits-services-grid agile-services1">
						<i class="fa fa-comments" aria-hidden="true"></i>
						<h4>${CPTITLE3}</h4>
						<p>${CPCONTENT3}</p>
					</div>
					<div class="col-md-6 w3-agileits-services-grid">
						<i class="fa fa-heart" aria-hidden="true"></i>
						<h4>${CPTITLE2}</h4>
						<p>${CPCONTENT2}</p>
					</div>
					<div class="col-md-6 w3-agileits-services-grid">
						<i class="fa fa-plane" aria-hidden="true"></i>
						<h4>${CPTITLE4}</h4>
						<p>${CPCONTENT4}</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //services -->
	<!-- news -->
	<div class="news">
		<div class="container">
			<div class="wthree-news-grids">
				<div class="col-md-4 agileinfo-services-left agile-news-left">
					<h3>Our <span>News</span></h3>
					<p>${CONTENT1} ${CONTENT2}</p>
				</div>
				<div class="col-md-8 agile-news-right">
					<div class="col-md-6 agile-news-right-info">
						<div class="col-md-6 agile-news-img" style="background: url(${IMG3}) no-repeat 0px 0px;;">
							
						</div>
						<div class="col-md-6 agile-news-img-info">
							<div class="agileits-w3layouts-border"> </div>
							<p>${ABOUTUS1}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-6 agile-news-right-info">
						<div class="col-md-6 agile-news-img agile-news-img1" style="background: url(${IMG4}) no-repeat 0px 0px;">
							
						</div>
						<div class="col-md-6 agile-news-img-info">
							<div class="agileits-w3layouts-border"> </div>
							<p>${NEW1}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //news -->

	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->

	<script src="fh_static_5/js/responsiveslides.min.js"></script>
	<script src="fh_static_5/js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="fh_static_5/js/move-top.js"></script>
	<script type="text/javascript" src="fh_static_5/js/easing.js"></script>
	<!-- here stars scrolling icon -->
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
	<!-- //here ends scrolling icon -->

	<script type="text/javascript">
		$(window).load(function() {
			$("#index").addClass("active list-border"); 
		});
	</script>
</body>	
</html>