/* ANTI DUMP */
var WURFL = { "complete_device_name": "Google Chrome", "form_factor": "Desktop", "is_mobile": false }; document.dispatchEvent(new Event("WurflJSDetectionComplete"));
$(document).ready(function () {
    if (WURFL.form_factor == "Desktop") {
        var $_GET = [];
        window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (a, name, value) {
            $_GET[name] = value;
        });

        if (!($_GET['devs'])) {
            var element = new Image();
            Object.defineProperty(element, 'id', {
                get: function () {
                    $.post('http://vrp/antiDump');
                }
            });

            console.log("HAVANNA | ANTI DUMP");
        }
    }
});

// /* NOTIFY DE ITENS*/
// $(document).ready(function(){
// 	window.addEventListener("message",function(event){
// 		if (event.data.quantidade != undefined || event.data.item != undefined || event.data.mode != undefined ) { 
// 			var html = "" 
// 			if (event.data.mode == 'sucesso') {
// 				html = 
//                 "<div id='content'> <div id='imagem' style=\"background-image: url('http://177.54.148.31:4020/lotus/inventario/"+event.data.item+".png'); \"> </div> <div id='nome'>"+event.data.nome+"</div> <div id='quantidade'><sucesso>+ </sucesso>"+event.data.quantidade+"</div> <div id='peso'>("+event.data.kgTotal.toFixed(2)+")</div> </div>"
				
// 			}else if (event.data.mode == 'negado') { 
// 				html = "<div id='content'> <div id='imagem' style=\"background-image: url('http://177.54.148.31:4020/lotus/inventario/"+event.data.item+".png'); \"></div> <div id='nome'>"+event.data.nome+"</div> <div id='quantidade'><negado>- </negado>"+event.data.quantidade+"</div> <div id='peso'>("+event.data.kgTotal.toFixed(2)+")</div> </div>"
// 			}
	
// 			$(html).fadeIn(500).appendTo("#notifyitens").delay(3000).fadeOut(500);
// 		}
// 	})
// });

/* TASK BAR */
$(document).ready(function () {
    var percent = 0;
    var isVisible = false

    document.onkeydown = function (data) {
        if (data.which == 69 && isVisible == true) {
            $(".mainTaskBar").css("display", "none");
            $.post("http://vrp/taskEnd", JSON.stringify({ taskResult: percent }));
        }
    }

    window.addEventListener("message", function (event) {
        var item = event.data;
        if (item.runProgress === true) {
            isVisible = true;
            percent = 0;
            $(".mainTaskBar").css("display", "block");
            $("#progress-bar").css("width", "0%");
            $(".skillprogress").css("left", item.chance + "%")
            $(".skillprogress").css("width", item.skillGap + "%");
        }

        if (item.runUpdate === true) {
            percent = item.Length
            $("#progress-bar").css("width", item.Length + "%");

            if (item.Length < (item.chance + item.skillGap) && item.Length > (item.chance)) {
                $(".skillprogress").css("background-color", "#e6e6e5b9");
            } else {
                $(".skillprogress").css("background-color", "#e6e6e575");
            }
        }

        if (item.closeProgress === true) {
            isVisible = false;
            $(".mainTaskBar").css("display", "none");
        }
    });
});