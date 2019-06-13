    <div id="footer" class="fullwidth">

        <div class="container">

            <!-- About -->
            <div class="one-fourth">
                <div class="widget widget_text">
                    <div class="logo"><span>${NAME}</span></div>
                    ${ADDRESS}
                </div>
            </div>

            <!-- Twitter Feed -->
            <div class="one-fourth">
                <div class="widget widget_twitter">
                    <h3>最新消息</h3>
                    <div id="twitter-feed-footer" class="twitter-feed">
                    	${NEW1}
                    </div>
                </div>
            </div>

            <!-- Contacts -->
            <div class="one-fourth">
                <div class="widget widget_latest_posts">
                    <h3>联系方式</h3>
                    <ul>
                        <li>
                            <h6><a>电话:&nbsp;&nbsp;${TEL}</a></h6>
                            
                        </li>
                        <li>
                            <h6><a>邮箱:&nbsp;&nbsp;${EMAIL}</a></h6>
                            
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Photo Stream -->
            <div class="one-fourth column-last">
                <div class="widget widget_flickr">
                    <h3>官网</h3>
                    <div class="photo-stream">
                    	<h6><a>${WEBURL}</a></h6>
                    </div>
                </div>
            </div>

        </div>

        <!-- Info -->
        <div class="info">
            <div class="container">

                <!-- Copyright -->
                <ul class="copyright">
                    <li>${COPYRIGHT} &nbsp;&nbsp;&nbsp;&nbsp;技术支持：${TECHNOLOGY} &nbsp;&nbsp;&nbsp;&nbsp;备案：${BEIAN}</li>
                    
                </ul>

                <!-- Social Links -->
                <ul class="social-links">
                    <li><a href="#" class="zocial twitter"></a></li>
                    <li><a href="#" class="zocial facebook"></a></li>
                    <li><a href="#" class="zocial linkedin"></a></li>
                    <li><a href="#" class="zocial pinterest"></a></li>
                    <li><a href="#" class="zocial vimeo"></a></li>
                </ul>

            </div>
        </div>
        
	<script type="text/javascript">
		$(window).load(function() {
			addIP();
			isBlack();
		});
		//记录IP
		function addIP(){
			$.ajax({
				type: "POST",
				url: 'web/addStatistics.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
				}
			});
		}
		function isBlack(){
			$.ajax({
				type: "POST",
				url: 'web/isBlack.do',
		    	data: {tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("NO" == data.result){
					$("body").html("");
					alert("禁止访问！");
					}
				}
			});
		}
	</script>
	
    </div>