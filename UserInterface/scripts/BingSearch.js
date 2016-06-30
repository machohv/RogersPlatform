$('#btnSearch').click(function () {

    $.ajax({
        url: "https://api.cognitive.microsoft.com/bing/v5.0/images/search?q=" + $('#txtParam').val(),
        beforeSend: function (xhrObj) {
            // Request headers
            xhrObj.setRequestHeader("Content-Type", "multipart/form-data");
            xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key", "3d0c1624378f4081be17c67d2225f85c");
        },
        type: "POST",
        // Request body
        data: "{body}",
    })
    .done(function (data) {
        $('#imagediv').empty();
        $.each(data.value, function (i, item) {
            var div = $('<div class="img">');
            var a = $('<a href="'+getURL()+'?imageUrl=' + item.contentUrl + '">');
            var img = $('<img id="dynamic" src="' + item.contentUrl + '" width="300" height="200">');
            img.appendTo(a);
            a.appendTo(div);
            div.appendTo('#imagediv');
        });

        console.log(data.value);
    })
    .fail(function () {
        alert("error");
    });
});

function getURL() {
    var type = getParameterByName("type");
    if (type == "Add") {
        return "AddPlate.aspx";
    } else if (type == "Edit") {
        return "EditPlate.aspx";
    }
}



function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
