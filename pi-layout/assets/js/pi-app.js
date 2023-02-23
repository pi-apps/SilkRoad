var PiglobalUser = "PiglobalUser";
var WorkingSession = "WorkingSession";
function setUserWithExpiry(key, PiUserName, PiAccessToken, PiUid, CusId) {
    const now = new Date()

    // `item` is an object which contains the original value
    // as well as the time when it's supposed to expire
    //example: 36000000
    const item =
    {
        PiUserName: PiUserName,
        PiAccessToken: PiAccessToken,
        PiUid: PiUid,
        CusId: CusId,
        expiry: now.getTime() + 36000000,
    }
    localStorage.setItem(key, JSON.stringify(item))
}
function setUserWorkingSession(key, value) {
    const item =
    {
        value: value
    }
    localStorage.setItem(key, JSON.stringify(item))
}
function getUserWorkingSession(key) {
    const itemStr = localStorage.getItem(key)
    // if the item doesn't exist, return null
    if (!itemStr) {
        return null
    }
    const item = JSON.parse(itemStr)
    return item;
}
function getUserWithExpiry(key) {
    const itemStr = localStorage.getItem(key)
    // if the item doesn't exist, return null
    if (!itemStr) {
        return null
    }
    const item = JSON.parse(itemStr)
    const now = new Date()
    // compare the expiry time of the item with the current time
    if (now.getTime() > item.expiry) {
        // If the item is expired, delete the item from storage
        // and return null
        localStorage.removeItem(key)
        return null
    }
    return item;
}
function loadOrCheckAccount() {
    var workingSession = getUserWithExpiry(WorkingSession);
    if (workingSession == null)//
    {
        $.ajax({
            url: '/ajax/account/createworkingsession.aspx',
            type: 'POST',
            success: function (info) {
                setUserWorkingSession(WorkingSession, info);
                $("#hdfWorkingSession").val(info);
                $(".check-out-link").attr("href", "/checkout/cart.html?WorkingSessionId=" + info);
            },
            complete: function () {
                //location.reload();
            }
        });
    }
    else {
        var value = getUserWorkingSession(WorkingSession).value;
        $("#hdfWorkingSession").val(value);
        $(".check-out-link").attr("href", "/checkout/cart.html?WorkingSessionId=" + value);
    }
    var user = getUserWithExpiry(PiglobalUser);
    if (user == null) {
        $("#hdfPiglobalUser").val("");
        $("#piLiSignInMobile").show();
        $("#piLiSignInfoMobile").hide();

        $("#piLiSignIn").show();
        $("#piLiSignInfo").hide();
    }
    else {
        $("#hdfPiglobalUser").val(user.CusId);

        $("#piLiSignInfoMobile").show();
        $("#piLiSignInMobile").hide();

        $("#piLiSignInfo").show();
        $("#piLiSignIn").hide();
    }
}
loadOrCheckAccount();

$(document).on("click", ".login_pi", function () {
    try {
        const Pi = window.Pi;
        Pi.init({ version: "2.0" });
        var scopes_login = ['username', 'payments', 'wallet_address'];
        function onIncompletePaymentFound(payment) {

        };
        Pi.authenticate(scopes_login, onIncompletePaymentFound).then(function (auth) {
            $.ajax({
                url: '/ajax/account/getInfo.aspx',
                data: {
                    UserName: auth.user.username,
                    Uid: auth.user.uid,
                    AccessToken: auth.accessToken,
                    Timestamp: auth.user.credentials.valid_until.timestamp,
                    Iso8601: auth.user.credentials.valid_until.iso8601
                },
                type: 'POST',
                success: function (info) {
                    if (info != "0") {
                        setUserWithExpiry(PiglobalUser, auth.user.username, auth.accessToken, auth.user.uid, info);
                    }
                },
                complete: function () {
                    location.reload();
                }
            });
        }).catch(function (error) {
            //$("#error").html(" " + error);
        });
    }
    catch (err) {
        // $("#error").html(" " + error);
    }
});