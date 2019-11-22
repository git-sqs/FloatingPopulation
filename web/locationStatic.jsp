<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人口信息统计</title>


    <link href="${pageContext.request.contextPath}/css/all.css" rel="stylesheet" type="text/css">

</head>

<body style="background-color: #e6ecf5">
<div class="book_con01">
</table>
    <div class="my_static" id="chart1">
    </div>
</div>
<div class="book_con01">
    </table>
    <div class="my_static" id="chart2">
    </div>
</div>
<div class="book_con01">
    </table>
    <div class="my_static" id="chart3">
    </div>
</div>
<script  src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script  src="${pageContext.request.contextPath}/js/echarts/echarts.js"></script>
<script >
    $(function(){
        var stb1 = new Array();//在线
        <c:forEach var="item" items="${myStatic}" varStatus="s">
        stb1[${s.index}] = ${item};
        </c:forEach>

        var myChart1 = echarts.init($("#chart1")[0]);
        var myChart2 = echarts.init($("#chart2")[0]);
        var myChart3 = echarts.init($("#chart3")[0]);
        option1 = {
            title: {
                x: 'center',
                text: '年龄结构',

            },
            tooltip: {
                trigger: 'item'
            },

            calculable: true,
            grid: {
                borderWidth: 0,
                y: 80,
                y2: 60
            },
            xAxis: [
                {
                    type: 'category',
                    show: true,
                    data: ['10岁以下', '10 ~ 20岁','20 ~ 30岁','30 ~ 40岁','40 ~ 50岁','50 ~ 60岁','60 ~ 70岁','70岁以上']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    show: true
                }
            ],
            series: [
                {
                    name: '年龄结构',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function(params) {
                                var colorList = [
                                    '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                    '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                    '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top'
                            }
                        }
                    },
                    data: [stb1[0],stb1[1],stb1[2],stb1[3],stb1[4],stb1[5],stb1[6],stb1[7]],
                    markPoint: {
                        tooltip: {
                            trigger: 'item',
                            backgroundColor: 'rgba(0,0,0,0)'
                        }
                    }
                }
            ]
        };
        option2 = {
            title: {
                x: 'center',
                text: '文化层次结构',

            },
            tooltip: {
                trigger: 'item'
            },

            calculable: true,
            grid: {
                borderWidth: 0,
                y: 80,
                y2: 60
            },
            xAxis: [
                {
                    type: 'category',
                    show: true,
                    data: ['小学以下', '小学','初中','高中', '大学','硕士', '博士以上',]
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    show: true
                }
            ],
            series: [
                {
                    name: '流动人口信息统计',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function(params) {
                                var colorList = [
                                    '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                    '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                    '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top'
                            }
                        }
                    },
                    data: [stb1[8],stb1[9],stb1[10],stb1[11],stb1[12],stb1[13],stb1[14],],
                    markPoint: {
                        tooltip: {
                            trigger: 'item',
                            backgroundColor: 'rgba(0,0,0,0)'
                        }
                    }
                }
            ]
        };
        option3 = {
            title: {
                x: 'center',
                text: '收入水平结构',

            },
            tooltip: {
                trigger: 'item'
            },

            calculable: true,
            grid: {
                borderWidth: 0,
                y: 80,
                y2: 60
            },
            xAxis: [
                {
                    type: 'category',
                    show: true,
                    data: ['500元以下', '500-1000元','1000-2000元','2000-3000元','3000-4000元', '4000-5000元','5000以上']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    show: true
                }
            ],
            series: [
                {
                    name: '流动人口信息统计',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function(params) {
                                var colorList = [
                                    '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                    '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                    '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top',
                            }
                        }
                    },
                    data: [stb1[15],stb1[16],stb1[17],stb1[18],stb1[19],stb1[20],stb1[21]],
                    markPoint: {
                        tooltip: {
                            trigger: 'item',
                            backgroundColor: 'rgba(0,0,0,0)'
                        }
                    }
                }
            ]
        };
        myChart1.setOption(option1);
        myChart2.setOption(option2);
        myChart3.setOption(option3);
    });
</script>
</body>
</html>
