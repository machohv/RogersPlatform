function getTimeRemaining(endtime) {
    var t = Date.parse(endtime) - Date.parse(new Date());
    var seconds = Math.floor((t / 1000) % 60);
    var minutes = Math.floor((t / 1000 / 60) % 60);
    var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
    var days = Math.floor(t / (1000 * 60 * 60 * 24));
    return {
        'total': t,
        'days': days,
        'hours': hours,
        'minutes': minutes,
        'seconds': seconds
    };
}

function initializeClock(contenedor, estado, endtime, Estados) {
    var clock = document.getElementById(contenedor);
    var minutesSpan = clock.querySelector('.minutes');
    var secondsSpan = clock.querySelector('.seconds');

    function updateClock() {
        var t = getTimeRemaining(endtime);
        
        minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
        secondsSpan.innerHTML = ":" + ('0' + t.seconds).slice(-2);

        if (t.minutes < (Estados[1].Time + Estados[2].Time) && t.minutes > Estados[2].Time) {
            document.getElementById(estado).style.backgroundColor = '#f7a600';
            clock.querySelector('.estados').innerHTML = Estados[1].Name;
        } 

        if (t.minutes < Estados[2].Time) {
            document.getElementById(estado).style.backgroundColor = '#bb0000';
            clock.querySelector('.estados').innerHTML = Estados[2].Name;
        }
        if (t.total <= 0) {
            clearInterval(timeinterval);
        }
    }

    updateClock();
    var timeinterval = setInterval(updateClock, 1000);
}

function iniciar(contenedor, estado) {
    var Estados = [];

    var WSSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrderStatesJSON';
    var req = $.ajax({
        url: WSSurl,
        timeout: 10000,
        success: function (estados) { AsignarTiempos(estados) }
    });

    function AsignarTiempos(estados) {

        $.each(JSON.parse(estados), function () {
            var estado = { Name: this.NAME, Time: this.TIMEASIGNED };
            Estados.push(estado);
        });

        var currentTime = Date.parse(new Date());
        var deadline = new Date(currentTime + (Estados[0].Time + Estados[1].Time + Estados[2].Time) * 60 * 1000);

        initializeClock(contenedor, estado, deadline, Estados);
    };
}