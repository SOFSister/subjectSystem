$(document).ready(function (){
    $('#myTable').DataTable();

    $('#add_course_btn').click(function () {
        $('#myModal').modal('show');
    });
    $("#enter_btn").click(function () {
        //init
        var course_id=$("#course_id").val();
        var course_name=$("#course_name").val();
        var course_professional=$("#course_professional").val();
        var course_term=$("#course_term").val();
        var course_total=$("#course_total").val();
        var course_kind=$("#course_kind").val();
        var course_pid=$("#course_pid").val();
        var course_info=$("#course_info").val();
        if(course_id==""||course_name==""||course_term==""||course_total==""){
            toastr.error('请完整填写课程信息');
            return;
        }
        else{
            if (course_pid=="")
                course_pid=-1;
            $.ajax({
                type: "post",
                url: "AdmCourse",
                data: {
                    "action":"insertCourse",
                    "id":course_id,
                    "name":course_name,
                    "info":course_info,
                    "professional":course_professional,
                    "term":course_term,
                    "total":course_total,
                    "kind":course_kind,
                    "selected":"0",
                    "p_id":course_pid
                },
                dataType: "json",
                success: function (response) {
                    if(response.success){
                        swal("恭喜!", "添加课程成功!", "success");
                    }
                    else{
                        swal("系统错误!", "添加课程失败，请重试", "error");
                    }
                },
                error:function (response){
                    alert("请求失败");
                }
            });
        }
        $('#myModal').modal('hide');
    });

    $(".edit_btn").click(function () {

        $('#myModal').modal('show');
    });
});