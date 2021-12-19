$(document).ready(function (){
    $('#myTable').DataTable();
    $('#change_btn').click(function (e) {
        e.preventDefault();
        $('#myModal').modal('show');
    });
    $("#enter_btn").click(function (e) {
        e.preventDefault();
        swal("恭喜!", "修改信息成功!", "success");
    });
});