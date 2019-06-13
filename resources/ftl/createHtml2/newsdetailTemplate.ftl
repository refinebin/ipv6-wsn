<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="icon" href="fh_static_2/images/favicon.ico">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>${TITLE}-新闻动态</title>
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
            News<br /> <span class="accent">新闻动态</span>
        </div>
    </h1>

    <!-- Content  -->
    <div id="content" class="container">

        <!-- Intro -->
        <div class="intro">
            
			<div class="post">
                <h2 id="TITLE"> </h2>
                <div class="post-meta clearfix">
                    <span class="date" id="CTIME"></span>
                    <span class="tags" id="STEMFROM"></span>
                </div>
                <div class="post-entry">
                    <p id="CONTENT">
                       
                    </p>
                </div>
            </div>
				
            
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
			$("#News").addClass("current");
			getId();
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
					 $("#STEMFROM").html('<i class="icon-tags"></i>&nbsp;'+data.new.STEMFROM);
					 $("#CTIME").html('<i class="icon-time"></i>&nbsp;'+data.new.CTIME);
				}
			});
		}
	</script>
</body></html>




