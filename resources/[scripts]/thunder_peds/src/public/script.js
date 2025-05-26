 window.addEventListener("message",(event)=>{
    switch (event.data.action) {
        case "open":
            resetMenu()
            $(".peds-interface").fadeIn();
            console.log(JSON.stringify(event.data))
            for (ped in event.data.data){
                $(".peds-list").append(`
                <div class="ped-single">
                    <div class="ped-photo" style="background-image: url(${event.data.data[ped].image})"></div>
                    <div class="ped-name">${event.data.data[ped].name}</div>
                    <div class="ped-button big-background" data-ped="${ped}" onclick="SelectPed(this)">SELECIONAR</div>
                </div>
                `);
            }
            break;
        case "close":
            $(".peds-interface").fadeOut();
            resetMenu()
            break;
    }
})

function resetMenu(){
    $(".peds-list").html("")
}

function SelectPed(element){
    let ped = element.dataset.ped
    $.post("https://thunder_peds/SelectPed", JSON.stringify({ ped }),function (data, textStatus, jqXHR) {
        $(".peds-interface").fadeOut();
        resetMenu()
    });
}

document.addEventListener("keydown",(ev)=>{
    if(ev.keyCode != 27) return
    $.post("https://thunder_peds/close");
    $(".peds-interface").fadeOut(500);
    setTimeout(()=>{
        resetMenu();
    },500)

})