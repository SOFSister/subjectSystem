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
    $('#change_btn').click(function () {
        var id=$("#id_span").html();
        $.ajax({
            type: "post",
            url: "UserCourse",
            async:false,
            data: {
                "action":"getUser",
                "id":id,
            },
            dataType: "json",
            success: function (response) {
                $("#id").val(id);
                $("#name").val(response.name);
                $("#college").val(response.college);
                $("#professional").val(response.professional);
                $("#phone").val(response.phone);
                $("#pwd").val(response.pwd);
            },
            error:function (response){
                swal("系统错误!", "请重试", "error");
            }
        });
        $('#myModal').modal('show');
    });
    $("#enter_btn").click(function () {
        var id=$("#id").val();
        var name=$("#name").val();
        var college=$("#college").val();
        var professional=$("#professional").val();
        var phone=$("#phone").val();
        var pwd=$("#pwd").val();
        if(id==""||name==""||college==""||professional==""||phone==""||pwd==""){
            toastr.error('请完整填写信息');
            return;
        }
        $.ajax({
            type: "post",
            url: "UserCourse",
            async:false,
            data: {
                "action":"updateUser",
                "id":id,
                "name":name,
                "college":college,
                "professional":professional,
                "phone":phone,
                "pwd":pwd
            },
            dataType: "json",
            success: function (response) {
                $('#myModal').modal('hide');
                window.location.reload();
            },
            error:function (response){
                swal("系统错误!", "请重试", "error");
            }
        });
    });
});