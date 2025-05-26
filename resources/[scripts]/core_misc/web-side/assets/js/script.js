class Radar {
    constructor() {
        this.rootDiv = document.getElementById("root");
        this.front = {
            velocity: document.getElementById("front-velocity"),
            model: document.getElementById("front-model"),
            plate: document.getElementById("front-plate")
        };
        this.rear = {
            velocity: document.getElementById("rear-velocity"),
            model: document.getElementById("rear-model"),
            plate: document.getElementById("rear-plate")
        };

        this.bindEvents();
    }

    bindEvents() {
        window.addEventListener("message", this.handleMessage.bind(this));
    }

    handleMessage({ data }) {
        if (data.radar) {
            this.rootDiv.style.display = "flex";
            this.setRadarInfo(this.front, data.infos.front);
            this.setRadarInfo(this.rear, data.infos.rear);
        } else {
            this.rootDiv.style.display = "none";
        }
    }

    setRadarInfo(section, info) {
        section.velocity.textContent = info && info.velocity ? Math.ceil(info.velocity) : "0";
        section.model.textContent = info && info.model ? info.model : "-";
        section.plate.textContent = info && info.plate ? info.plate : "-";
    }
}

new Radar();
