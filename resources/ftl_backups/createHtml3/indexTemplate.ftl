<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${TITLE}</title>
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

<div id="bkbg">

<!-- header 包含导航菜单 -->
<#include "headerTemplate.ftl"> 
<!-- header 包含导航菜单 -->

<div id="main-slide" class="carousel slide" data-ride="carousel">

  <ol class="carousel-indicators">
    <li data-target="#main-slide" data-slide-to="0" class="active"></li>
    <li data-target="#main-slide" data-slide-to="1"></li>
    <li data-target="#main-slide" data-slide-to="2"></li>
  </ol>
  
  <div class="carousel-inner">
  <!-- 轮播图 -->
    <#list fieldList1 as var>
					
		<#if var_index == 0><div class="item active"></#if>
		<#if var_index != 0><div class="item"></#if>	
			<img class="img-responsive" src="${var[1]}" alt="${var[0]}">
	      <div class="slider-content">
	        <div class="col-md-12 text-center">
	          <h2><span class="logo">${var[0]}</span></h2>
	          <h3>${var[3]}</h3>
	        </div>
	      </div>
	    </div>			
					
	</#list>
    
  </div>
  
  <a class="left carousel-control" href="#main-slide" data-slide="prev"> <span><i class="fa fa-angle-left"></i></span> </a> <a class="right carousel-control" href="#main-slide" data-slide="next"> <span><i class="fa fa-angle-right"></i></span> </a> </div>
<section id="feature" >
  <div class="container">
    <div class="center">
      <h2>${TITLE1}</h2>
      <hr>
      <p class="lead">
      	${TITLE2}
      </p>
    </div>
    <div class="row">
      <div class="features">
        <div class="col-md-4 col-sm-6">
          <div class="feature-wrap"> <i class="fa fa-laptop"></i>
            <h2>${CPTITLE1}</h2>
            <h3>${CPCONTENT1}</h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="feature-wrap"> <i class="fa fa-code"></i>
            <h2>${CPTITLE2}</h2>
            <h3>${CPCONTENT2}</h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="feature-wrap"> <i class="fa fa-bullhorn"></i>
            <h2>${CPTITLE3}</h2>
            <h3>${CPCONTENT3}</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section id="recent-works">
  <div class="container">
  
    <div class="center">
      <h2>${CONTENT1}</h2>
      <hr>
      <p class="lead">
      	${CONTENT2}<br>
        <a href="${TOURL}" class="readmore">了解更多 →</a></p>
    </div>
    
    <div class="row">
	
	<#list fieldList2 as var>
	<#if var_index < 6>
      <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="recent-work-wrap"> <img class="img-responsive" src="${var[1]}" alt="${var[0]}">
          <div class="overlay">
            <div class="recent-work-inner">
              <h3><a href="${var[2]}">${var[0]}</a> </h3>
              <p>${var[3]}</p>
              <a class="preview" href="${var[1]}" rel="prettyPhoto" title=""><i class="fa fa-search"></i>查看</a> </div>
          </div>
        </div>
      </div>
	</#if>
	</#list>
      
    </div>
    
  </div>
  
</section>

<section id="testimonials" class="text-center">
  <div class="container">
    <div class="center">
      <h2>${M3_TITLE}</h2>
      <hr>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div id="testimonial" class="owl-carousel owl-theme">
          <div class="item">
            <p>${M3_CONTENT1}</p>
          </div>
          <div class="item">
            <p>${M3_CONTENT2}</p>
          </div>
          <div class="item">
            <p>${M3_CONTENT3}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="get-started">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2>最新消息</h2>
        <p>${NEW1}<br>
          ${NEW2}</p>
    </div>
  </div>
</section>

<!-- footer 包含底部 -->
<#include "footerTemplate.ftl"> 
<!-- footer 包含底部  -->

</div>

<script type="text/javascript" src="fh_static_3/js/jquery.js"></script> 
<script type="text/javascript" src="fh_static_3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.prettyPhoto.js"></script> 
<script type="text/javascript" src="fh_static_3/js/jquery.isotope.min.js"></script> 
<script type="text/javascript" src="fh_static_3/js/owl.carousel.js"></script> 
<script type="text/javascript" src="fh_static_3/js/main.js"></script>

<script type="text/javascript">
	$(window).load(function() {
		$("#index").addClass("active");
	});
</script>
</body>
</html>
