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
	
	<div class="about-heading">	
		<div class="container">
			<h2>News</h2>
		</div>
	</div>
	
	<!-- blog -->
	<div class="blog">
		<div class="container">
			<div class="agile-blog-grids">
				<div id="news">
				
				<#list listNews as var>
				
					<div class="agile-blog-grid">
						<div class="agile-blog-grid-left-img">
							<a href="webnewsdetail.html?NEWID=${var[0]}"><img src="${var[4]}" alt="${var[1]}" /></a>
						</div>
						<div class="blog-left-grids">
							<div class="blog-left-left">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</div>
							<div class="blog-left-right">
								<div class="blog-left-right-top">
									<h4><a href="webnewsdetail.html?NEWID=${var[0]}">${var[1]}</a></h4>
									<p>来源 <a href="#">${var[3]}</a> &nbsp;&nbsp; ${var[2]} &nbsp;&nbsp;</p>
								</div>
								<div class="blog-left-right-bottom">
									<p>${var[5]}</p>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
				
				</#list>
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //blog -->

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
			$("#News").addClass("active"); 
		});
		
		
		
		var start = 3;
	    //新闻瀑布流
	    $(document).scroll(  
            function() {  
                if ($(document).scrollTop() + window.innerHeight == $(document).height()) { 
                	getNews();
                }  
         });
        
        //获取新闻
        function getNews(){
			$.ajax({
				type: "POST",
				url: 'web/getNewTitle.do',
		    	data: {start:start,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if('yes' == data.new.hasNext){			 
						var newhtml =''+ 
				            '<div class="agile-blog-grid">'+
								'<div class="agile-blog-grid-left-img">'+
									'<a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'"><img src="'+data.new.IMAGE+'" alt="'+data.new.TITLE+'" /></a>'+
								'</div>'+
								'<div class="blog-left-grids">'+
									'<div class="blog-left-left">'+
										'<i class="fa fa-pencil" aria-hidden="true"></i>'+
									'</div>'+
									'<div class="blog-left-right">'+
										'<div class="blog-left-right-top">'+
											'<h4><a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'">'+data.new.TITLE+'</a></h4>'+
											'<p>来源 <a href="#">'+data.new.STEMFROM+'</a> &nbsp;&nbsp; '+data.new.CTIME+' &nbsp;&nbsp;</p>'+
										'</div>'+
										'<div class="blog-left-right-bottom">'+
											'<p>'+data.new.SHORTCONTENT+'</p>'+
										'</div>'+
									'</div>'+
									'<div class="clearfix"> </div>'+
								'</div>'+
							'</div>';
				        $('#news').append(newhtml);
					    $('#news'+start).fadeIn(10000);//渐显
					    start++;
					}		 
				}
			});
		}
		
	</script>
</body>	
</html>
