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

function initializeClock(contenedor, estado, endtime) {
    var clock = document.getElementById(contenedor);
    var minutesSpan = clock.querySelector('.minutes');
    var secondsSpan = clock.querySelector('.seconds');

    function updateClock() {
        var t = getTimeRemaining(endtime);
        
        minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
        secondsSpan.innerHTML = ":" + ('0' + t.seconds).slice(-2);
        if (t.minutes < 2 && t.minutes > 0) {
            document.getElementById(estado).style.backgroundColor = '#f7a600';
            clock.querySelector('.estados').innerHTML = ('SOBRE TIEMPO');
        } 

        if (t.total <= 0) {
            clearInterval(timeinterval);
            document.getElementById(estado).style.backgroundColor = '#bb0000';
            clock.querySelector('.estados').innerHTML = ('DEMORADO');
        }
    }

    updateClock();
    var timeinterval = setInterval(updateClock, 1000);
}

function iniciar(contenedor, estado, tiempo) {
    var timeInMinutes = tiempo;
    var currentTime = Date.parse(new Date());
    var deadline = new Date(currentTime + timeInMinutes * 60 * 1000);
    initializeClock(contenedor, estado, deadline);
}