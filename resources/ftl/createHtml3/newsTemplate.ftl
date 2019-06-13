<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${TITLE}-新闻动态</title>
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">

<!-- core CSS -->
<link href="fh_static_3/css/bootstrap.min.css" rel="stylesheet">
<link href="fh_static_3/css/font-awesome.min.css" rel="stylesheet">
<link href="fh_static_3/css/prettyPhoto.css" rel="stylesheet">
<link href="fh_static_3/css/main.css" rel="stylesheet">
<link href="fh_static_3/css/responsive.css" rel="stylesheet">
<link href="fh_static_3/css/owl.carousel.css" rel="stylesheet">
<link href="fh_static_3/css/owl.theme.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- header 包含导航菜单 -->
<#include "headerTemplate.ftl"> 
<!-- header 包含导航菜单 -->

<div id="inner-page">
  <div class="top-center">
    <h2>新闻动态  News & Events</h2>
  </div>
</div>
 
  <div class="container">
    <div class="row contact_top">
    	<div style="appding-left:20px;appding-right:20px;margin-top:20px;" id="news">
			

	<#list listNews as var>
		 <div class="row">
	        <div class="col-md-4 col-sm-6"><img src="${var[4]}" width="292" alt="${var[1]}" onclick="window.location.href='webnewsdetail.html?NEWID=${var[0]}';"  /> </div>
	        <div class="col-sm-6">
	          <h3>${var[1]}</h3>
	          <p>${var[5]} </p>
	          <p><button type="submit" class="btn btn-primary btn-lg" onclick="window.location.href='webnewsdetail.html?NEWID=${var[0]}';">查看详情</button></p>
	        </div>
	      </div>
	      <br/>
	</#list>


		</div>
    </div>
  </div>

<!-- footer 包含底部 -->
<#include "footerTemplate.ftl"> 
<!-- footer 包含底部  -->

<script type="text/javascript" src="fh_static_3/js/jquery.js"></script> 
<script type="text/javascript" src="fh_static_3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.prettyPhoto.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.isotope.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/owl.carousel.js"></script> 
<script type="text/javascript" src="fh_static_3/js/main.js"></script>

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
		           var url = 'webnewsdetail.html?NEWID='+data.new.NEWS_ID
		           var newhtml =''+   
		              '<div class="row" id="news'+start+'" style="display:none;">'+ 
				        '<div class="col-md-4 col-sm-6"><img src="'+data.new.IMAGE+'" alt="'+data.new.TITLE+'" width="292" onclick="window.location.href=\''+url+'\';"  /> </div>'+
				        '<div class="col-sm-6">'+ 
				          '<h3>'+data.new.TITLE+'</h3>'+ 
				          '<p>'+data.new.SHORTCONTENT+'</p>'+ 
				          '<p><button type="submit" class="btn btn-primary btn-lg" onclick="window.location.href=\''+url+'\';">查看详情</button></p>'+ 
				        '</div>'+ 
				      '</div>'+ 
				      '<br/>';
			        $('#news').append(newhtml);
				    $('#news'+start).fadeIn(6000);//渐显
				    start++;
				}		 
			}
		});
	}
</script>
</body>
</html>
