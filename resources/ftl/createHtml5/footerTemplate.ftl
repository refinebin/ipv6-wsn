	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="agile-footer-grids">
				<div class="col-md-3 w3-agile-footer-grid">
					<h3>关于我们</h3>
					<p>${ABOUTUS2}</p>
				</div>
				<div class="col-md-3 w3-agile-footer-grid">
					<h3>最新消息</h3>
					<p>${NEW2}</p>
				</div>
				<div class="col-md-3 w3-agile-footer-grid">
					<h3>技术团队</h3>
					<p>
					<#list fieldList4 as var>
						${var[0]}
					</#list>
					</p>
				</div>
				<div class="col-md-3 w3-agile-footer-grid">
					<h3>联系信息</h3>
					<ul>
						<i><p>地址：${ADDRESS}</p></i>
						<i><p>邮箱：${EMAIL}</p></i>
						<i><p>电话：${TEL}</p></i>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<p>Copyright ${COPYRIGHT} . 技术支持：${TECHNOLOGY}. 备案号：${BEIAN}</p>
		</div>
	</div>
	<!-- //copyright -->
	
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