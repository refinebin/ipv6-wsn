<footer class="footer">
		<div class="container">
			<div class="footer-top clearfix">
				<div class="four columns">
					<h3>关于我们</h3>
					<p>${ABOUTUS1}</p>
					<p>${ABOUTUS2}</p>
				</div>
				<div class="four columns">
					<h3>最新消息</h3>
					<div class="twitter">
						<ul>
							<!-- Twitter Message 1 -->
							<li>
								<span>
									${NEW1}
								</span>
							</li>
							<!-- Twitter Message 2 -->
							<li>
								<span>
									${NEW2}
								</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="four columns">
					<h3>技术团队</h3>
					<div class="latest-project">
						
						<#list fieldList4 as var>
						<div class="latest-project-item">
							<a><img src="${var[1]}" alt="${var[0]}"></a>
						</div>
						</#list>
						
					</div>
				</div>
				<div class="four columns">
					<h3>联系信息</h3>
					<ul class="list contact" style="margin-bottom: 15px;">
						<li class="contact-address">
							<i class="fa fa-map-marker"></i>
							<span>${ADDRESS}</span>
						</li>
						<li class="contact-mail">
							<i class="fa fa-envelope"></i>
							<a class="link">${EMAIL}</a>
						</li>
						<li class="contact-phone">
							<i class="fa fa-phone"></i>
							<span>${TEL}</span>
						</li>
						<li class="contact-address">
							<i class="fa fa-clock-o"></i>
							<span>
								QQ:${QQ}-传真:${FAX}
							</span>
						</li>
					</ul>

					<div class="tooltips">
						<ul class="social-icons-footer">
							<li>
								<a data-rel="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="Google+"><i class="fa fa-google-plus"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="Pinterest"><i class="fa fa-pinterest"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="LinkedIn"><i class="fa fa-linkedin"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a>
							</li>
							<li>
								<a data-rel="tooltip" title="RSS"><i class="fa fa-rss"></i></a>
							</li>
						</ul>
					</div>

				</div>
			</div>
			<!-- footer-top -->
		</div>

		<div class="container">
			<div class="footer-bottom clearfix">
				<div class="eight columns">
					<p>
						Copyright ${COPYRIGHT} . 技术支持：${TECHNOLOGY}
					</p>
				</div>
				<div class="eight columns">
					<nav class="footer-nav">
						<ul>
							<li><a class="first" href="index.html">首页</a> /</li>
							<li><a href="webaboutus.html">关于我们</a> /</li>
							<li><a href="webproduct.html">产品案例</a> /</li>
							<li><a href="webcooperation.html">合作共赢</a> /</li>
							<li><a href="webnews.html">新闻动态</a> /</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- footer-bottom -->
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
	</footer>