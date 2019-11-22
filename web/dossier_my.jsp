<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info-mgt.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.5/layui/css/layui.css">
    <style>
        .layui-layer-title {
            background: url(images/righttitlebig.png) repeat-x;
            font-weight: bold;
            color: #46647e;
            border: 1px solid #c1d3de;
            height: 33px;
            line-height: 33px;
        }

        .tabe_bot label {
            width: 70px;
            text-align: right;
            font-size: 14px;
            font-weight: 900;
            color: #46647e
        }

        .l_left {
            float: left;
            margin-left: 10px;
            margin-top: 20px
        }

        .tabe_bot input, .tabe_bot select {
            width: 180px;
            height: 30px;
            border-radius: 6px;
            margin: 0 20px 0 0;
            border: none;
            border: 1px #ccc solid;
            text-indent: 1em
        }

        .tabe_btn {
            width: 60px;
            height: 30px;
            background-color: #68b86c;
            border: none;
            border-radius: 6px;
            color: #fff;
            margin-left: 20px;
        }
    </style>
    <title>租退房管理</title>
</head>

<body onload="Workload()">
<div class="title"><h2>租退房管理</h2></div>
<div class="query">
    <form action="${pageContext.request.contextPath}/House/showHouse">
        <div class="tabe_bot">
            <div class="l_left" id="rentalSituation"><label>出租情况：</label>
                <select name="rent">
                    <option label="请选择出租情况" value="0" style="display: none"></option>
                    <option label="未出租" value="1"></option>
                    <option label="已出租" value="2"></option>
                </select>
            </div>

            <div class="l_left" id="decorationStatus"><label>装修状况：</label>
                <select name="fitment">
                    <option label="请选择装修状况" value="0" style="display: none"></option>
                    <option label="精装" value="1"></option>
                    <option label="简装" value="2"></option>
                    <option label="毛坯" value="3"></option>
                </select>
            </div>
            <div class="l_left" id="area"><label>面积：</label>
                <select name="area">
                    <option label="请选择面积" value="0" style="display: none"></option>
                    <option label="20平米以下" value="1"></option>
                    <option label="20-40平米" value="2"></option>
                    <option label="40-60平米" value="3"></option>
                    <option label="60-80平米" value="4"></option>
                    <option label="80-100平米" value="5"></option>
                    <option label="100以上" value="6"></option>
                </select>
            </div>
            <div class="clear"></div>
        </div>
        <div style="width: 100%;margin-top: 20px;">
            <button class="tabe_btn " type="submit">查询</button>
        </div>
    </form>
</div>
<div class="table-operate ue-clear">
    <a href="${pageContext.request.contextPath}/dossier_myAdd.jsp" class="add">添加</a>
    <a href="#" class="edit" onclick="batchDelete()">删除</a>
</div>
<div class="table-box">
    <form id="tableForm" action="${pageContext.request.contextPath}/House/batchDelete" method="post">
        <table <%--id="tabletwo"--%> class="table_style" style="width: 1360px;border: 1px">
            <tr style="font-weight: bolder;">
                <th><label>
                    <input type="checkbox" id="totalBatch" onchange="selectAll(this)">
                </label></th>
                <th>居住地址</th>
                <th>价格</th>
                <th>面积</th>
                <th>楼层</th>
                <th>出租状态</th>
                <th>装修情况</th>
                <th>房东信息</th>
            </tr>
            <c:forEach items="${allHouse}" var="all" varStatus="s">
            <tr>
                    <%--<td style="vertical-align: middle"><label>
                        <input type="checkbox" value="${all.id}" name="ids" onchange="changeBatch(this)">
                    </label></td>--%>
                <td style="vertical-align: middle">
                    <label>
                        <input type="checkbox" value="${all.id}" name="ids" onchange="changeBatch(this)">
                    </label>
                </td>

                <td style="vertical-align: middle">${all.addr}</td>
                <td style="vertical-align: middle">${all.price}/月</td>
                <td style="vertical-align: middle">${all.area}平方米</td>
                <td style="vertical-align: middle">${all.floor}层</td>
                <td style="vertical-align: middle">
                    <button class="layui-btn  layui-btn-sm layui-btn-radius layui-btn-normal"
                            type="button" onclick="houseRental(${all.rent},${all.id})">
                            ${all.myRent}
                    </button>
                </td>
                <td style="vertical-align: middle">${all.myFitment}</td>
                <td style="vertical-align: middle">
                    <button type="button" class="btn btn-info" id="master"
                            onclick="showMaster(${all.master})">${all.name}</button>

                    </c:forEach>
        </table>
        </form>
</div>
<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/js/date/js/laydate.js"></script>
<script src="${pageContext.request.contextPath}/js/work.js"></script>
<script src="${pageContext.request.contextPath}/layui-v2.5.5/layui/layui.js"></script>
<script>

    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();

    var deleteNum = 0;

    function batchDelete() {
        if (deleteNum == 0) {
            alert("未选择数据");
        } else {
            document.getElementById("tableForm").submit();
        }
    };


    function selectAll(obj) {
        var allIds = document.getElementsByName("ids");
        for (var i = 0; i < allIds.length; i++) {
            //alert(i);
            allIds[i].checked = obj.checked;
        }
        if (obj.checked) {
            deleteNum = allIds.length;
            //alert(deleteNum);
        } else {
            deleteNum = 0;
        }
    }


    function changeBatch(obj) {
        var checked = obj.checked;
        if (checked) {
            deleteNum = deleteNum + 1;
            //alert(deleteNum);
        } else {
            deleteNum = deleteNum - 1;
        }
        var allIds = document.getElementsByName("ids");
        if (deleteNum != allIds.length) {
            document.getElementById("totalBatch").checked = false;
        } else {
            document.getElementById("totalBatch").checked = true;
        }
    }


    function showMaster(id) {
        $.ajax({
            type: "get",
            url: "/FloatingPopulation/House/showMaster",
            data: {"id": id},
            dataType: "json",
            success: function (msg) {
                json1 = eval(msg);
                layer.alert('房东姓名：' + json1[0].name + '<html><br></html>' + '房东性别：' + json1[0].gender + '<html><br></html>' + '房东年龄：' + json1[0].age + '<html><br></html>' + '身份证号：' + json1[0].idnum + '<html><br></html>' + '联系方式：' + json1[0].photo);
            }
        })
    };

    function houseRental(id, id2) {

        if (id === 2) {
            $.ajax({
                type: "get",
                url: "/FloatingPopulation/House/getRentPeople",
                data: {"houseId": id2},
                dataType: "json",
                success: function (msg) {
                    layer.alert('租户姓名：' + msg.rentName + '<html><br></html>' + '身份证号：' + msg.rentId + '<html><br><button onclick="exitRent(' + id2 + ')">退租</button></html>');
                }
            })
        }

        if (id === 1) {
            var rentName = prompt("请输入租户姓名:");
            if (rentName != null && $.trim(rentName) != "") {
                var rentId = prompt("请输入身份证号:");
                if (rentId != null && $.trim(rentId) != "") {
                    location.href = "${pageContext.request.contextPath}/House/rentPeople?rentName=" + rentName + "&rentId=" + rentId + "&houseId=" + id2;
                } else {
                    alert("未输入身份证号，租住失败");
                }
            }
        }
    }

    function exitRent(id) {
        location.href = "${pageContext.request.contextPath}/House/exitRent?houseId=" + id;
    }

</script>
<script src="${pageContext.request.contextPath}/js/layer_v2.1/layer/layer.js"></script>
</html>
