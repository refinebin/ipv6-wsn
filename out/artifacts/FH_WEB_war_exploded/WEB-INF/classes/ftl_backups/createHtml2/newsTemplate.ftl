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

            <#list listNews as var>
            <div class="post">
                <h2><a href="webnewsdetail.html?NEWID=${var[0]}">${var[1]}</a></h2>
                <div class="post-meta clearfix">
                    <span class="date"><i class="icon-time"></i> ${var[2]}</span>
                    <span class="tags"><i class="icon-tags"></i> ${var[3]}</span>
                </div>
                <div class="post-entry">
                    <a href="webnewsdetail.html?NEWID=${var[0]}" title=""><img src="${var[4]}" alt="${var[1]}" class="image" /></a>
                    <p>
                      ${var[5]}
                    </p>
                    <p>
                        <a href="webnewsdetail.html?NEWID=${var[0]}" class="button yellow-darkgray">阅读详情</a>
                    </p>
                </div>
            </div>
			</#list>

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
				            '<div class="post">'+
				                '<h2><a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'">'+data.new.TITLE+'</a></h2>'+
				                    '<span class="date"><i class="icon-time"></i>'+data.new.CTIME+'</span>'+
				                    '<span class="tags"><i class="icon-tags"></i>'+data.new.STEMFROM+'</span>'+
				                '</div>'+
				                '<div class="post-entry">'+
				                    '<a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'" title=""><img src="'+data.new.IMAGE+'" alt="'+data.new.TITLE+'" class="image" /></a>'+
				                    '<p>'+data.new.SHORTCONTENT+'</p>'+
				                    '<p>'+
				                        '<a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'" class="button yellow-darkgray">阅读详情</a>'+
				                    '</p>'+
				                '</div>'+
				            '</div>';
				        $('#content').append(newhtml);
					    $('#news'+start).fadeIn(10000);
					    start++;
					}		 
				}
			});
		}
	</script>
</body></html>




