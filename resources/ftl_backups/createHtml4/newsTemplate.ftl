<!DOCTYPE html>
<html lang="en">
<head>
<title>${TITLE}-新闻动态</title>
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

    <!--  content  -->      
	  <div id="content"><div class="ic"></div>
	    <div class="container">
	       <div class="row">
	        <article class="span8">
	         <div class="inner-1">         
	          <ul class="list-blog" id="news">
	          
	          	<#list listNews as var>
	            <li>  
	            <h3>${var[1]}</h3>     
	            <time datetime="${var[2]}" class="date-1"><i class="icon-calendar icon-white"></i>${var[2]}</time>
	            <div class="name-author"><i class="icon-user icon-white"></i> <a href="#">${var[3]}</a></div>
	            <div class="clear"></div>            
	              <img src="${var[4]}" alt="${var[1]}">                               
	              <p>&nbsp;&nbsp;&nbsp;&nbsp;${var[5]}</p>
	              <a href="webnewsdetail.html?NEWID=${var[0]}" class="btn btn-1">详情</a>          
	            </li>  
	            </#list>
	                        
	          </ul>
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
					  		'<li id="news'+start+'" style="display:none;">'+   
				            '<h3>'+data.new.TITLE+'</h3>'+      
				            '<time datetime="'+data.new.CTIME+'" date-1"><i class="icon-calendar icon-white"></i>'+data.new.CTIME+'</time>'+ 
				            '<div class="name-author"><i class="icon-user icon-white"></i> <a href="#">'+data.new.STEMFROM+'</a></div>'+ 
				            '<div class="clear"></div>'+             
				              '<img src="'+data.new.IMAGE+'" alt="'+data.new.TITLE+'">'+                                
				              '<p>&nbsp;&nbsp;&nbsp;&nbsp;'+data.new.SHORTCONTENT+'</p>'+ 
				              '<a href="webnewsdetail.html?NEWID='+data.new.NEWS_ID+'" class="btn btn-1">详情</a>'+           
				            '</li>';
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
