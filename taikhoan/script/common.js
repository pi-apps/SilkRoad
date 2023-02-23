
function removeElement(s) {
    if (document.getElementById(s).style.display == "none") {
        document.getElementById(s).style.display = "block";
    }
    else {
        document.getElementById(s).style.display = "none";
    }
}

/// Tìm tour
function search() {
    document.getElementById('formtacvu').style.display = "block";
}

/// Close
function closeSearch() {
    document.getElementById('formtacvu').style.display = "none";
}