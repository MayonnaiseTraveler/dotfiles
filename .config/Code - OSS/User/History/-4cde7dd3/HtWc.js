var images = document.getElementsByClassName("imageswitch");
var containers = document.getElementsByClassName("imagecontainer");

var shown = 0;
var timer = 5000; //5 segundos

window.setInterval(changeImage, timer);

for (var i = 0; i < 3; i++) {
  images[i].style["display"] = "none";
  console.log(images[i]);
}

images[0].style["display"] = "block";
console.log(images.lenght);

function changeImage() {
  if (shown <= 2) {
    console.log(shown);
    images[shown].style["display"] = "none";
    containers[shown].style["display"]="none";
    if (shown < 2) {
      shown++;
    } else
    {
        shown=0;
    }
    images[shown].style["display"] = "block";
  } 
}
