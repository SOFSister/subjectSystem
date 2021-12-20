$(function (){
    $("#register_btn").click(function (){
        var userID=$("#id").val();
        var name=$("#name").val();
        var college=$("#college").val();
        var professional=$("#professional").val();
        var phone=$("#phone").val();
        var pwd=$("#pwd").val();
        if(userID==""||name==""||college==""||professional==""||phone==""||pwd==""){
            toastr.error('请完整填写信息');
            return;
        }
        else{
            $.ajax({
                type: "post",
                url: "UserCourse",
                async:false,
                data: {
                    "action":"register",
                    "id":userID,
                    "name":name,
                    "college":college,
                    "professional":professional,
                    "phone":phone,
                    "pwd":pwd
                },
                dataType: "json",
                success: function (response) {
                    if(response.success){
                        toastr.success("注册成功,2s后自动跳转到登陆页面");
                        setTimeout(function (){
                            window.location.href="login.jsp";
                        },2000);
                    }
                    else{
                        swal("错误!", "该学号已注册，请修改", "error");
                    }
                },
                error:function (response){
                    swal("系统错误!", "请重试", "error");
                }
            });
        }
    });
});