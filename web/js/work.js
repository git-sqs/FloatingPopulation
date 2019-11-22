/**
 * Created by Administrator on 2016/8/4.
 */

var workTitle, Publisher, currentID, workTime,mySex,myAddr,culture,myPopupation,myIncome, flag = true;
function Workload() {
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,

            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox:"true",
                    field: 'ID',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: "姓名",
                    field: 'fullName',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '身份证号',
                    field: 'idNumber',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '年龄',
                    field: 'age',
                    align: 'center'
                },
                {
                    title: '性别',
                    field: 'gender',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '居住地址',
                    field: 'address',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '文化层次',
                    field: 'culturalLevel',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '重点人口',
                    field: 'keyPopulation',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '收入水平',
                    field: 'incomeLevel',
                    align: 'center',
                    valign: 'middle'
                }
            ]
        });
        $('#tabletwo').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,

            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox:"true",
                    field: 'ID',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: "居住地址",
                    field: 'address',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '价格',
                    field: 'size',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '面积',
                    field: 'area',
                    align: 'center'
                },
                {
                    title: '楼层',
                    field: 'floor',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '出租状态',
                    field: 'rentalStatus',
                    align: 'center'
                },
                {
                    title: '装修情况',
                    field: 'floor',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '房东信息',
                    field: 'lanDlord',
                    align: 'center',
                    valign: 'middle'
                }

            ]
        });
    });
    getWorkTableData();
}
function getWorkTableData() {
    if (flag) {
        workTitle = "";
        Publisher = "";
        workTime = 0;
        mySex = "";
        myAddr = "";
        culture = 0;
        myPopupation = 0;
        myIncome = 0;
        flag = false;
    } else {
        workTitle = $("#tit").val();
        Publisher = $("#person").val();
        workTime = $("#age").val();
        mySex = $("#gender").val();
        myAddr = $("#address").val();
        culture = $("#culturalLevel").val();
        myPopupation = $("#keyPopulation").val();
        myIncome = $("#incomeLevel").val();
    }
    $.ajax({
        type: "GET",
        url: "../Basic/showPeople?name=" +workTitle + "&IDNum=" + Publisher + "&age=" + workTime + "&gender=" + mySex
            + "&address=" + myAddr + "&education=" + culture + "&intensive=" + myPopupation + "&income=" + myIncome,
        dataType: "json",
        success: function (result) {
            if (result.data) {
                var NoticeTableData = result.data;
                $('#table').bootstrapTable("load", NoticeTableData);
            }
        }
    })
}
function addWork() {
    openlayer()
    currentID = "";
}
function editWork(id) {
    openlayer()
    currentID = id;
}
var deleteNum = 0;
function outWork() {
    alert("+++");

    if (deleteNum == 0) {
        alert("未选择数据");
    } else {
        Confirm.show('溫馨提示', '您确定要刪除这' + deleteNum + '条商品信息吗', {
            '确定': {
                'primary': true,
                'callback': function () {
                    document.getElementById("tableForm").submit();
                }
            }
        });
    }
   /* alert(id)
    var NoticeId = id;
    $.ajax({
        url: '../WorkRecord/DeleteWork?workId=' + NoticeId,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data.data) {
                alert("删除成功！")
                // getNoticeTableData();
            } else {
                alert("删除失败")
            }
        },
        error: function (err) {
        }
    });*/
}
function changeBatch(obj) {
    var checked = obj.checked;
    if (checked) {
        deleteNum = deleteNum + 1;
    } else {
        deleteNum = deleteNum - 1;
    }
    var allIds = document.getElementsByName("ids");
    if (deleteNum != allIds.length) {
        document.getElementById("totalBatch").checked = false;
    } else {
        document.getElementById("totalBatch").checked = true;
    }
    document.getElementById("myBadge").innerText = deleteNum;
}
function getCurrentID() {
    return currentID;
}
function openlayer() {
    layer.open({
        type: 2,
        title: '通知信息',
        shadeClose: true,
        shade: 0.5,
        skin: 'layui-layer-rim',
        closeBtn: 2,
        area: ['98%', '98%'],
        shadeClose: true,
        closeBtn: 2,
        content:" work_tail"

    });

}





