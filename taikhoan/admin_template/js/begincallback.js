var command = "";
function OnBeginCallback(s, e) {
    alert(s)
}
function OnEndCallback(s, e) {
    if (command == "ADDNEWROW") {
        s.Refresh();
    }
}