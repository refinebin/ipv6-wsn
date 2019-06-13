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
                <div class="row">
                    <div class="col-xs-12">

                            <form action="area/${msg }.do" name="Form" id="Form" method="post">
                            <input type="hidden" name="AREA_ID" id="AREA_ID" value="${pd.AREA_ID}"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <div>
                                    <div id="container" style="width:600px;height:350px;margin:0 auto;float: left;"></div>
                                    <div id="container1" style="width:600px;height:350px;margin:0 auto;float: right;"></div>
                                </div>
                                <div>
                                    <div id="container2" style="width:600px;height:350px;margin:0 auto;float: left;"></div>
                                    <div id="container3" style="width:600px;height:350px;margin:0 auto;float: right;"></div>
                                </div>

                            </div>
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
                        </form>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
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
<script type="text/javascript" src="static/js/highcharts.js"></script>
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
</script>

<script type="text/javascript">
    var areaid = ${pd.AREA_ID}
    $(function () {
        $(document).ready(function() {

            $.ajax({
                type:"post",
                // url:"http://219.231.223.73/RoomEnvironment/record/selectBySensorIdAndTime",
                url:"<%=basePath%>ajax/record/selectByAreaId",
                async:false,
                dataType: "json",
                data:{
                    areaId:areaid
                },
                success:function(sdata){

                    console.log(sdata.data[0].value);
                    var temValue = sdata.data[0].value;
                    var semValue = sdata.data[1].value;
                    var mo2 = sdata.data[2].value;
                    var mo13 = sdata.data[3].value;
                    var wave = sdata.data[4].value;
                    if(wave == 1){
                        alert("发生震动，请注意检查");
                    }
                    Highcharts.setOptions({
                        global: {
                            useUTC: false
                        }
                    });

                    var chart;
                    $('#container').highcharts({
                        chart: {
                            type: 'spline',
                            animation: Highcharts.svg, // don't animate in old IE
                            marginRight: 10,
                            events: {
                                load: function() {

                                    // set up the updating of the chart each second
                                    var series = this.series[0];
                                    setInterval(function() {
                                        $.ajax({
                                            type:"post",
                                            url:"<%=basePath%>ajax/record/selectBySensorId",
//									url:"http://127.0.0.1:8080/record/selectBySensorIdAndTime",

                                            dataType: "json",
                                            data:{
                                                sensorId:1
                                            },
                                            success:function(sdata){
//											var temValue = sdata.data[0].value;
                                                var x = (new Date()).getTime()-3000, // current time
                                                    y = sdata.data[0].value;
                                                if(y > 45){
                                                    alert("温度超过阈值，请注意");
                                                }
                                                var wave = sdata.data[4].value;
                                                if(wave == 1){
                                                    alert("发生震动，请注意检查");
                                                }
                                                series.addPoint([x, y], true, true);
                                            }
                                        });

                                    }, 1000);
                                }
                            }
                        },
                        title: {
                            text: '温度传感器 '
                        },
                        xAxis: {
                            type: 'datetime',
                            tickPixelInterval: 100
                        },
                        yAxis: {
                            title: {
                                text: '当前温度'
                            },
                            plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                                    Highcharts.numberFormat(this.y, 2);
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        exporting: {
                            enabled: false
                        },
                        series: [{
                            name: '温度',
                            data: (function() {
                                // generate an array of random data
                                var data = [],
                                    time = (new Date()).getTime(),
                                    i;

                                for (i = -23; i <= -3; i++) {
                                    data.push({
                                        x: time + i * 1000,
                                        y: temValue
                                    });
                                }
                                return data;
                            })()
                        }]
                    });
                    var chart;
                    $('#container1').highcharts({
                        chart: {
                            type: 'spline',
                            animation: Highcharts.svg, // don't animate in old IE
                            marginRight: 10,
                            events: {
                                load: function() {

                                    // set up the updating of the chart each second
                                    var series = this.series[0];
                                    setInterval(function() {

                                        $.ajax({
                                            type:"post",
                                            url:"<%=basePath%>ajax/record/selectBySensorId",
//									url:"http://127.0.0.1:8080/record/selectBySensorIdAndTime",

                                            dataType: "json",
                                            data:{
                                                sensorId:2
                                            },
                                            success:function(sdata){
//											var temValue = sdata.data[0].value;
                                                var x = (new Date()).getTime()-3000, // current time
                                                    y = sdata.data[1].value;
                                                if(y > 70){
                                                    alert("湿度超过阈值，请注意");
                                                }
                                                series.addPoint([x, y], true, true);
                                            }
                                        });
                                    }, 1000);
                                }
                            }
                        },
                        title: {
                            text: '湿度传感器'
                        },
                        xAxis: {
                            type: 'datetime',
                            tickPixelInterval: 100
                        },
                        yAxis: {
                            title: {
                                text: '湿度'
                            },
                            plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                                    Highcharts.numberFormat(this.y, 2);
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        exporting: {
                            enabled: false
                        },
                        series: [{
                            name: '当前湿度',
                            data: (function() {
                                // generate an array of random data
                                var data = [],
                                    time = (new Date()).getTime(),
                                    i;

                                for (i = -23; i <= -3; i++) {
                                    data.push({
                                        x: time + i * 1000,
                                        y: semValue
                                    });
                                }
                                return data;
                            })()
                        }]
                    });

                    var chart;
                    $('#container2').highcharts({
                        chart: {
                            type: 'spline',
                            animation: Highcharts.svg, // don't animate in old IE
                            marginRight: 10,
                            events: {
                                load: function() {

                                    // set up the updating of the chart each second
                                    var series = this.series[0];
                                    setInterval(function() {
                                        $.ajax({
                                            type:"post",
                                            url:"<%=basePath%>ajax/record/selectBySensorId",
//									url:"http://127.0.0.1:8080/record/selectBySensorIdAndTime",

                                            dataType: "json",
                                            data:{
                                                sensorId:3
                                            },
                                            success:function(sdata){
//											var temValue = sdata.data[0].value;
//											var x = sdata.data[2].create_time, // current time
                                                var x = (new Date()).getTime()-3000,
                                                    y = sdata.data[2].value;
                                                if(y > 1500){
                                                    alert("MQ2超过阈值，请注意");
                                                }
                                                series.addPoint([x, y], true, true);
                                            }
                                        });
                                    }, 1000);
                                }
                            }
                        },
                        title: {
                            text: '烟雾传感器MQ2'
                        },
                        xAxis: {
                            type: 'datetime',
                            tickPixelInterval: 100
                        },
                        yAxis: {
                            title: {
                                text: '浓度'
                            },
                            plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                                    Highcharts.numberFormat(this.y, 2);
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        exporting: {
                            enabled: false
                        },
                        series: [{
                            name: '浓度',
                            data: (function() {
                                // generate an array of random data
                                var data = [],
                                    time = (new Date()).getTime(),
                                    i;

                                for (i = -23; i <= -3; i++) {
                                    data.push({
                                        x: time + i * 1000,
                                        y: mo2
                                    });
                                }
                                return data;
                            })()
                        }]
                    });
                    var chart;
                    $('#container3').highcharts({
                        chart: {
                            type: 'spline',
                            animation: Highcharts.svg, // don't animate in old IE
                            marginRight: 10,
                            events: {
                                load: function() {

                                    // set up the updating of the chart each second
                                    var series = this.series[0];
                                    setInterval(function() {
                                        $.ajax({
                                            type:"post",
                                            url:"<%=basePath%>ajax/record/selectBySensorId",

                                            dataType: "json",
                                            data:{
                                                sensorId:4
                                            },
                                            success:function(sdata){
//											var temValue = sdata.data[0].value;
//											var x = sdata.data[3].create_time, // current time
                                                var x = (new Date()).getTime()-3000,
                                                    y = sdata.data[3].value;
                                                if(y > 1500){
                                                    alert("MQ135超过阈值，请注意");
                                                }
                                                series.addPoint([x, y], true, true);
                                                console.log("x:"+x);
                                            }
                                        });
                                    }, 1000);
                                }
                            }
                        },
                        title: {
                            text: '烟雾传感器MQ135'
                        },
                        xAxis: {
                            type: 'datetime',
                            tickPixelInterval: 100
                        },
                        yAxis: {
                            title: {
                                text: '浓度'
                            },
                            plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                                    Highcharts.numberFormat(this.y, 2);
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        exporting: {
                            enabled: false
                        },
                        series: [{
                            name: '浓度',
                            data: (function() {
                                // generate an array of random data
                                var data = [],
                                    time = (new Date()).getTime(),
                                    i;

                                for (i = -23; i <= -3; i++) {
                                    data.push({
                                        x: time + i * 1000,
                                        y: mo13
                                    });
                                }
                                return data;
                            })()
                        }]
                    });

                },
                error:function(sdata){
                    console.log(sdata);
                    alert("请先开启接收端!");
                }
            });


        });

    })();
</script>
</body>
</html>