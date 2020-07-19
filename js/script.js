function realtimeClock() {
  var watch = document.querySelector("#clock");

  function getHour() {
    var date = new Date();
    var h = formateDate(date.getHours());
    var m = formateDate(date.getMinutes());
    var s = formateDate(date.getSeconds());

    return h + ":" + m + ":" + s;
  }

  function formateDate(t) {
    return t < 10 ? "0" + t : t;
  }

  function showWatch(current) {
    watch.textContent = current;
  }

  setInterval(function () {
    showWatch(getHour());
  }, 1000);
}
