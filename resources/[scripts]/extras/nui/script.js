window.addEventListener('message', function(event) {
    switch (event.data.action) {
        case "open":
            $(".safe-cnt").fadeIn()


            for (let index = 0; index < event.data.count; index++) {
                $(".livery-cnt").append(`
                <div data-number="${index+1}" class="single-livery" onclick="selectLivery(this)">
                    ${index+1}
			    </div>
                `);
            }

            attHover()

            break;

        default:
            break;
    }
});

function selectLivery(element) {
    $.post("https://extras/select", JSON.stringify({ livery: $(element).data("number") }));
}

document.addEventListener('keydown', (event) => {
    switch (event.code) {
        case "Escape":
            $(".safe-cnt").fadeOut()
            $(".livery-cnt").html("")
            $.post("https://extras/close")
            break;
    }
}, false);

function attHover() {
    $(".single-livery").hover(function() {
        if (!$(this).hasClass("selected-livery")) {
            setTimeout(() => {
                $(this).text("SELECIONAR")
            }, 300);
            $(this).addClass("selected-livery");
        }
    }, function() {
        setTimeout(() => {
            $(this).text($(this).data("number"))
        }, 300);
        $(this).removeClass("selected-livery");

    });
}