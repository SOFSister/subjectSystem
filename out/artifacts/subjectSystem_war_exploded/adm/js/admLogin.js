$(function () {
    toastr.options = {
        timeOut: 3000,
        progressBar: true,
        showMethod: "slideDown",
        hideMethod: "slideUp",
        showDuration: 200,
        hideDuration: 200
    };
    $("#login_btn").click(function (){
        if($("#id").val()==""||$("#pwd").val()==""){
            toastr.error('请完整填写账号密码');
            return;
        }
        $.ajax({
            type: "post",
            url: "AdmLogin",
            data: {
                "id":$("#id").val(),
                "pwd":$("#pwd").val()
            },
            dataType: "json",
            success: function (response) {
                if(response.success){
                    window.location.href="../admIndex.jsp";
                }
                else{
                    swal("账号或密码错误!", "请检查您的账号密码是否正确", "error");
                }
            },
            error:function (response){
                alert("请求失败");
            }
        });
    });
});