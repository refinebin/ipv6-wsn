<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-新闻动态</title>
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
	<!-- a-cooperation -->
	<div class="a-grid">
		<div class="container">
			<div class="w3l-about-heading">
				<h2>News <span></span></h2>
			</div>
						<div>
							<div class="container"  style="padding-top:15px;padding-right:15px;padding-left:15px;padding-bottom:15px;background-color:white">
								<b  class="dark-link" id="TITLE"></b>
								<div>
								 来源： <span class="meta-author" id="STEMFROM"></span>
									<span class="meta-date" id="CTIME"></span>
								</div>
							</div>
							<div id="CONTENT"  class="container"  style="padding-top:15px;padding-right:15px;padding-left:15px;padding-bottom:15px;background-color:white">
							</div>
						</div>
		</div>
	</div>
	<!-- //a-cooperation -->
	<!-- footer -->
	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->
	<!-- //footer -->
	<!-- copyright -->

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
	<!-- parallax -->
	<script src="js/jarallax.js"></script>
	<script type="text/javascript">
        /* init Jarallax */
        $('.jarallax').jarallax({
            speed: 0.5,
            imgWidth: 1366,
            imgHeight: 768
        })
    </script>
	<!-- //parallax -->
	
		<script type="text/javascript">
		$(window).load(function() {
			$("#index").addClass("list-border"); 
			$("#News").addClass("active"); 
			getId();
			var bheight = document.documentElement.clientHeight;
			if(bheight < 680){
				$("img").attr("style","");
				$("img").removeAttr("width");
				$("img").removeAttr("height");
				$("img").addClass("img-responsive center-block");
			}
		});
		function getId(){
			var NEWID = ((window.location+"").split('NEWID='))[1];
			$.ajax({
				type: "POST",
				url: 'web/getNew.do',
		    	data: {NEWID:NEWID,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 $("#CONTENT").html(data.new.CONTENT);
					 $("#TITLE").html(data.new.TITLE);
					 $("#STEMFROM").html(data.new.STEMFROM);
					 $("#CTIME").html("    "+data.new.CTIME);
				}
			});
		}
	</script>
</body>	
</html>
