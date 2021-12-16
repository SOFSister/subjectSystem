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
        var course_all=$("#course_all").val();
        var course_type=$("#course_type").val();
        var course_pid=$("#course_pid").val();
        var course_info=$("#course_info").val();
        if(course_id==""||course_name==""||course_term==""||course_all==""){
            toastr.error('请完整填写课程信息');
            return;
        }
        swal("恭喜!", "添加课程成功!", "success");
        $('#myModal').modal('hide');
    });
});