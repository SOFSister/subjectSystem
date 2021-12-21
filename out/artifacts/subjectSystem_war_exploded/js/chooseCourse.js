var userID="";
function getUserID(){
    $.ajax({
        type: "post",
        url: "UserCourse",
        async:false,
        data: {
            "action":"getUserID",
        },
        dataType: "json",
        success: function (response) {
            if(response.success){
                userID=response.userID;
            }
            else{
                toastr.info("请先登录");
            }
        },
        error:function (response){
            swal("系统错误!", "请重试", "error");
        }
    });
}
function init(){
    getUserID();
    $("#logout_btn").click(function (){
        $.ajax({
            type: "post",
            url: "UserCourse",
            async:false,
            data: {
                "action":"logout",
            },
            dataType: "json",
            success: function (response) {
                if(response.success){
                    window.location.reload();
                }
            },
            error:function (response){
                swal("系统错误!", "请重试", "error");
            }
        });
    });
    $(".add_btn").click(function (){
        var i = $(this).parent().parent().parent().find("tr").index($(this).parent().parent()[0]);
        var id=$("#tbody tr:eq("+i+") td:eq(0)").html();
        var professional=$("#tbody tr:eq("+i+") td:eq(2)").html();
        //console.log(professional);
        $.ajax({
            type: "post",
            url: "UserCourse",
            async:false,
            data: {
                "action":"addCourse",
                "id":id,
                "userID":userID,
                "professional":professional
            },
            dataType: "json",
            success: function (response) {
                if(response.success){
                    window.location.reload();
                }
                else{
                    swal("没有权限!", "请先修前置课程:"+response.info, "error");
                }
            },
            error:function (response){
                swal("系统繁忙!", "请重试", "error");
            }
        });
    });
    $(".del_btn").click(function (){
        var i = $(this).parent().parent().parent().find("tr").index($(this).parent().parent()[0]);
        var id=$("#tbody tr:eq("+i+") td:eq(0)").html();
        //console.log(professional);
        $.ajax({
            type: "post",
            url: "UserCourse",
            async:false,
            data: {
                "action":"delCourse",
                "id":id,
                "userID":userID
            },
            dataType: "json",
            success: function (response) {
                if(response.success){
                    window.location.reload();
                }
                else{
                    swal("错误!", "请重试","error");
                }
            },
            error:function (response){
                swal("系统繁忙!", "请重试", "error");
            }
        });
    });
}
$(document).ready(function (){
    $('#myTable').DataTable();
    init();
});