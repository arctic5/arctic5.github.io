navigator.getUserMedia = (navigator.getUserMedia||navigator.webkitGetUserMedia||navigator.mozGetUserMedia||navigator.msGetUserMedia);

var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
var pre = document.querySelector('pre');
var myScript = document.querySelector('script');
if (navigator.getUserMedia) {
    console.log('getUserMedia supported.');
    navigator.getUserMedia (
        {audio: true},
        function(stream) {
            var source = audioCtx.createMediaStreamSource(stream);
            var gain = audioCtx.createGain();
            source.connect(gain);
            gain.connect(audioCtx.destination);
        },
        function(e) {
            console.log(e);
        }
    );
} else {
    console.log('u browser suk');
}