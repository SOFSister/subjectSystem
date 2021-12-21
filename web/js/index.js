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
    $('#myTable').DataTable();
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
}
$(document).ready(function (){
    init();

});