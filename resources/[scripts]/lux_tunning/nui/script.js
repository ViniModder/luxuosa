$(document).ready(function () {
  $(".list_sub_menu_bennys").mousedown(mouseDownHandler);
});
//==========================[ SCROLL PELO MOUSE]

const elScroll = document.getElementsByClassName("list_sub_menu_bennys");

let pos = { left: 0, x: 0 };
elScroll.scrollLeft = pos.left;

function mouseMoveHandler(e) {
  const dx = e.clientX - pos.x;
  $(".list_sub_menu_bennys").scrollLeft(pos.left - dx);
  elScroll.scrollLeft = pos.left - dx;
}

function mouseUpHandler() {
  document.removeEventListener("mousemove", mouseMoveHandler);
  document.removeEventListener("mouseup", mouseUpHandler);
}

function mouseDownHandler(e) {
  pos = {
    left: elScroll.scrollLeft,
    top: elScroll.scrollTop,
    x: e.clientX,
    y: e.clientY,
  };
  document.addEventListener("mousemove", mouseMoveHandler);
  document.addEventListener("mouseup", mouseUpHandler);
}

document.addEventListener(
  "scroll",
  function (event) {
    if (event.target.className == "list_sub_menu_bennys") {
      elScroll.scrollLeft = event.path[0].scrollLeft;
    }
  },
  true
);


let maxScroll = 0;
function arrowLeft() {
      maxScroll = document.getElementById('list_sub_menu_bennys').scrollWidth - document.getElementById('list_sub_menu_bennys').clientWidth;
      if(document.getElementById('list_sub_menu_bennys').scrollLeft > 0 && document.getElementById('list_sub_menu_bennys').scrollLeft < maxScroll) {
        $(".list_sub_menu_bennys").scrollLeft(pos.left -= 400);
        elScroll.scrollLeft = pos.left -= 400;
      };
            
  
      if(document.getElementById('list_sub_menu_bennys').scrollLeft === maxScroll) {
        $(".list_sub_menu_bennys").scrollLeft(document.getElementById('list_sub_menu_bennys').scrollLeft -= 400);
        elScroll.scrollLeft = document.getElementById('list_sub_menu_bennys').scrollLeft -= 400;
      };
      
}

function arrowRight() {

  maxScroll = document.getElementById('list_sub_menu_bennys').scrollWidth - document.getElementById('list_sub_menu_bennys').clientWidth;
  if(document.getElementById('list_sub_menu_bennys').scrollLeft > 0 && document.getElementById('list_sub_menu_bennys').scrollLeft < maxScroll) {
    $(".list_sub_menu_bennys").scrollLeft(pos.left += 400);
    elScroll.scrollLeft = pos.left += 400;
  };

  if(document.getElementById('list_sub_menu_bennys').scrollLeft === 0) {
    $(".list_sub_menu_bennys").scrollLeft(document.getElementById('list_sub_menu_bennys').scrollLeft += 400);
    elScroll.scrollLeft = document.getElementById('list_sub_menu_bennys').scrollLeft += 400;
  };

}


document.addEventListener("keydown", function (event) {
  const key = event.key; // "ArrowRight", "ArrowLeft", "ArrowUp", or "ArrowDown"
  let elements;
  switch (key) {
    case "ArrowLeft":
      elements = document.getElementsByClassName("item_sub_menu_bennys");
      for (let i = elements.length; i > 1; i--) {
        if ($(elements[i]).hasClass("selected")) {
          $(".selected").removeClass("selected");
          $(elements[i - 1]).click();
          break;
        }
      }
      break;
    case "h":
      $(".press_h").click()
      break;
    case "Escape":
      window.vueInstance.close()
      break;
    case "ArrowRight":
      elements = document.getElementsByClassName("item_sub_menu_bennys");
      for (let i = 0; i < elements.length - 1; i++) {
        if ($(elements[i]).hasClass("selected")) {
          $(".selected").removeClass("selected");
          $(elements[i + 1]).click();
          break;
        }
      }
      break;
  }
});

$(document).on("click", ".item_sub_menu_bennys", function (ev) {
  console.log("Detected click!");
  $(".selected").removeClass("selected");
  $(this).addClass("selected");
});
