<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="icon" href="fh_static_2/images/favicon.ico">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>${TITLE}-关于我们</title>
    <meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}">

    <link rel="stylesheet" href="fh_static_2/css/style.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/boxed.css" media="screen" id="layout" />
    <link rel="stylesheet" href="fh_static_2/css/colors/color-yellow.css" media="screen" id="colors" />
    <link rel="stylesheet" href="fh_static_2/css/flexslider.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/fancybox.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/revslider.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/font-awesome.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/zocial.css" media="screen" />
    <link rel="stylesheet" href="fh_static_2/css/responsive.css" media="screen" />

    <!-- JavaScript -->
    <script src="fh_static_2/js/jquery-1.8.2.min.js"></script>
    <script src="fh_static_2/js/jquery.themepunch.plugins.min.js"></script>
    <script src="fh_static_2/js/jquery.themepunch.revolution.min.js"></script>
    <script src="fh_static_2/js/jquery.ui.widget.min.js"></script>                          
    <script src="fh_static_2/js/jquery.ui.accordion.min.js"></script>
    <script src="fh_static_2/js/jquery.ui.tabs.min.js"></script>
    <script src="fh_static_2/js/jquery.easing-1.3.min.js"></script>
    <script src="fh_static_2/js/jquery.fitvid.js"></script>
    <script src="fh_static_2/js/jquery.fancybox.pack.js"></script>
    <script src="fh_static_2/js/jquery.flexslider-min.js"></script>
    <script src="fh_static_2/js/jquery.isotope.min.js"></script>
    <script src="fh_static_2/js/jquery.imagesloaded.min.js"></script>
    <script src="fh_static_2/js/jquery.infinitescroll.min.js"></script>
    <script src="fh_static_2/js/jquery.jcarousel.min.js"></script>
    <script src="fh_static_2/js/jquery.jtweetsanywhere-1.3.1.min.js"></script>
    <script src="fh_static_2/js/jquery.touchSwipe.min.js"></script>
    <script src="fh_static_2/js/jquery.validate.min.js"></script>
    <script src="fh_static_2/js/jquery.zflickrfeed.min.js"></script>
    <script src="fh_static_2/js/respond.min.js"></script>
    <script src="fh_static_2/js/selectnav.min.js"></script>
    <script src="fh_static_2/js/custom.js"></script>

    <link rel="stylesheet" type="text/css" href="fh_static_2/css/styleselector.css">
    <script src="fh_static_2/js/styleselector.js"></script>

</head>
<body>

<!-- Body Wrapper -->
<div id="body-wrapper">


	<!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl"> 
	<!-- header 包含导航菜单 -->


    <!-- Page Title -->
    <h1 class="page-title fullwidth-padding">
        <div class="container">
            About US<br /> <span class="accent">关于我们</span>
        </div>
    </h1>

    <!-- Content  -->
    <div id="content" class="container">

        <!-- Intro -->
        <div class="intro">
           ${ABOUTUS}
        </div>

    </div>
    <!-- Content / End -->

    <!-- Footer -->
    <#include "footerTemplate.ftl"> 
    <!-- Footer / End -->

</div>
<!-- Body Wrapper / End -->

<!-- Back to Top -->
<a href="#" id="back-to-top"><i class="icon-chevron-up"></i></a>

	<script type="text/javascript">
		$(window).load(function() {
			$("#aboutus").addClass("current");
		});
	</script>
</body></html>




