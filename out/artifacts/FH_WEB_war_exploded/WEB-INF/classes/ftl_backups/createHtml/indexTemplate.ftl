<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>${TITLE}</title>
<meta name="keywords" content="${KEYWORDS}" />
<meta name="description" content="${DESCRIPTION}">
<meta name="author" content="fhadmin">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS -->
<link rel="stylesheet" href="fh_static_1/css/style.css">
<link rel="stylesheet" type="text/css"
	href="fh_static_1/css/settings.css" media="screen" />
<!-- JS -->
<script src="fh_static_1/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<!-- jQuery -->
<script src="fh_static_1/js/jquery.easing.1.3.js" type="text/javascript"></script>
<!-- jQuery easing -->
<script src="fh_static_1/js/modernizr.custom.js" type="text/javascript"></script>
<!-- Modernizr -->
<script src="fh_static_1/js/jquery-ui-1.10.1.custom.min.js"
	type="text/javascript"></script>
<!-- tabs, toggles, accordion -->
<script src="fh_static_1/js/custom.js" type="text/javascript"></script>
<!-- jQuery initialization -->
<!-- Responsive Menu -->
<script src="fh_static_1/js/jquery.meanmenu.js"></script>
<script>
	jQuery(document).ready(function() {
		jQuery('header nav').meanmenu();
	});
</script>
<!-- Revolution Slider -->
<script src="fh_static_1/js/jquery.themepunch.plugins.min.js"></script>
<script src="fh_static_1/js/jquery.themepunch.revolution.min.js"></script>
<script src="fh_static_1/js/revolution-slider-options.js"></script>
<!-- Prety photo -->
<script src="fh_static_1/js/jquery.prettyPhoto.js"></script>
<script>
	$(document).ready(function() {
		$("a[data-gal^='prettyPhoto']").prettyPhoto();
	});
</script>
<!-- Tooltip -->
<script src="fh_static_1/js/tooltip.js"></script>
<!-- Flexisel -->
<script type="text/javascript" src="fh_static_1/js/jquery.flexisel.js"></script>
<!-- Favicons  -->
<link rel="shortcut icon" href="fh_static_1/images/favicon.ico">
<link rel="apple-touch-icon" href="fh_static_1/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="fh_static_1/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="fh_static_1/images/apple-touch-icon-114x114.png">
</head>
<body>

	<div id="bkbg">

	<!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl"> 
	<!-- header 包含导航菜单 -->

	<!-- 轮播图 -->
	<div class="fullwidthbanner-container top-shadow">
		<div class="fullwidthbanner">
			<ul>
				<#list fieldList1 as var>
					<li data-transition="boxfade" data-slotamount="${var_index+1+1}" data-masterspeed="300">
						<img src="${var[1]}" alt="${var[0]}">
					</li>
				</#list>
			</ul>
		</div>
	</div>
	<!-- END REVOLUTION SLIDER  -->
	<div class="copyrights">
	</div>
	<div class="container">

		<div class="sixteen columns welcome">
			<h3>
				${TITLE1}
				<br />
				${TITLE2}
			</h3>
		</div>

		<div class="separator"></div>

		<div class="four columns">
			<!-- Icon Box -->
			<div class="service">
				<a href="${CPTOURL1}">
					<i class="fa fa-desktop colored square"></i>
				</a>
				<h3 class="centered">
					<a href="${CPTOURL1}" class="dark-link">${CPTITLE1}</a>
				</h3>
				<p class="centered">${CPCONTENT1}</p>
			</div>
			<!-- End Icon Box -->
		</div>
		<div class="four columns">
			<!-- Icon Box -->
			<div class="service">
				<a href="${CPTOURL2}">
					<i class="fa fa-html5 colored square"></i>
				</a>
				<h3 class="centered">
					<a href="${CPTOURL2}" class="dark-link">${CPTITLE2}</a>
				</h3>
				<p class="centered">${CPCONTENT2}</p>
			</div>
			<!-- End Icon Box -->
		</div>
		<div class="four columns">
			<!-- Icon Box -->
			<div class="service">
				<a href="${CPTOURL3}">
					<i class="fa fa-css3 colored square"></i>
				</a>
				<h3 class="centered">
					<a href="${CPTOURL3}" class="dark-link">${CPTITLE3}</a>
				</h3>
				<p class="centered">${CPCONTENT3}</p>
			</div>
			<!-- End Icon Box -->
		</div>
		<div class="four columns">
			<!-- Icon Box -->
			<div class="service">
				<a href="${CPTOURL4}">
					<i class="fa fa-magic colored square"></i>
				</a>
				<h3 class="centered">
					<a href="${CPTOURL4}" class="dark-link">${CPTITLE4}</a>
				</h3>
				<p class="centered">${CPCONTENT4}</p>
			</div>
			<!-- End Icon Box -->
		</div>

		<div class="clearfix"></div>

		<div class="separator"></div>

		<div class="sixteen columns">
			<h4 class="headline">项目案例&nbsp;&gt</h4>
		</div>

		<#list fieldList2 as var>
		<div class="four columns identity">
			<div class="work">
				<a href="${var[1]}" data-gal="prettyPhoto" class="work-image">
					<img src="${var[1]}" alt="${var[0]}">
					<div class="link-overlay fa fa-search"></div>
				</a>
				<a href="${var[2]}" class="work-name">${var[0]}</a>
				<div class="tags">${var[3]}</div>
			</div>
		</div>
		</#list>

		<div class="clearfix"></div>

		<!-- begin promobox -->
		<div class="sixteen columns">
			<div class="promo-box clearfix">
				<div class="text">
					<h3>${CONTENT1}</h3>
					<p>${CONTENT2}</p>
				</div>
				<a class="btn big colored" href="${TOURL}" target="_blank">
					<i class="fa fa-hand-o-right"></i>了解更多</a>
			</div>
		</div>
		<!-- end promobox -->

		<div class="separator"></div>

		<!-- Our Clients  -->
		<div class="sixteen columns clients">
			<h4 class="headline">合作伙伴&nbsp;&gt</h4>

			<!-- Start brand carousel -->
			<ul id="flexiselDemo2">
			<#list fieldList3 as var>
				<li onclick="window.location.href='${var[2]}'"><img src="${var[1]}" alt="${var[0]}" /></li>
			</#list>	
			</ul>
			<div class="clearout"></div>
			<!-- End brand carousel -->
		</div>

	</div>
	<!-- container -->
	
	<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl"> 
	<!-- footer 包含底部  -->

	</div>

	<script type="text/javascript">
		$(window).load(function() {
		
			$("#index").addClass("current_page_item");
			
			$("#flexiselDemo2").flexisel({
				visibleItems : 5,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 3
					}
				}
			});
			
		});
	</script>
	<!-- End Document  -->
</body>
</html>