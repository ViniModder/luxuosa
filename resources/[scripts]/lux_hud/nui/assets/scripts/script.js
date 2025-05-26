let date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let cacheLife = 100;
let cacheArmour = 100;
let showLife = false;
let showArmour = false;
let doorManagerEnabled = false;
let iframeIsOpen = false;

function closeDoorManager() {
    doorManagerEnabled = false;
    $.post(`https://${GetParentResourceName()}/onCloseDoorManager`)
    $(".vehicle-doors").css("opacity", "0")
    setTimeout(() => $(".vehicle-doors").empty(), 200)
}

function onSelectDoor(doorId) {
    $.post(`https://${GetParentResourceName()}/onSelectDoor`, JSON.stringify({ doorId }))
}

let logo = $('.logo');
let logoTimeout = null;
let lastChangeTime = null;

function setLogoRotate() {
    let date = new Date();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();

    let allowedHours = [0, 2, 4, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23];

    if (allowedHours.includes(hours) && minutes === 0 && seconds === 0) {
        if (!lastChangeTime || (date - lastChangeTime) >= 1200000) {
            logo.css('animation', 'logoRotate 2s linear infinite');

            setTimeout(() => {
                logo.attr('src', './assets/images/logo2.webp');
            }, 500);

            if (logoTimeout) {
                clearTimeout(logoTimeout);
            }

            lastChangeTime = date;


            logoTimeout = setTimeout(() => {
                logo.css('animation', 'none');
                logo.attr('src', './assets/images/logo.png');
            }, 900000);
        }
    } else {
        logo.css('animation', 'none');
    }
}

setInterval(setLogoRotate, 1000);


window.onkeydown = (event) => {
    if (event.key === "Escape" && doorManagerEnabled)
        closeDoorManager()
    else if (event.key === "Escape") {
        if (iframeIsOpen) {
            closeIframe();
            iframeIsOpen = false;
            return;
        }
        $.post(`https://${GetParentResourceName()}/closeMouse`)
    }


}


window.addEventListener("message", ({ data }) => {

    if (data.action == "open-iframe") {
        if (iframeIsOpen) return;
        iframeIsOpen = true;

        $('.iframe').show();
        $('.iframe').html(`
            <iframe src="${data.url}" frameborder="0"></iframe>            
            <div class="close" onclick="closeIframe()">
                <img src="./assets/images/notifys/negado.svg" alt="">
            </div>
        `)
        return;
    }

    if (data.action == "notify") {

        if (data.data.type == "staff" || data.data.type == 'rr') setNotifyAdm(data);
        else if (data.data.type == "recrutamento") setNotifyRecruitment(data);
        else setNotify(data);
        return;
    }

    if (data.action == 'safeZone') {
        if (data.status) {
            $('.safezone').fadeIn();
            $('.safezone').css('display', 'flex');
        } else {
            $('.safezone').fadeOut();
        }
        return;
    }


    if (data.action == 'setPlayerId') {
        $('.id p').html(data.user_id)
        return;
    }

    if (data.action == 'NotifyAnnouncement') {
        setNotifyAnnounce(data.data)
        return;
    }
    if (data.action == 'openModalF3') {
        $('.modalF3').fadeIn(500)
        $('.modalF3').css('display', 'flex')

        console.log('openModalF3')

        return;
    }

    if (data.action == "video") {
        $("#video").css("display", "block");
        $("#video").trigger("play");
        $("#audio")[0].play();

        $("#video").on("ended", () => {
            $("#video").css("display", "none");
            $("#audio")[0].stop();
        })
    }

    if (data.action == "itemNotify") {
        setNotifyItens(data.data)
        return;
    }

    if (data.action == "showAll") {
        if (eventNotifyActive) {
            Swal.fire({
                title: "Você será teleportado para o local do evento!",
                showDenyButton: true,
                showCancelButton: false,
                confirmButtonText: "TELEPORTAR",
                denyButtonText: `CANCELAR`
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    $.post(`https://${GetParentResourceName()}/tpEvent`, JSON.stringify(eventNotifyCds))
                }
            });
        }
        return
    }

    if (data.action == 'showHudPvp') {
        $("#app").css("opacity", "1");
        $(".logo").css("display", "none");
        $('.serverInfos').css('display', 'none');
        $('.safezone').css('display', 'none');
        // $('.playerNoVehicle').css('display', 'none');
        $('.playerInVehicle').css('display', 'none');
        $('.recruitmentContainer').css('display', 'none');
    } else if (data.action == 'hideHudPvp') {
        $("#app").css("opacity", "1");
        $(".logo").css("display", "block");
        $('.serverInfos').css('display', 'flex');
        $('.safezone').css('display', 'flex');
        $('.playerNoVehicle').css('display', 'flex');
        $('.playerInVehicle').css('display', 'flex');
        $('.recruitmentContainer').css('display', 'flex');
    } else if (data.action === "show") {
        $("#app").css("opacity", "1");
        $(".logo").css("display", "block");
    } else if (data.action === "hide") {
        $("#app").css("opacity", "0");
        $(".logo").css("display", "none");
    } else if (data.action === "hideData") {
        $(".info.time").css("display", "none");
        $(".discord").css("display", "flex");
    }
    else if (data.action === "handle_hide_element") {
        $(data.element).css("display", data.hide ? "none" : "flex");
    }
    else if (data.action === "showData") {
        $(".discord").css("display", "none");
        $(".info.time").css("display", "flex");
    } else if (data.action === "showRecruitment") {
        $(".recruitmentContainer").fadeIn().css("display", "flex")
        return
    } else if (data.action === "hideRecruitment") {
        $(".recruitmentContainer").fadeOut();
    } else if (data.action === "showDoorManager") {
        $(".vehicle-doors").empty()
        doorManagerEnabled = true;

        data.doors?.forEach(door => {
            $(".vehicle-doors").append(`
                <button class="vehicle-door" onclick="onSelectDoor(${door.id})">
                    <img src="${door.image}" />
                </button>
            `)
        })

        $(".vehicle-doors").css("opacity", "1")
    } else if (data.action === "closeDoorManager") closeDoorManager()


    if (data.action != 'showRecruitment' && data.action != 'hideRecruitment') {
        // document.querySelectorAll(".need .value")[0].style.width = `${data.health}%`;
        // document.querySelectorAll(".need .value")[1].style.width = `${data.armour}%`;



        // $(".lifeText span").html(data.health + '%');
        // $(".armourText span").html(data.armour + '%');

        $(".on").html(data.playersOnline)

        if (data.weapon) {
            if (data.weapon == -1569615261) $('.weapon').css('opacity', '0');
            else $('.weapon').css('opacity', '1');

            $('.weapon').html(`
            
                <div class="ammu">
                    <img src="./assets/images/ammunition.svg" alt="">
                    <b>${data.ammo}</b>
                    <p>${data.ammoInClip}</p>
                </div>
                <div class="icon">
                    <div class="mask"></div>
                    <img src="./assets/images/weapons/${data.weapon}.png" alt="">

                </div>
            `);
        }


        if (data.gear) {
            $('.gear p').html(data.gear);

            if (data.gear == 0) $('.gear p').html('R');
        }


        if (data.armour == 0) $('.armour').hide();
        else $('.armour').fadeIn(500);



        if (data.vehicle == true) {
            $(".playerInVehicle").css("opacity", "1");
            $(".playerNoVehicle").css("opacity", "0");



            if (data.rpm <= 19) {
                setProgressSpeed(0, '.progress-car-path', true)
            } else {
                setProgressSpeed(data.rpm, '.progress-car-path', true)
            }



            // $('.weapon').css('bottom', '160px')
            // if (data.armour == 0) $('.vehicle').css('bottom', '75px');
            // else $('.vehicle').css('bottom', '115px');

            if (data.cinto == true) {
                $(".seatbelt").css('opacity', '1')
            } else {
                $(".seatbelt").css('opacity', '0.5')
            }

            if (data.locked == 2) {
                $(".doors").css('opacity', '1')
            } else {
                $(".doors").css('opacity', '.5')
            }

            if (data.speed < 10) {
                $(".speed").html(`<b>00</b>${data.speed}`);
            } else if (data.speed < 100) {
                $(".speed").html(`<b>0</b>${data.speed}`);
            } else if (data.speed > 100) {
                $(".speed").html(`${data.speed}`);
            }

            $('.progressFuel span').css('width', data.fuel + '%')
            $('.progressEngine span').css('height', data.motor + '%')


            // $('.playerInVehicle .progressLife span').css('height', data.health + '%');
            // $('.playerInVehicle .progressArmour span').css('width', data.armour + '%');

            setProgressSpeed(data.health, '.progress-life-path', false)

            if (data.armour <= 100) {
                setProgressSpeed(data.armour, '.progress-armour-path', false)
                setProgressSpeed(0, '.progress-armour-extra', false)
            } else {
                setProgressSpeed(100, '.progress-armour-path', false)
                setProgressSpeed(data.armour - 100, '.progress-armour-extra', false)
            }

        } else {
            // $('.weapon').css('bottom', '80px')
            $(".playerInVehicle").css("opacity", "0");
            $(".playerNoVehicle").css("opacity", "1");
            $('.vehicle').css('bottom', '95px');
            $(".playerInVehicle").css("display", "flex");


            if (data.armour <= 100) {
                $('.playerNoVehicle .progressArmour span').css('width', data.armour + '%');
                $('.playerNoVehicle .progressArmour .extra').css('width', '0%');
            } else {
                $('.playerNoVehicle .progressArmour span').css('width', '100%');
                $('.playerNoVehicle .progressArmour .extra').css('width', data.armour - 100 + '%');
            }

            $('.progressLife span').css('width', data.health + '%');
            // $('.progressArmour span').css('width', data.armour + '%');


        }

        $('.hour').html(data.time);

        $(".date").html(`
            <img src="./assets/images/calendar.svg" alt="">
            <p>${day}.${month}.${year}</p>
        `);

        if (data.talking === true) {
            $(".icon-mic").css("fill", "#4D8CFF");
        } else {
            $(".icon-mic").css("fill", "#fff");
        }

        if (data.channel !== "Desligado" && data.channel !== 0) {
            $('.radio').show();
            $(".freq").html(`${data.channel}`);
        } else {
            $(".radio").hide();
        }

        if (data.crime == true) {
            $(".assault").css("display", "flex");
        } else {
            $(".assault").css("display", "none");
        }


        if (data.assaultNorth == true) {
            $(".assaultNorth").css("display", "flex");
        } else {
            $(".assaultNorth").css("display", "none");
        }


        if (data.kidnapping == true) {
            $(".kidnapping").css("display", "flex");
        } else {
            $(".kidnapping").css("display", "none");
        }


        $('.volumeOn').removeClass('volumeOn');


        sendVoice(data.voice)

        // $(".street .text").html(`
        //     <h3>${data.bairro}  | <span>${data.localizacao}</span></h3>
        // `);
    }
});

$(".cupom p").html(config.cupom);

// PROGRESS CIRCLE
// function setProgressSpeed(value, element) {
//     var circle = document.querySelector(element);
//     var radius = circle.r.baseVal.value;
//     var circumference = radius * 2 * Math.PI;
//     var percent = value * 100 / 220;

//     circle.style.strokeDasharray = `${circumference} ${circumference}`;
//     circle.style.strokeDashoffset = `${circumference}`;
//     const offset = circumference - ((-percent * 73) / 100) / 100 * circumference;
//     circle.style.strokeDashoffset = -offset;
// }

// setProgressSpeed(1000, '.progress-car-path')

function setProgressSpeed(value, element, velocimeter) {
    var path = document.querySelector(element);
    // Check if the path is null
    if (!path) {
        console.error(`Element not found for selector: ${element}`);
        return; // Exit the function if the element is not found
    }

    var pathLength = path.getTotalLength();
    var percent = value / 100;
    path.style.strokeDasharray = `${pathLength} ${pathLength}`;


    const initialFillPercent = velocimeter ? 0.54 : 0;
    const initialOffset = pathLength * (1 - initialFillPercent);
    path.style.strokeDashoffset = `${initialOffset}`;

    const fillAmount = pathLength * (percent * (1 - initialFillPercent));
    path.style.strokeDashoffset = `${initialOffset - fillAmount}`;

    if (velocimeter) {
        movePointer(value);
    }
}


function movePointer(progressPointer) {
    const angle = -120 + (progressPointer * 1.7);
    $('.pointer').css('transform', `rotate(${angle}deg)`)
}


// let progress = 0;
// setProgressSpeed(-progress, '.progress-life-path', false);
// setProgressSpeed(-progress, '.progress-armour-path', false);
// setProgressSpeed(progress, '.progress-car-path', true);
// setInterval(() => {
//     if (progress <= 99) {
//         progress += 1;

//         setProgressSpeed(-progress, '.progress-life-path', false);
//         setProgressSpeed(-progress, '.progress-armour-path', false);
//         setProgressSpeed(progress, '.progress-car-path', true);

//     } else {
//         progress = 0;
//         setProgressSpeed(0, '.progress-life-path', false);
//         setProgressSpeed(0, '.progress-armour-path', false);
//         setProgressSpeed(0, '.progress-car-path', true);
//     }
// }, 100);



// DE ACORDO COM A PROGRESS, MOVER O POINTER DE -120° A 50°







let cacheVoice = 1;

function sendVoice(voice) {
    if (cacheVoice != voice) {

        $('.ball-mic').removeClass('active-mic')
        for (let i = 0; i < voice; i++) {
            $('.ball-mic').eq(i).addClass('active-mic')
        }

        cacheVoice = voice;
    }
}


function closeIframe() {
    $('.iframe').hide();
    $.post(`https://${GetParentResourceName()}/close-iframe`);
}