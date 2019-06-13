<footer>
		<div class="container clearfix">
			<ul class="list-social pull-right">
				<li><a class="icon-1" href="#"></a></li>
				<li><a class="icon-2" href="#"></a></li>
				<li><a class="icon-3" href="#"></a></li>
				<li><a class="icon-4" href="#"></a></li>
			</ul>
			<div class="privacy pull-left">Copyright ${COPYRIGHT} . 技术支持：${TECHNOLOGY}</div>
		</div>
</footer>

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