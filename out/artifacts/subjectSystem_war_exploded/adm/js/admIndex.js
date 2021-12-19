var index_id;
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
                async:false,
                data: {
                    "action":"insertCourse",
                    "id":course_id,
                    "name":course_name,
                    "info":course_info,
                    "professional":course_professional,
                    "term":course_term,
                    "total":course_total,
                    "kind":course_kind,
                    "p_id":course_pid
                },
                dataType: "json",
                success: function (response) {
                    if(response.success){
                        $('#myModal').modal('hide');
                        window.location.reload();
                    }
                    else{
                        swal("错误!", "课程编码重复，请修改", "error");
                    }
                },
                error:function (response){
                    swal("系统错误!", "添加课程失败，请重试", "error");
                }
            });
        }
    });

    $(".edit_btn").click(edit);
    $("#edit_enter_btn").click(edit_enter_btn);
});
function edit(){
    var i = $(this).parent().parent().parent().find("tr").index($(this).parent().parent()[0]);
    //console.log($("#tbody tr:eq("+i+") td:eq(0)").html());
    $.ajax({
        type: "post",
        url: "AdmCourse",
        async:false,
        data: {
            "action":"getCourse",
            "id":$("#tbody tr:eq("+i+") td:eq(0)").html(),
        },
        dataType: "json",
        success: function (response) {
            if(response.success){
                index_id=response.index_id;
                //console.log(index_id);
                $("#edit_course_id").val(response.id);
                $("#edit_course_name").val(response.name);
                $("#edit_course_professional").val(response.professional);
                $("#edit_course_term").val(response.term);
                $("#edit_course_total").val(response.total);
                $("#edit_course_kind").val(response.kind);
                var pid="";
                if(response.p_id!=-1)
                    pid=response.p_id;
                $("#edit_course_pid").val(pid);
                $("#edit_course_info").val(response.info);
            }
            else{
                swal("系统错误!", "请重试", "error");
            }
        },
        error:function (response){
            swal("系统错误!", "请重试", "error");
        }
    });
    $('#editModal').modal('show');
}
function edit_enter_btn(){
    var course_id=$("#edit_course_id").val();
    var course_name=$("#edit_course_name").val();
    var course_professional=$("#edit_course_professional").val();
    var course_term=$("#edit_course_term").val();
    var course_total=$("#edit_course_total").val();
    var course_kind=$("#edit_course_kind").val();
    var course_pid=$("#edit_course_pid").val();
    var course_info=$("#edit_course_info").val();
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
            async:false,
            data: {
                "action":"editCourse",
                "index_id":index_id,
                "id":course_id,
                "name":course_name,
                "info":course_info,
                "professional":course_professional,
                "term":course_term,
                "total":course_total,
                "kind":course_kind,
                "p_id":course_pid
            },
            dataType: "json",
            success: function (response) {
                if(response.success){
                    $('#editModal').modal('hide');
                    window.location.reload();
                }
                else{
                    swal("错误!", "课程编码重复，请修改", "error");
                }
            },
            error:function (response){
                swal("系统错误!", "编辑课程失败，请重试", "error");
            }
        });
    }
}