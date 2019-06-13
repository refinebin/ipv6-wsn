<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">Copyright ${COPYRIGHT} . 技术支持：${TECHNOLOGY} </div>
      <div class="col-sm-6">
        <div class="follow-us">地址：${ADDRESS}&nbsp; 电话：${TEL} </div>
      </div>
    </div>
  </div>
</footer>
	<script src="fh_static_3/js/jquery.js"></script>
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