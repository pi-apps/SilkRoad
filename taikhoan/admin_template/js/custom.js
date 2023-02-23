function activeMenu() {
    Id = $("#hdfidpage").val();
    $("#menu" + Id).addClass("active");
}
activeMenu();