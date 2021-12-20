$(function (){
    $("#login_btn").click(function (){
        var userID=$("#id").val();;
        var pwd=$("#pwd").val();
        if(userID==""||pwd==""){
            toastr.error('请完整填写账号密码');
            return;
        }
        else{
            $.ajax({
                type: "post",
                url: "UserCourse",
                async:false,
                data: {
                    "action":"login",
                    "id":userID,
                    "pwd":pwd
                },
                dataType: "json",
                success: function (response) {
                    if(response.success){
                        window.location.href="../index.jsp";
                    }
                    else{
                        swal("错误!", "账号或密码错误", "error");
                    }
                },
                error:function (response){
                    swal("系统错误!", "请重试", "error");
                }
            });
        }
    });
});