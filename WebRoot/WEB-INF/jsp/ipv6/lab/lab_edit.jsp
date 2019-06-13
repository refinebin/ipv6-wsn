<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp"%>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div id="zhongxin" style="padding-top: 13px;">
                <img src="<%=basePath%>uploadFiles/uploadImgs/20190108/lab5.jpg" alt="7教5楼缩略图" width="1000" height="600" style="z-index: -1" >
                    <%--<map id="lab" name="lab">--%>
                        <%--<area shape="rect" coords="660,96,789,168" href="#" title="矩形" alt="矩形">--%>
                    <%--</map>--%>
                    <%--<img src="<%=basePath%>uploadFiles/uploadImgs/20190108/30.jpg" style="opacity:0.7; position: absolute;left: 550px; top: 82px"/>--%>
                    <%--<img src="<%=basePath%>uploadFiles/uploadImgs/20190108/30-40.jpg" style="opacity:0.7;position: absolute;left: 500px; top: 340px"/>--%>
                    <%--<img src="<%=basePath%>uploadFiles/uploadImgs/20190108/40-50.jpg" style="opacity:0.7;position: absolute;left: 300px; top: 360px"/>--%>
                    <%--<img id="30" name="30" src="<%=basePath%>uploadFiles/uploadImgs/20190108/30.jpg" style="opacity:0.7; position: absolute;left: 700px; top: 360px"/>--%>
                    <%--<img id="30-40" name="30-40" src="<%=basePath%>uploadFiles/uploadImgs/20190108/30-40.jpg" style="opacity:0.7;position: absolute;left: 700px; top: 360px"/>--%>
                    <%--<img id="40-50" name="40-50" src="<%=basePath%>uploadFiles/uploadImgs/20190108/40-50.jpg" style="opacity:0.7;position: absolute;left: 700px; top: 360px"/>--%>
                    <%--<img id="50" name="50" src="<%=basePath%>uploadFiles/uploadImgs/20190108/50.jpg" style="opacity:0.7;position: absolute;left: 700px; top: 360px"/>--%>
                    <img id="img" name="img" src="<%=basePath%>uploadFiles/uploadImgs/20190108/50.jpg" style="opacity:0.7;position: absolute;left: 700px; top: 360px"/>
                </div>
                <div>
                    <p id="tem">7501当前温度为：</p>
                </div>
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->


<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    //保存
    function save(){
        if($("#AREA_NAME").val()==""){
            $("#AREA_NAME").tips({
                side:3,
                msg:'请输入区域名称',
                bg:'#AE81FF',
                time:2
            });
            $("#AREA_NAME").focus();
            return false;
        }
        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }

    $(function() {
        //下拉框
        if(!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect:true});
            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function() {
                    $('.chosen-select').each(function() {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    });
                }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function(e, event_name, event_val) {
                if(event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function() {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                });
            });
            $('#chosen-multiple-style .btn').on('click', function(e){
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }
    });

    $(function() {
        //日期框
        $('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    });

    function load() {
        $.ajax({
            type:"post",
            url:"<%=basePath%>ajax/lab/temperature",
//									url:"http://127.0.0.1:8080/record/selectBySensorIdAndTime",

            dataType: "json",
            data:{
                sensorId:1
            },
            success:function(sdata){

                var da = JSON.stringify(sdata.data);
                var dat = JSON.parse(da);
                console.log("dat:"+dat[0][0].RECORD_VALUE);
                var  y = dat[0][0].RECORD_VALUE;
                document.getElementById("tem").innerText = "7501当前温度为："+y;
                if(y < 30){
                    document.getElementById("img").src = "<%=basePath%>uploadFiles/uploadImgs/20190108/30.jpg";

                }else if(y < 40){
                    // $("#30").style.display = "none";
                    // $("#30-40").style.display = "block";
                    // $("#40-50").style.display = "none";
                    // $("#50").style.display = "none";
                    document.getElementById("img").src = "<%=basePath%>uploadFiles/uploadImgs/20190108/30-40.jpg";

                }else if(y < 50){
                    // $("#30").style.display = "none";
                    // $("#30-40").style.display = "none";
                    // $("#40-50").style.display = "block";
                    // $("#50").style.display = "none";
                    document.getElementById("img").src = "<%=basePath%>uploadFiles/uploadImgs/20190108/40-50.jpg";

                }else{
                    // $("#30").style.display = "none";
                    // $("#30-40").style.display = "none";
                    // $("#40-50").style.display = "none";
                    // $("#50").style.display = "block";
                    document.getElementById("img").src = "<%=basePath%>uploadFiles/uploadImgs/20190108/50.jpg";

                }

            },
            error:function () {
                alert("请先开启发送端！");
            }
        });
    }

    var fun1 = window.setInterval(load, 1000);

</script>
</body>
</html>