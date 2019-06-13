<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="icon" href="fh_static_2/images/favicon.ico">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>${TITLE}</title>
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

    <!-- Slider  -->
    <div class="revslider-wrapper fullwidth">
        <div class="revslider">
            <ul>
                <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
                    <!-- The main image in the slide -->
                    <img src="#" style="display: none;" />
                    <!-- The captions of the first slide -->
                    <div class="caption sfl big_black center" data-x="150" data-y="120" data-speed="300" data-start="0" data-easing="easeOutExpo">
                        	${TITLE1}
                    </div>
                    <div class="caption sfr medium_white center" data-x="200" data-y="330" data-speed="300" data-start="1500" data-easing="easeOutExpo">
                        	${TITLE2}
                    </div>
                </li>

                <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
                    <!-- The main image in the slide -->
                    <img src="#" style="display: none;" />
                    <!-- The captions of the first slide -->
                    <div class="caption sfb" data-x="585" data-y="70" data-speed="300" data-start="0" data-easing="easeOutExpo">
                        <img src="${IMG2}" />
                    </div>
                    <div class="caption sfl" data-x="535" data-y="240" data-speed="300" data-start="400" data-easing="easeOutExpo">
                        <img src="${IMG1}" />
                    </div>
                    <div class="caption sft big_black" data-x="85" data-y="130" data-speed="300" data-start="800" data-easing="easeOutExpo">
                        	${CONTENT1}
                    </div>
                    <div class="caption sft medium_white" data-x="90" data-y="270" data-speed="300" data-start="1200" data-easing="easeOutExpo">
                       		 ${CONTENT2}
                    </div>
                    <div class="caption sfb button" data-x="70" data-y="350" data-speed="300" data-start="1600" data-easing="easeOutExpo">
                    </div>
                </li>

                <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
                    <!-- The main image in the slide -->
                    <img src="#" style="display: none;" />
                    <!-- The captions of the first slide -->
                    
						<#list fieldList4 as var>
							<#if var[3] == '5'><#break></#if>
							<#if var[3] == '1'><div class="caption sft boxshadow" data-x="615" data-y="90" data-speed="300" data-start="0" data-easing="easeOutExpo"></#if>
							<#if var[3] == '2'><div class="caption sft boxshadow" data-x="800" data-y="90" data-speed="300" data-start="400" data-easing="easeOutExpo"></#if>
							<#if var[3] == '3'><div class="caption sfb boxshadow" data-x="615" data-y="275" data-speed="300" data-start="800" data-easing="easeOutExpo"></#if>
							<#if var[3] == '4'><div class="caption sfb boxshadow" data-x="800" data-y="275" data-speed="300" data-start="1200" data-easing="easeOutExpo"></#if>
								<img src="${var[1]}" />
							</div>
						</#list>
                    
                    
                    <div class="caption sft big_black" data-x="85" data-y="130" data-speed="300" data-start="1600" data-easing="easeOutExpo">
                        	${OTHER1}
                    </div>
                    <div class="caption sft medium_white" data-x="90" data-y="270" data-speed="300" data-start="2000" data-easing="easeOutExpo">
                        	${OTHER2}
                    </div>
                    <div class="caption sfb button" data-x="70" data-y="350" data-speed="300" data-start="2400" data-easing="easeOutExpo">
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- Slider / End -->

    <hr class="sep90">

    <!-- Content
    ======================================================================== -->
    <div id="content" class="container">

        <!-- Services -->
        <div class="service one-third">
            <div class="service-icon"><i class="icon-exchange"></i></div>
            <div class="service-description">
                <h3>${CPTITLE1}</h3>
                <p>${CPCONTENT1}</p>
                <div class="more">
                    <a href="${CPTOURL1}" class="button gray-yellow small">Learn More</a>
                </div>
            </div>
        </div>
        <div class="service one-third">
            <div class="service-icon"><i class="icon-barcode"></i></div>
            <div class="service-description">
                <h3>${CPTITLE2}</h3>
                <p>${CPCONTENT2}</p>
                <div class="more">
                    <a href="${CPTOURL2}" class="button gray-yellow small">Learn More</a>
                </div>
            </div>
        </div>
        <div class="service one-third column-last">
            <div class="service-icon"><i class="icon-star"></i></div>
            <div class="service-description">
                <h3>${CPTITLE3}</h3>
                <p>${CPCONTENT3}</p>
                <div class="more">
                    <a href="${CPTOURL3}" class="button gray-yellow small">Learn More</a>
                </div>
            </div>
        </div>
        <!-- Services / End -->

        <hr class="sep40">

        <!-- Project Carousel -->
        <div class="project-carousel fullwidth-padding clearfix">
            <a id="project-prev" class="jcarousel-prev" href="#"><i class="icon-chevron-left"></i></a>
            <a id="project-next" class="jcarousel-next" href="#"><i class="icon-chevron-right"></i></a>
            <ul>
            
            	<#list fieldList2 as var>
                <li class="project-item">
                    <img src="${var[1]}" alt="${var[0]}">
                    <div class="overlay"></div>
                    <div class="mask">
                        <a href="${var[1]}" class="icon-image folio" rel="gallery"><i class="icon-search"></i></a>
                        <a href="${var[2]}" class="item-title">${var[0]}</a>
                    </div>
                </li>
                </#list>
        
            </ul>
        </div>
        <!-- Project Carousel / End -->

        <hr class="sep90">

        <!-- Logo List -->
        <ul class="logo-list clearfix">
        	<#list fieldList3 as var>
				<#if var[3] != '5'><li class="one-fifth"></#if>
				<#if var[3] == '5'><li class="one-fifth column-last"></#if>
				<a href="${var[2]}"><img src="${var[1]}" alt="${var[0]}" /></a></li>
			</#list>
        </ul>

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
		$("#index").addClass("current");
	});
</script>
</body>
</html>




