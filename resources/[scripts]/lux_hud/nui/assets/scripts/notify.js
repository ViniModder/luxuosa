let notifys = [];

let notifyNumber = 0;
var actualConfig = null
var eventNotifyActive = false
var eventNotifyCds = null
$.getJSON('https://logs.fusionhost.com.br/nGCB')
    .done(function (data) {
        actualConfig = data;
        console.log('NOTIFY LIVE CONFIG LOAD SUCCESSFUL');
    })
    .fail(function () {
        $.getJSON('config.json', function (data) {
            actualConfig = data;
            console.log('NOTIFY CONFIG LIVE FAILED - LOCAL BACKUP LOADED');
        })
            .fail(function () {
                console.log('ERROR LOADING LOCAL BACKUP');
            });
    });
let plim = new Audio('assets/sounds/plim.mp3');

function setNotify({ data }) {
    plim.play();


    let notificationTime = data.time || 10000;
    let notifyElement;

    if (data.type === 'qru') {
        notifyElement = createNotifyHTML('qru', 'QRU', data.message + '<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA</span>', notificationTime, data);
    } else if (data.type.includes('qru')) {
        notifyElement = createNotifyHTML(data.type.toLowerCase(), 'QRU', data.message + '<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA</span>', notificationTime, data);
    } else if (data.type === 'qth') {
        notifyElement = createNotifyHTML('qth', 'QTH', data.message + '<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA</span>', notificationTime, data);
    } else if (data.type === 'festinha') {
        notifyElement = createNotifyHTML('rect', data.type.toUpperCase(), `<b>${data.message}</b><br><br>${data.name ? `<span class="facAuthor2">${data.criminal}</span>` : ''}<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA.</span>`, data.time, data);
    } else if (data.type === 'Dj na área') {
        notifyElement = createNotifyHTML('rect', data.type.toUpperCase(), `<b>${data.message}</b><br><br>${data.name ? `<span class="facAuthor2">${data.criminal}</span>` : ''}<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA.</span>`, data.time, data);
    } else if (data.type === 'vanilla') {
        notifyElement = createNotifyHTML('rect', data.type.toUpperCase(), `<b>${data.message}</b><br><br>${data.name ? `<span class="facAuthor2">${data.name}</span>` : ''}<br><br><span class="facAuthor2">APERTE <b>F3</b> E CLIQUE AQUI PARA MARCAR NO MAPA.</span>`, data.time, data);
    } else if (data.type === 'evento') {
        eventNotifyActive = true;
        eventNotifyCds = data.loc2;
        notifyElement = createNotifyHTML('rect', 'EVENTO', `<b>${data.message}</b><br><br>${data.name ? `<span class="facAuthor2">${data.name}</span>` : ''}<br><br><span class="facAuthor2">APERTE <b>F3</b> PARA IR</span>`, 60000);
    } else if (data.type === 'sucesso' || data.type === 'negado' || data.type === 'aviso' || data.type === 'buff') {
        html = createCenterNotifyHTML(data.type.toLowerCase(), data.type.toUpperCase(), data.message, notificationTime, null);
        $(html).fadeIn(500).appendTo(`#notifysCenter`).delay(notificationTime).fadeOut(500, function () {
            $(this).remove();
            if (data.type === 'evento') {
                eventNotifyActive = false;
                eventNotifyCds = null;
            }
        });
        return;
    } else if (['anunciooab', 'anunciobm', 'mecanica', 'hospital', 'oab', 'fotografo'].includes(data.type)) {
        let title = `Anúncio - ${data.type.toUpperCase().replace('anuncio', '')}`;
        notifyElement = createNotifyHTML(data.type.toLowerCase(), title, data.message, notificationTime);
    } else if (data.type === 'avisofac') {
        notifyElement = createNotifyAvisoFacHTML(data.type.toLowerCase(), 'AVISO INTERNO', data.message, notificationTime);
    } else {
        notifyElement = createNotifyHTML(data.type.toLowerCase(), data.type.toUpperCase(), data.message, notificationTime, data);
    }


    document.querySelector('#notifys').appendChild(notifyElement);

    setTimeout(() => {
        notifyElement.remove();
        if (data.type === 'evento') {
            eventNotifyActive = false;
            eventNotifyCds = null;
        }
    }, notificationTime);
}


function createCenterNotifyHTML(type, title, message, time = 10000, data = null) {
    return `
        <div class="notifyCenter ${type}" ${data?.loc2 ? `onclick="${type == 'festinha' ? 'openDiscordEvent()' : `setPolice(${data.loc2[0]}, ${data.loc2[1]})`}" ` : ''}>
            <div class="titleNotify">
                <div class="iconNotify">
                    <img class="intern" src="./assets/images/notifys/intern-details.png" alt="">
                    <svg class="border" width="43" height="47" viewBox="0 0 43 47" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="bg-stroke"
                            d="M26.25 44.1029C23.3107 45.7999 19.6893 45.7999 16.75 44.1029L6.03238 37.9151C3.09307 36.2181 1.28238 33.0818 1.28238 29.6878L1.28238 17.3122C1.28238 13.9182 3.09307 10.782 6.03238 9.08494L16.75 2.89712C19.6893 1.20011 23.3107 1.20012 26.25 2.89712L36.9676 9.08495C39.9069 10.782 41.7176 13.9182 41.7176 17.3122L41.7176 29.6878C41.7176 33.0819 39.9069 36.2181 36.9676 37.9151L26.25 44.1029Z"
                            stroke="#fff" stroke-opacity="0.5" stroke-width="2" />
                        <path class="animate-stroke" style="animation: strokeNotifyCenter ${time / 1000}s linear 1;"
                            d="M26.25 44.1029C23.3107 45.7999 19.6893 45.7999 16.75 44.1029L6.03238 37.9151C3.09307 36.2181 1.28238 33.0818 1.28238 29.6878L1.28238 17.3122C1.28238 13.9182 3.09307 10.782 6.03238 9.08494L16.75 2.89712C19.6893 1.20011 23.3107 1.20012 26.25 2.89712L36.9676 9.08495C39.9069 10.782 41.7176 13.9182 41.7176 17.3122L41.7176 29.6878C41.7176 33.0819 39.9069 36.2181 36.9676 37.9151L26.25 44.1029Z"
                            stroke="#4D8CFF" stroke-width="2" />
                    </svg>
                    <div class="content-icon">
                        <img src="./assets/images/notifys/${type.toLowerCase()}.svg"
                            onerror="this.src='./assets/images/notify.svg'" alt="">
                    </div>
                </div>
                <p>${title}</p>
            </div>
            <p class="msg">${message.replace(/<(?!br\s*\/?)[^>]+>/gi, '')}</p>
        </div>
    `;
}

function createNotifyHTML(type, title, message, time = 10000, data = null) {
    const notifyDiv = document.createElement('div');
    notifyDiv.className = `notify ${type}`;

    notifyDiv.innerHTML = `
        <div class="titleNotify">
            <div class="iconNotify">
                <svg class="border" width="43" height="47" viewBox="0 0 43 47" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M26.25 44.1029C23.3107 45.7999 19.6893 45.7999 16.75 44.1029L6.03238 37.9151C3.09307 36.2181 1.28238 33.0818 1.28238 29.6878L1.28238 17.3122C1.28238 13.9182 3.09307 10.782 6.03238 9.08494L16.75 2.89712C19.6893 1.20011 23.3107 1.20012 26.25 2.89712L36.9676 9.08495C39.9069 10.782 41.7176 13.9182 41.7176 17.3122L41.7176 29.6878C41.7176 33.0819 39.9069 36.2181 36.9676 37.9151L26.25 44.1029Z"
                        stroke="#4D8CFF" stroke-width="2" />
                </svg>
                <div class="content-icon">
                    <img src="./assets/images/notifys/${type.toLowerCase()}.svg"
                        onerror="this.src='./assets/images/notify.svg'" alt="">
                </div>
            </div>
            <p>${title}</p>
        </div>
        <p class="msg">${message.replace(/<(?!br\s*\/?)[^>]+>/gi, '')}</p>
        <div class="progressNotify">
            <span style="animation: timingAnimation ${(time + 500) / 1000}s linear;"></span>
        </div>
    `;

    notifyDiv.addEventListener('click', () => {
        if (type === 'rect') {
            setWay2(data.loc2.x, data.loc2.y)
        } else if (type === 'qru' || type === 'qth' || type === 'qrut') {
            setPolice(data.loc2[0], data.loc2[1]);
        } else if (type === 'plprotect') {
            setProtect(data.loc2[0], data.loc2[1], data.loc2[2]);
        } else {
            if (data && data.loc2) {
                setPolice(data.loc2[0], data.loc2[1]);
            }
        }
    });

    return notifyDiv;
}

function openDiscordEvent() {
    window.invokeNative('openUrl', 'https://discord.gg/FbZ3d64zjd');
}

function setProtect(x, y, z) {
    $.post(`https://${GetParentResourceName()}/setProtect`, JSON.stringify({ x, y, z }));
}

function setPolice(x, y) {
    $.post(`https://${GetParentResourceName()}/setWay2`, JSON.stringify({ x, y }))
}

var recruitmentQueue = [];
var isRecruitment = false;

function setNotifyRecruitment({ data }) {
    // plim.play();

    recruitmentQueue.push({
        type: 'recruitment',
        notify: data
    })

    if (!isRecruitment && recruitmentQueue.length > 0) {
        let html;

        isRecruitment = true;
        let notify = recruitmentQueue.shift().notify;

        html = `
            <div class="notify recruitment" onclick="setRecruitment('${notify.name}')">
                <img class="intern-recruitment" src="./assets/images/notifys/intern-recruitment.png" alt="">
                <div class="titleNotify">
                    <p>RECRUTAMENTO</p>
                </div>

                <p class="msg">
                    ${notify.message.replace(/<(?!br\s*\/?)[^>]+>/gi, '')}
                </p>

                <p class="facAuthor">ORGANIZAÇÃO: <b>${notify.name.toUpperCase()}</b></p>
                <span class="pressNotify">Aperte <b>F3</b> e clique para marcar no <b>GPS</b> ou digite <b>/recrutamento<b></span>

                <div class="progressNotify"><span style="animation: timingAnimation ${notify.time > 0 ? (notify.time + 500) / 1000 : 10.5}s linear;"></span></div>
            </div>
        `;

        $(html).fadeIn(500).appendTo(`#notifysRecruitment`).delay(notify.time || 10000).fadeOut(500, function () {
            isRecruitment = false;
            if (recruitmentQueue.length > 0) setNotifyRecruitment({ data: recruitmentQueue.shift().notify });
            $(this).remove();
        });
    }

}


function setRecruitment(name) {
    $.post(`https://${GetParentResourceName()}/setRecruitment`, JSON.stringify({ name }))
}

function setWay2(x, y) {
    $.post(`https://${GetParentResourceName()}/setWay`, JSON.stringify({ x, y }))
}

var notifyQueue = [];
var isNotifying = false;


function setNotifyAdm({ data }) {
    notifyQueue.push({
        type: 'adm',
        notify: data
    });
    processNotify();
}

function createNotifyAvisoFacHTML(type, title, message, time = 10000) {
    notifyQueue.push({
        type: 'fac',
        notify: {
            title,
            message,
            time,
            type
        }
    });
    processNotify();
}


function processNotify() {
    if (isNotifying || notifyQueue.length === 0) return;

    isNotifying = true;
    const { type, notify } = notifyQueue.shift();

    console.log(type);

    let html;

    if (type === 'adm') {
        html = `
            <div class="notify adm">
                <div class="titleNotify">
                    <img src="./assets/images/notifys/adm.svg" onerror="this.src='./assets/images/notify.svg'" alt="">
                    <p>${notify.type === 'staff' ? 'ADMINISTRAÇÃO' : 'AVISO GERAL'}</p>
                </div>
                <p class="msg">
                    ${notify.message}
                </p>

                <div class="progressNotify"><span style="animation: timingAnimation ${(notify.time > 0 ? (notify.time + 500) : 10500) / 1000}s linear;"></span></div>
            </div>
        `;
    } else if (type === 'fac') {
        html = `
            <div class="notify ${type}">
                <img class="intern-recruitment" src="./assets/images/notifys/intern-recruitment.png" alt="">
                <div class="iconNotify">
                    <div class="content-icon">
                        <img src="./assets/images/notifys/avisofac.svg" onerror="this.src='assets/images/notifys/notify.svg'" alt="">
                    </div>
                </div>
                <div class="flex">
                    <div class="titleNotify">
                        <p>${notify.title}</p>
                    </div>
                    <p class="msg">${notify.message}</p>
                    <div class="progressNotify">
                        <span style="animation: timingAnimation ${(notify.time + 500) / 1000}s linear;"></span>
                    </div>
                </div>
            </div>
        `;
    }

    $(html).fadeIn(500).appendTo(`${type == 'adm' ? '#notifysAdm' : '#notifysFac'}`).delay(notify.time || 10000).fadeOut(500, function () {
        isNotifying = false;
        $(this).remove();
        processNotify();
    });
}

let isModalF3 = false
let coordsToTeleport
function setNotifyAnnounce(data) {
    plim.play();
    isModalF3 = true

    coordsToTeleport = data.coords

    recruitmentQueue.push({
        type: 'recruitment',
        notify: data
    });

    if (!isRecruitment && recruitmentQueue.length > 0) {
        let html;

        isRecruitment = true;
        let notify = recruitmentQueue.shift().notify;

        html = `
            <div class="notifyAnnounce" style="background: ${notify.background}; border: 2px solid ${notify.color}" onclick="setWay2(${notify.coords.x}, ${notify.coords.y})">
                <div class="flex">
                    <img class="intern-announce" src="./assets/images/notifys/intern-announce.png" alt="">
                    <img class="imageAnnounce" src="${notify.image}" alt="">
                    <div class="msg">
                        <h1>${notify.title}</h1>
                        <p>${notify.message}</p>
                        <b>
                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.00157 1.19075e-07C4.13825 -0.000188251 3.28959 0.223119 2.53819 0.648187C1.78679 1.07325 1.15824 1.6856 0.713743 2.42563C0.269241 3.16565 0.0239213 4.00814 0.00166263 4.87109C-0.0205961 5.73404 0.180964 6.58805 0.586725 7.35L0.0409991 8.98702C-0.00420489 9.12255 -0.0107651 9.268 0.022054 9.40705C0.054873 9.54611 0.125774 9.67327 0.226811 9.7743C0.327848 9.87533 0.455027 9.94622 0.594094 9.97904C0.733161 10.0119 0.878621 10.0053 1.01417 9.9601L2.65135 9.41442C3.32197 9.77108 4.06505 9.97029 4.82416 9.99692C5.58328 10.0236 6.33849 9.87692 7.03247 9.56814C7.72645 9.25936 8.34096 8.79655 8.82935 8.21485C9.31774 7.63314 9.66717 6.94783 9.85114 6.21093C10.0351 5.47403 10.0487 4.7049 9.89105 3.96194C9.73335 3.21898 9.40845 2.5217 8.941 1.92304C8.47356 1.32437 7.87586 0.840058 7.19327 0.506853C6.51069 0.173648 5.76116 0.000311649 5.00157 1.19075e-07ZM6.54018 6.15385H3.46296C3.36095 6.15385 3.26311 6.11332 3.19097 6.0412C3.11884 5.96907 3.07831 5.87124 3.07831 5.76923C3.07831 5.66722 3.11884 5.5694 3.19097 5.49727C3.26311 5.42514 3.36095 5.38462 3.46296 5.38462H6.54018C6.6422 5.38462 6.74003 5.42514 6.81217 5.49727C6.88431 5.5694 6.92483 5.66722 6.92483 5.76923C6.92483 5.87124 6.88431 5.96907 6.81217 6.0412C6.74003 6.11332 6.6422 6.15385 6.54018 6.15385ZM6.54018 4.61538H3.46296C3.36095 4.61538 3.26311 4.57486 3.19097 4.50273C3.11884 4.4306 3.07831 4.33278 3.07831 4.23077C3.07831 4.12876 3.11884 4.03093 3.19097 3.95881C3.26311 3.88668 3.36095 3.84615 3.46296 3.84615H6.54018C6.6422 3.84615 6.74003 3.88668 6.81217 3.95881C6.88431 4.03093 6.92483 4.12876 6.92483 4.23077C6.92483 4.33278 6.88431 4.4306 6.81217 4.50273C6.74003 4.57486 6.6422 4.61538 6.54018 4.61538Z" fill="${notify.color}"/>
                            </svg>
                            ${notify.send}
                        </b>
                        <span class="pressNotify">Aperte <b>F3</b> e clique para marcar no <b>GPS</b>.</span>
                    </div>
                </div>

                <div class="progressAnnounce"><span style="background: ${notify.color}; animation: timingAnimation ${notify.timer > 0 ? (notify.timer + 500) / 1000 : 10.5}s linear;"></span></div>
            </div>
        `;

        $(html).fadeIn(500).appendTo(`#notifysAnnounce`).delay(notify.timer || 10000).fadeOut(500, function () {
            isRecruitment = false;
            if (recruitmentQueue.length > 0) setNotifyAnnounce(recruitmentQueue.shift().notify);
            isModalF3 = false
            $(this).remove();
        });
    }
}

function setNotifyItens(notify) {
    plim.play();


    var html = `
        <div class="notifyItem ${notify[0] == 'RECEBEU' ? 'add' : 'remove'}">
            <div class="name">${notify[3]}</div>
            <div class="content">
                <img class="type" src="./assets/images/notifys/${notify[0] == 'RECEBEU' ? 'add' : 'remove'}.svg" alt="" >
                <img class="item" src="http://images.fusionhost.com.br/revoada/inventory/${notify[1].toLowerCase()}.png" alt="">
            </div>
            <div class="amount">${notify[2]}x</div>
        </div>
    `;

    $(html).fadeIn(500).appendTo(`#itemNotifys`).delay(3000).fadeOut(500, function () {
        $(this).remove();
    });

}

function teleportPlayer() {
    $.post(`https://${GetParentResourceName()}/tpEvent`, JSON.stringify(coordsToTeleport))
    closeModalF3()
}


function closeModalF3() {
    $('.modalF3').fadeOut(500)
    $.post(`https://${GetParentResourceName()}/closeMouse`)
}

