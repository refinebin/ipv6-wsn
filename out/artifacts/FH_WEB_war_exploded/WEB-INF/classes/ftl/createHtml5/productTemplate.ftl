<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-产品案例</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- bootstrap-css -->
<link href="fh_static_5/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->

<link rel="stylesheet" href="fh_static_5/css/lightbox.css">

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

	<div class="about-heading">	
		<div class="container">
			<h2>Product case</h2>
		</div>
	</div>
	<!-- gallery -->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
			
				<#list fieldList5 as var>	
				<div class="col-md-4 gallery-grid">
					<div class="grid">
						<figure class="effect-roxy">
							<a class="example-image-link" href="${var[1]}" data-lightbox="example-set" data-title="">
								<img src="${var[1]}" alt="${var[0]}" />
								<figcaption>
									<h3>${var[0]}</h3>
									<p>${var[3]}</p>
								</figcaption>	
							</a>
						</figure>
						<a href="${var[2]}" target="_blank">more</a>
					</div>
				</div>
				</#list>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //gallery -->

	<!-- footer -->
	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->
	<!-- //footer -->
	<!-- copyright -->

	<script src="fh_static_5/js/lightbox-plus-jquery.min.js"> </script>
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
	
		<script type="text/javascript">
		$(window).load(function() {
			$("#index").addClass("list-border"); 
			$("#Product").addClass("active"); 
		});
	</script>
</body>	
</html>
