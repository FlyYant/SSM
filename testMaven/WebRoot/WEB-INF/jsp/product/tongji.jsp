 <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
    <script src="${ctx}/resource/js/echarts.min.js"></script>
</head>
<body>
<div id="main" class="panel admin-panel" style="width: 100%;height: 100%;"></div>

</body>
<script type="text/javascript">
$(function () {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '水果月销数量统计',
            subtext: '数据库统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            type: 'scroll',
            orient: 'vertical',
            right: 10,
            top: 20,
            bottom: 20,
            data: [],
            selected:{},
        },
        series: [
            {
                name: '水果名称',
                type: 'pie',
                radius: '55%',
                center: ['40%', '50%'],
                data: [],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    $.ajax({
        url : "${ctx}/product/select",
        datatype : "json",
        type : "post",
        async:true,//同步
        success : function(data) {
            var selecteds={}
            for (var i = 0; i<data.length; i++) {
                option.series[0].data.push({value:data[i].gmNum,name:data[i].pname});
                option.legend.data.push(data[i].pname);
                selecteds[data[i].pname]=i<6;
            }
            option.legend.selected=selecteds
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    })

})
</script>
</html>