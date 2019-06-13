
function cmainFrame(){
	var hmain = document.getElementById("mainFrame");
	var bheight = document.documentElement.clientHeight;
	hmain .style.width = '100%';
	hmain .style.height = (bheight  - 55) + 'px';
	var bkbgjz = document.getElementById("bkbgjz");
	bkbgjz .style.height = (bheight  - 58) + 'px';
	
}
cmainFrame();
window.onresize=function(){  
	cmainFrame();
};
jzts();