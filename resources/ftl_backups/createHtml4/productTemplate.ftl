<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-产品案例</title>
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

    <!-- content -->
      
<div id="content">
	<div class="ic"></div>
	<div class="container">
		<div class="row">
		    <article class="span12">
		        <h4>Services</h4>
		    </article>
	    	<div class="clear"></div>
		    <ul class="thumbnails thumbnails-1 list-services">
		     
		      <#list fieldList5 as var>
		      <li class="span4">
		        	<div class="thumbnail thumbnail-1"><img src="${var[1]}" alt="${var[0]}">
		            <section> <a href="${var[2]}" target="_blank" class="link-1">${var[0]}</a>
		            <p>${var[3]}</p>
		          	</section>
		            </div>
		      </li>
		      </#list>
		      
		    </ul>
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
			$("#Product").addClass("active");
		});
	</script>
</body>
</html>
