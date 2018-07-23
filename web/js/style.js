window.onload = function () {
    var box = document.getElementById("box");
    var tlt = document.getElementById("tlt");
    var img = document.getElementById("img");
    var tli = tlt.getElementsByTagName("li");
    var ili = img.getElementsByTagName("li");
    var index = 0;

    var left = img.getElementsByClassName("p")[0];
    var right = img.getElementsByClassName("n")[0];


    left.onclick = function () {
        var x = index - 1;
        if ( index >= 6 ){
            index = 0;
        }
        change(x);
    };
    right.onclick = function () {
        var x = index + 1;
        if ( index < 0 ){
            index = 5;
        }
        change(x);
    };


    for(var i=0;i<tli.length;i++){
        (function (i) {
            tli[i].onclick = function () {
                if(index !==i ){
                    change(i)
                }
            };
        })(i);
    }

    var timer = setInterval(function () {
        change(index + 1);

    },3000);

    function change(i) {
        tli[index].classList.remove("on");
        ili[index].classList.remove("on");
        index = i;
        if(index < 0){
            index = 5
        }
        index %= 6;
        tli[index].classList.add("on");
        ili[index].classList.add("on");
    }

    box.onmouseenter = function () {
        clearInterval(timer);
    };
    box.onmouseleave = function () {
        timer = setInterval(function () {
            change(index + 1);

        },3000);
    };
}

