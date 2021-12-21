function init(){
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
    $('#myTable').DataTable();
    init();
});