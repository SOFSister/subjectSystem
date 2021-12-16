$(function () {
    $("#login_btn").click(function (){
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
                    console.log(6);
                }
                else{
                    console.log(5);
                }
            },
            error:function (response){
                alert("请求失败");
            }
        });
    });
});