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
    <title>房屋信息添加</title>
</head>

<body onload="Workload()">
<div class="title"><h2>房屋信息添加</h2></div>
<div class="query">
    <form action="${pageContext.request.contextPath}/House/addHouse">
        <div class="tabe_bot">
            <div class="l_left" id="address"><label>居住地址：</label>
                <input type="text" placeholder="请输入" name="addr">
            </div>
            <div class="l_left"><label>房东姓名：</label><input type="text" placeholder="请输入" name="name" id="tit"></div>
            <br>

            <div class="l_left" id="size"><label>&nbsp&nbsp&nbsp&nbsp&nbsp 价格：</label>
                <input type="text" placeholder="请输入" name="price">
            </div>
            <div class="l_left" id="gender">
                <label>房东性别：</label>
                <select name="gender">
                    <option value="" style="display: none"></option>
                    <option label="男" value="男"></option>
                    <option label="女" value="女"></option>
                </select>
            </div>
            <br>

            <div class="l_left" id="area"><label>&nbsp&nbsp&nbsp&nbsp&nbsp 面积：</label>
                <input type="text" placeholder="请输入" name="area">
            </div>
            <div class="l_left"><label>房东年龄：</label><input type="text" placeholder="请输入" name="age" id="age"></div>
            <br>

            <div class="l_left" id="floor"><label>&nbsp&nbsp&nbsp&nbsp&nbsp 楼层：</label>
                <input type="text" placeholder="请输入" name="floor">
            </div>
            <div class="l_left"><label>身份证号：</label><input type="text" placeholder="请输入" name="idNum" id="person"></div>
            <br>

            <div class="l_left" id="rentalSituation"><label>装修状况：</label>
                <select name="fitment">
                    <option label="请选择装修状况" value="0" style="display: none"></option>
                    <option label="精装" value="1"></option>
                    <option label="简装" value="2"></option>
                    <option label="毛坯" value="3"></option>
                </select>
            </div>
            <div class="l_left"><label>联系方式：</label><input type="text" placeholder="请输入" name="photo" id="person"></div>
            <br>

            <div class="l_left" id="decorationStatus"><label>出租情况：</label>
                <select name="rent">
                    <option label="请选择出租情况" value="0" style="display: none"></option>
                    <option label="未出租" value="1"></option>
                    <option label="已出租" value="2"></option>
                </select>


            </div>
            <br>
            <div class="l_left" id="address"><label>租户姓名：</label>
                <input type="text" placeholder="请输入(已出租时填写)" name="rentName">
            </div> <br>
            <div class="l_left" id="address"><label>身份证号：</label>
                <input type="text" placeholder="请输入(已出租时填写)" name="rentId">
            </div>

        </div>

        <div style="width: 100%;margin-top: 20px;">
            <button class="tabe_btn " type="submit">添加</button>
        </div>
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

</script>
<script src="${pageContext.request.contextPath}/js/layer_v2.1/layer/layer.js"></script>
</html>
