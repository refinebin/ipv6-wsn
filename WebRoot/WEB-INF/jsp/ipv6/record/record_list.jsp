<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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

                        <!-- 检索  -->
                        <form action="record/list.do" method="post" name="Form" id="Form">
                            <table style="margin-top:5px;">
                                <tr>
                                    <td style="padding-left:2px;"><input class="span10 date-picker" name="LASTSTART" id="LASTSTART"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
                                    <td style="padding-left:2px;"><input class="span10 date-picker" name="LASTEND" id="LASTEND"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
                                    <input type="hidden" name="SENSOR_ID" id="SENSOR_ID" value="${pd.SENSOR_ID}"/>
                                    <c:if test="${QX.cha == 1 }">
                                        <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </c:if>
                                </tr>
                            </table>
                        </form>
                        <div id="zhongxin" style="padding-top: 13px;">
                            <div id="box" style="height: 400px;width: 800px;padding: 20px">

                            </div>
                        </div>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->

    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!-- echarts图表 -->
<script src="static/ace/js/echarts.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());//关闭加载状态
    $(document).ready(function(){
        setInterval("tosearch()",5000);    //每隔五秒再调用一次，可自行修改
    });
    //检索
    function tosearch(){
        top.jzts();
        $("#Form").submit();
    }
    $(function() {

        //日期框
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        });

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

</script>
<c:set var="varList" value="${varList}" scope="application"/>
<script>
    // 获取到这个DOM节点，然后初始化

    var thresholdValue = [];
    var sensorValue = [];
    var xValue = [];
    <c:choose>
    <c:when test="${not empty varList}">
        <c:forEach items="${varList}" var="var" varStatus="vs">
            var item = {
                name:'阈值',
                value:${var.THRESHOLD_VALUE}
            }
            thresholdValue.push(item);

            var item2 = {
                name:'传感器数值',
                value:${var.RECORD_VALUE}
            }
            sensorValue.push(item2);

            var item3 = {
                value:'${var.CREATE_TIME}'
            }
            xValue.push(item3);

        </c:forEach>
    </c:when>
    </c:choose>
    var myChart = echarts.init(document.getElementById("box"));
    var option = {
        // 标题
        title: {
            text: '传感器数据显示',
            subtext: '数据来源：后台'
        },
        tooltip: {
            trigger: 'axis'
        },
        //图例名
        legend: {
            data:['传感器阈值','数值记录']
        },
        grid: {
            left: '3%',   //图表距边框的距离
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        //工具框，可以选择
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        //x轴信息样式
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['12-01','12-02','12-03','12-04','12-05','12-05','12-06','12-07','12-08','12-09','12-10','12-11','12-12','12-13'],
            //坐标轴颜色
            axisLine:{
                lineStyle:{
                    color:'red'
                }
            },
            //x轴文字旋转
            axisLabel:{
                rotate:30,
                interval:'auto'
            }
        },

        yAxis : [
            {
                type : 'value',
                axisLabel : {
                    formatter: '{value} '
                }
            }
        ],
        series: [
            //虚线
            {
                name:'阈值',
                type:'line',
                symbolSize:4,   //拐点圆的大小
                // showAllSymbol:true,
                color:['red'],  //折线条的颜色
                data:[1000, 300, 500, 800, 300, 600,500,800, 300, 500, 800, 300, 600,500],
                smooth:false,   //关键点，为true是不支持虚线的，实线就用true
                itemStyle:{
                    normal:{
                        lineStyle:{
                            width:2,
                            type:'dotted'  //'dotted'虚线 'solid'实线
                        }
                    }
                }
            },
            //实线
            {
                name:'记录数值',
                type:'line',
                symbol:'circle',
                symbolSize:4,
                // showAllSymbol:true,
                itemStyle:{
                    normal:{
                        color:'green',
                        borderColor:'green'  //拐点边框颜色
                    }
                },
                data:[220, 182, 191, 234, 290, 330, 310,220, 182, 191, 234, 290, 330, 310]
            }
        ],
        dataZoom:{
            realtime:true,
            height:10,
            start:0,
            end:65
        }
    };
    option.series[0].data = thresholdValue;
    console.log("thresholdValue", thresholdValue);
    option.series[1].data = sensorValue;

    console.log("sensorValue", sensorValue);
    option.xAxis.data = xValue;

    console.log("xValue", xValue);
    myChart.setOption(option);
</script>


</body>
</html>