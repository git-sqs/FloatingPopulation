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
        .tabe_bot label {
            width: 70px;
            text-align: right;
            font-size: 14px;
            font-weight: 900;
            color: #46647e
        }
        .l_left {
            display: inline-block;
            margin-left: 40px;
            margin-top: 20px;
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
            margin-right: 80px;
            float: right;
        }
    </style>
    <title>人口信息管理</title>
</head>

<body onload="Workload()">

<div class="title">
    <c:if test="${empty findOnePeople.id}">
        <h2>人口信息添加</h2>
    </c:if>
    <c:if test="${not empty findOnePeople.id}">
        <h2>人口信息修改</h2>
    </c:if></div>
<div class="query">
    <form action="${pageContext.request.contextPath}/Basic/addPeople">
        <div class="tabe_bot">
            <input type="hidden" name="id" value="${findOnePeople.id}"  />
            <div class="l_left"><label>姓名：</label>
                <c:if test="${empty findOnePeople.name}">
                    <input type="text" placeholder="请输入" name="name" id="tit">
                </c:if>
                <c:if test="${not empty findOnePeople.name}">
                    <input type="text" placeholder="请输入" name="name" id="tit" value="${findOnePeople.name}" readonly="readonly">
                </c:if>

            </div><br>
            <div class="l_left"><label>身份证号：</label><input type="text" placeholder="请输入" name="IDNum" id="person" value="${findOnePeople.IDNum}"></div><br>
            <div class="l_left"><label>年龄：</label><input type="text" placeholder="请输入" name="age" id="age" value="${findOnePeople.age}"></div><br>
            <div class="l_left" id="gender">
                <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp性别：</label>
                <select name="gender">
                    <option>${findOnePeople.gender}</option>
                    <option label="男" value="男"></option>
                    <option label="女" value="女"></option>
                </select>
            </div><br>
            <div class="l_left"><label>居住地址：</label><input type="text" placeholder="请输入" name="address" id="address" value="${findOnePeople.address}"></div><br>
            <div class="l_left" id="culturalLevel">
                <label>文化层次：</label>
                <select name="education">
                    <c:if test="${empty findOnePeople.education}">
                        <option label="请选择文化层次" value="0" style="display: none"></option>
                    </c:if>
                    <c:if test="${not empty findOnePeople.education}">
                        <option value="${findOnePeople.education}">${findOnePeople.level}</option>
                    </c:if>
                    <option label="小学以下" value="1"></option>
                    <option label="小学" value="2"></option>
                    <option label="初中" value="3"></option>
                    <option label="高中" value="4"></option>
                    <option label="大学" value="5"></option>
                    <option label="硕士" value="6"></option>
                    <option label="博士以上" value="7"></option>
                </select>
            </div><br>
            <div class="l_left" id="keyPopulation">
                <label>重点人口：</label>
                <select name="intensive">
                    <c:if test="${empty findOnePeople.intensive}">
                        <option label="请选择重点人口" value="0" style="display: none"></option>
                    </c:if>
                    <c:if test="${not empty findOnePeople.intensive}">
                        <option value="${findOnePeople.intensive}">${findOnePeople.sort}</option>
                    </c:if>

                    <option label="未成年人" value="1"></option>
                    <option label="老年人" value="2"></option>
                    <option label="退役军人" value="3"></option>
                    <option label="烈士家属" value="4"></option>
                    <option label="离退休人员" value="5"></option>
                    <option label="两劳两教人员" value="6"></option>
                </select>
            </div><br>
            <div class="l_left" id="incomeLevel">
                <label>收入水平：</label>
                <select name="income">
                    <c:if test="${empty findOnePeople.income}">
                        <option label="请选择每月收入" value="0" style="display: none"></option>
                    </c:if>
                    <c:if test="${not empty findOnePeople.income}">
                        <option value="${findOnePeople.income}">${findOnePeople.everyIncome}</option>
                    </c:if>
                    <option label="500元以下" value="1"></option>
                    <option label="500-1000元" value="2"></option>
                    <option label="1000-2000元" value="3"></option>
                    <option label="2000-3000元" value="4"></option>
                    <option label="3000-4000元" value="5"></option>
                    <option label="3000-5000元" value="6"></option>
                    <option label="5000以上" value="7"></option>
                </select>
            </div><br>
            <div style="width: 100%;margin-top: 20px;">
                <c:if test="${empty findOnePeople.id}">
                    <button class="tabe_btn " type="submit">添加</button>
                </c:if>
                <c:if test="${not empty findOnePeople.id}">
                    <button class="tabe_btn " type="submit">修改</button>
                </c:if>

            </div>
        </div>
        <%--<div style="width: 100%;margin-top: 20px;">
            <button class="tabe_btn " type="submit">添加</button>
        </div>--%>
    </form>

</div>
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
</script>
<script src="${pageContext.request.contextPath}/js/layer_v2.1/layer/layer.js"></script>
</html>
