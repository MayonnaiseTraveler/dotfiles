window.onload = mobileBar;
window.onresize = mobileBar;
colorfg = colorhex(fffff);
colorfgalt = colorhex(ffffff);
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
        barbtn.style["color"] = colorfg;
        barbtn.style["text-shadow"] = colorfgalt;
      }

      else {
        barbtn.style["color"] = string(colorfg_;
        bar.style["display"] = "contents";
        barbtn.style["text-shadow"] = "0 0 3vw "+ string(colorfgalt);
      }
    }
  }
  else if (width > 1100){
    barbtn.style["display"] = "none";
    bar.style["display"] = "flex";
  }
}