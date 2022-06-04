window.onload = mobileBar;
window.onresize = mobileBar;

function mobileBar() {
  var width = window.innerWidth;
  var bar = document.getElementById("navbar");
  var barbtn = document.getElementById("barbtn");
  if (width < 1100) {
    barbtn.style["display"] = "block";
    bar.style["display"] = "none";
    barbtn.onclick = () => {

      if (bar.style["display"] != "none") {
        bar.style["display"] = "none";
        barbtn.style["color"] = " #f54be4";
        barbtn.style["text-shadow"] = "0 0 3vw #f54be4"
      }

      else {
        barbtn.style["color"] = " #4be4f5";
        bar.style["display"] = "contents";
        barbtn.style["text-shadow"] = "0 0 3vw #4be4f5"
      }
    }
  }
  else if (width > 1100){
    barbtn.style["display"] = "none";
    bar.style["display"] = "flex";
  }
}