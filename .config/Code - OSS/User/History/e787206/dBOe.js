
function changeImage(carrousel,dir,maxpos,increment) {

    //this function updates the position of the html attribute and of the scroll bar
    pos = parseInt(carrousel.getAttribute("data-pos"));

    if (pos+increment*dir < maxpos && pos+dir > 0){
        
            pos += increment*dir;
            carrousel.setAttribute("data-pos",pos);
            carrousel.scrollTo(pos, 0);

    }
    else if (pos-increment < 0){
        pos = (maxpos-increment);
        carrousel.setAttribute("data-pos",pos);
        carrousel.scrollTo(pos,0)
        }
    else if (pos+pos >= maxpos){
        carrousel.setAttribute("data-pos",0);
        pos=0;
        carrousel.scrollTo(pos,0);
    }

    

    //console.log(carrousel.id + " : " + pos);
        
}

function start(cid,imagecontainer,autoswitch,dir){

    var carrousel = document.querySelector(cid);
    var container = document.getElementsByClassName(imagecontainer);
    var width  = container[0].offsetWidth;
    var maxpos = width*container.length;
    carrousel.scrollTo(0, 0);
    //console.log(screen.width); i could make the position and how much it will scroll relative to the screen width
    // however it seems to be working fine without being relative unless the user zooms in/out on the computer

    console.log(container,width,maxpos);
    var timer = 1000; //5 seconds
    
    carrousel.addEventListener("wheel", event => {
        if (event.deltaY > 0){
            pos+=300;
            event.target.scrollBy(pos, 0 );
        }
        else{
            pos -=300;
            event.target.scrollBy(-pos, 0 );
        }
    } );   
    if(autoswitch) window.setInterval(changeImage,timer,carrousel,dir,maxpos,width);
    else{
        changeImage(carrousel,dir,maxpos,width);
    } 

}

