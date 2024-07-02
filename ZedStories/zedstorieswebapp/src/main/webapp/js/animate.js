// Animation for boxes

const boxes = document.querySelectorAll(".card");
window.addEventListener("scroll", checkBoxesBoxes);
checkBoxesBoxes();

function checkBoxesBoxes() {
  const triggerBottom = (window.innerHeight / 4.3) * 4;

  boxes.forEach((box) => {
    const boxTop = box.getBoundingClientRect().top;

    if (boxTop < triggerBottom) {
      box.classList.add("animate");
      console.log(window.innerHeight);
    } else {
      box.classList.remove("animate");
    }
  });
}


// header


let lastScrollTop = 0;
let scrolledPastPoint = false;
const scrollThreshold = 60; // Adjust this value to determine when the header behavior starts

window.addEventListener("scroll", function() {
    let currentScroll = window.pageYOffset || document.documentElement.scrollTop;

    if (currentScroll > lastScrollTop) {
        // Scroll down
        if (scrolledPastPoint) {
            document.querySelector('header').style.transform = 'translateY(-100%)';
        }
    } else {
        // Scroll up
        if (scrolledPastPoint) {
            document.querySelector('header').style.transform = 'translateY(0)';
        }
    }

    if (currentScroll > scrollThreshold) {
        scrolledPastPoint = true;
    } else {
        scrolledPastPoint = false;
    }

    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
}, false);



