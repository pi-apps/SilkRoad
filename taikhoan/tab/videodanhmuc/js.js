jQuery(function ($) {
    var index = 'qpsstats-active-tab-video-danhmuc';
    //  Define friendly data store name
    var dataStore = window.sessionStorage;
    var oldIndex = 0;
    //  Start magic!
    try {
        // getter: Fetch previous value
        oldIndex = dataStore.getItem(index);
    } catch (e) { }

    $("#tabs").tabs({
        active: oldIndex,
        activate: function (event, ui) {
            //  Get future value
            var newIndex = ui.newTab.parent().children().index(ui.newTab);
            //  Set future value
            try {
                dataStore.setItem(index, newIndex);
            } catch (e) { }
        }
    }).addClass("ui-tabs-vertical ui-helper-clearfix");
    $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
});