var today, wkday;

today = new Date();
wkday = today.getDay();

function monday() {
    if (wkday == 1) {
        document.write('<h1 class="yes">YES</h1>');
    }
    else {
        document.write('<h1 class="no">NO</h1>');
    }
}

function tuesday() {
    if (wkday == 2) {
        document.write('<h1 class="yes">YES</h1>');
    }
    else {
        document.write('<h1 class="no">NO</h1>');
    }
}

function wednesday() {
    if (wkday == 3) {
        document.write('<h1 class="yes">YES</h1>');
    }
    else {
        document.write('<h1 class="no">NO</h1>');
    }
}

function thursday() {
    if (wkday == 4) {
        document.write('<h1 class="yes">YES</h1>');
    }
    else {
        document.write('<h1 class="no">NO</h1>');
    }
}

function friday() {
    if (wkday == 5) {
        document.write('<h1 class="yes">YES</h1>');
        document.write('<audio autoplay loop><source src=music/friday.mp3 type=audio/mpeg><source src=music/friday.ogg type=audio/ogg>');
    }
    else {
        document.write('<h1 class="no">NO</h1>');
    }
}

function checkday() {
    var newtoday, newwkday;

    newtoday = new Date(); 
    newwkday = newtoday.getDay();

    if (wkday == 3 && newwkday == 4) {
        location.reload();
    }
    if (wkday == 4 && newwkday == 5) {
        location.reload();
    }
}
function portal() {
    if (wkday == 1)
        window.location = "monday.html";
    if (wkday == 2)
        window.location = "tuesday.html";
    if (wkday == 3)
        window.location = "wednesday.html";
    if (wkday == 4)
        window.location = "thursday.html";
    if (wkday == 5)
        window.location = "friday.html";
    else
        document.write('<p>Sorry, weekends are not currently supported</p>');
}