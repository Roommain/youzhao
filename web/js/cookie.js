$(function () {
    var username=$.cookie('username');
    if(username == null){
        $('#hide').hide();
        $('#show').show();
        $('#show a').html("请登录");
    }
    else {
        $('#hide').hide();
        $('#show').show();
        // $('#cos').show();
        $('#show a').html(username+",欢迎你");
    }

    $("#cos").click(function () {
        $.cookie('username', '',{ expires: -1 });
        // $.cookie('username', "");
        $('#hide').hide();
        $('#show').show();
        $('#cos').hide();
        $('#show a').html("请登录");
    });

    $("#login1").click(function(){
        $("#cos").fadeToggle();
    });


    login.ondragend = function (e) {
        console.log( e.clientX,e.clientY );
        console.log( e.offsetX,e.offsetY );
        console.log( e.screenX,e.screenY );
        this.style.cssText ='top:'+(e.clientY)+'px';
    }

});
