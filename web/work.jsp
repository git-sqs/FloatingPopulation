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
    <title>人口信息管理</title>
</head>

<body onload="Workload()">
<div class="title"><h2>人口信息管理</h2></div>
<div class="query">
    <form action="${pageContext.request.contextPath}/Basic/showPeople">
        <div class="tabe_bot">
            <div class="l_left"><label>姓名：</label><input type="text" placeholder="请输入" name="name" id="tit"></div>
            <div class="l_left"><label>身份证号：</label><input type="text" placeholder="请输入" name="IDNum" id="person"></div>
            <div class="l_left"><label>年龄：</label><input type="text" placeholder="请输入" name="age" id="age"></div>
            <div class="l_left" id="gender">
                <label>性别：</label>
                <select name="gender">
                    <option value="" style="display: none"></option>
                    <option label="男" value="男"></option>
                    <option label="女" value="女"></option>
                </select>
            </div>
            <div class="l_left"><label>居住地址：</label><input type="text" placeholder="请输入" name="address" id="address">
            </div>
            <div class="l_left" id="culturalLevel">
                <label>文化层次：</label>
                <select name="education">
                    <option label="请选择文化层次" value="0" style="display: none"></option>
                    <option label="小学以下" value="1"></option>
                    <option label="小学" value="2"></option>
                    <option label="初中" value="3"></option>
                    <option label="高中" value="4"></option>
                    <option label="大学" value="5"></option>
                    <option label="硕士" value="6"></option>
                    <option label="博士以上" value="7"></option>
                </select>
            </div>
            <div class="l_left" id="keyPopulation">
                <label>重点人口：</label>
                <select name="intensive">
                    <option label="请选择重点人口" value="0" style="display: none"></option>
                    <option label="未成年人" value="1"></option>
                    <option label="老年人" value="2"></option>
                    <option label="退役军人" value="3"></option>
                    <option label="烈士家属" value="4"></option>
                    <option label="离退休人员" value="5"></option>
                    <option label="两劳两教人员" value="6"></option>
                </select>
            </div>
            <div class="l_left" id="incomeLevel">
                <label>收入水平：</label>
                <select name="income">
                    <option label="请选择每月收入" value="0" style="display: none"></option>
                    <option label="500元以下" value="1"></option>
                    <option label="500-1000元" value="2"></option>
                    <option label="1000-2000元" value="3"></option>
                    <option label="2000-3000元" value="4"></option>
                    <option label="3000-4000元" value="5"></option>
                    <option label="3000-5000元" value="6"></option>
                    <option label="5000以上" value="7"></option>
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
    <a href="${pageContext.request.contextPath}/workAdd.jsp" class="add">添加</a>
    <a href="#" class="out" onclick="batchDelete()">删除</a>
    <a href="${pageContext.request.contextPath}/Basic/statistics" class="count">统计</a>
    <span style="float: right;size: 20px;color:#FF5722;margin-right: 30px">点击姓名可编辑信息</span>
</div>
<div class="table-box">
    <form id="tableForm" action="${pageContext.request.contextPath}/Basic/deletePeople" method="post">
        <table <%--id="table"--%> class="table_style" style="width: 1360px;border: 1px">
            <tr style="font-weight: bolder;">
                <th><label>
                    <input type="checkbox" id="totalBatch" onchange="selectAll(this)">
                </label></th>
                <th>姓名</th>
                <th>身份证号</th>
                <th>年龄</th>
                <th>性别</th>
                <th>居住地址</th>
                <th>文化层次</th>
                <th>重点人口</th>
                <th>收入水平</th>
            </tr>
            <c:forEach items="${allPeople}" var="all" varStatus="s">
                <tr>
                    <td style="vertical-align: middle">
                        <label>
                            <input type="checkbox" value="${all.id}" name="ids" onchange="changeBatch(this)">
                        </label>
                    </td>
                    <td style="vertical-align: middle">
                        <a href="#" onclick="editPeople(${all.id})">${all.name}</a></td>
                    <td style="vertical-align: middle">${all.IDNum}</td>
                    <td style="vertical-align: middle">${all.age}</td>
                    <td style="vertical-align: middle">${all.gender}</td>
                    <td style="vertical-align: middle">${all.address}</td>
                    <td style="vertical-align: middle">${all.level}</td>
                    <td style="vertical-align: middle">${all.sort}</td>
                    <td style="vertical-align: middle">${all.everyIncome}</td>

                </tr>
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

<script>
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();

    function editPeople(id) {
        location.href = "${pageContext.request.contextPath}/Basic/findOne?id=" + id;
    }
    var deleteNum = 0;

    function batchDelete() {
        if (deleteNum == 0) {
            alert("未选择数据");
        } else {
            document.getElementById("tableForm").submit();
        }
    };

    function selectAll(obj) {

        alert(obj.checked);
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

</script>
<script src="${pageContext.request.contextPath}/js/layer_v2.1/layer/layer.js"></script>
<!--<script type="text/javascript">-->

<!--function openlayer(id){-->
<!--layer.open({-->
<!--type: 2,-->
<!--title: '添加信息',-->
<!--shadeClose: true,-->
<!--shade: 0.5,-->
<!--skin: 'layui-layer-rim',-->
<!--//            maxmin: true,-->
<!--closeBtn:1,-->
<!--area: ['80%', '75%'],-->
<!--shadeClose: true,-->
<!--closeBtn: 1,-->
<!--content: 'work_tail.html'-->
<!--//iframe的url-->
<!--});-->
<!--}-->
<!--</script>-->
</html>
