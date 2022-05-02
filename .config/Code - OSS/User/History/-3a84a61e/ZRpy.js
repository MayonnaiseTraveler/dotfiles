window.onload = mobileBar;
window.onresize = mobileBar;
function mobileBar() {
  var colorfg = "#fffff ;";
  var colorfgalt = "#ffffff ;";
  var width = window.innerWidth;
  var bar = document.getElementById("navbar");
  var barbtn = document.getElementById("barbtn");
  if (width < 1100) {
    barbtn.style["display"] = "block";
    bar.style["display"] = "none";
    barbtn.onclick = () => {

      if (bar.style["display"] != "none") { //turn btn off
        bar.style["display"] = "none";
        barbtn.classList.add("barBtnOff");
        barbtn.classList.remove("barBtnOn");
      }

      else {
        barbtn.classList.add("barBtnOn");
        barbtn.classList.remove("barBtnOff");
        bar.style["display"] = "contents";
      }
    }
  }
  else if (width > 1100){
    barbtn.style["display"] = "none";
    bar.style["display"] = "flex";
  }
}
