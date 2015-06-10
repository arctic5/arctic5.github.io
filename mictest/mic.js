window.onload = function() {
    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    navigator.getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
    var context = new AudioContext();
    navigator.getUserMedia({audio: true}, function(stream) {
        var microphone = context.createMediaStreamSource(stream);
        var filter = context.createGain();
        microphone.connect(filter);
        filter.connect(context.destination);
    }, function() {alert("ur browser suk");});
}