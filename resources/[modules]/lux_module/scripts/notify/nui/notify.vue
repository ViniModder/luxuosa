<template>
    <main>
        <transition-group name="zoom" tag="div" id="notifys">
            <div data-augmented-ui="
            tl-round tr-2-clip-x br-clip bl-clip border
            " v-for="notify in notifyList" :key="notify" :class="[{'carNotify': notify.type.carName,'notify': !notify.type.carName}, notify.type.notifyColor]">
                <div v-if="!notify.type.carName">
                    <h3 class="title">{{notify.type || 'Notificação'}}</h3>
                    <p class="msg" v-html="notify.msg"></p>
                    <span class="left" :class="notify.type || 'default'"></span>
                    <div class="right">
                        <span v-for="_ in Array(4)" :key="_" :class="notify.type || 'default'"></span>
                    </div>
                </div>
                <div v-else-if="notify.type.carName" class="notifyCar">
                    <img class="carImage" :src="`http://177.54.148.31:4020/imgrevoada/vehicles/v1/${notify.type.carName}.png`">
                    <div class="carNotifyTexts">
                        <h3 class="title">{{notify.type.carStatus}}</h3>
                        <p>{{notify.type.carName}}</p>
                    </div>
                </div>
            </div>
        </transition-group>
        <transition-group name="zoom" tag="div" id="itemNotifys">
            <div class="notifyItem" v-for="itemNotify in notifyItensList" :key="itemNotify" :class="{'removed': itemNotify.mode.toLowerCase() === 'removido'}">
                <img :src="`http://189.127.165.210/inventario/${itemNotify.item}.png`">
                <div class="notifyItemData">
                    <h3 class="title">{{itemNotify.mode.toUpperCase()}}</h3>
                    <p>{{itemNotify.mode.toLowerCase()}} {{itemNotify.amount}}x {{itemNotify.name}}</p>
                </div>
                <div class="progress-bar">
                    <div class="fill-bar" :style="{animationDuration: (itemNotify.timer || 3000) + 'ms'}" :class="{'fill-green': itemNotify.mode.toLowerCase() === 'recebeu', 'fill-red': itemNotify.mode.toLowerCase() === 'removido'}"></div>
                </div>
            </div>
        </transition-group>
    </main>
</template>

<script>
    export default {
        data(){
            return {
                data: {
                    notify: {},
                    itemNotify: {}
                }
            }
        },

        methods: {
            onUpdate(data){
                const id = Object.keys(this.data[data.notifyType]).length+1;
                this.data[data.notifyType] = {...this.data[data.notifyType], [id]: data};
                (async () => {
                    setTimeout(() => {
                        delete this.data[data.notifyType][id]
                    }, (data.timer || 3000));
                })();
            },
        },

        computed: {
            notifyList() {
                return this.data.notify;
            },

            notifyItensList() {
                return this.data.itemNotify;
            }
        }
    }
</script>

<style scoped>
    #notifys {
        position: absolute;
        transform: translate(0%,-50%);
        top: 50%;
        right: 1vw;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 0.5vw;
    }

    #itemNotifys {
        position: absolute;
        transform: translate(-50%);
        left: 50%;
        bottom: 3.7vw;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        align-items: center;
        gap: 0.5vw;
    }

    .notify {
        width: 16.45vw;
        padding: 1.3vw;

        display: flex;
        flex-direction: column;
        gap: .2vw;

        --aug-border-all: .1vw;
        --aug-border-bg: rgb(83, 0, 191);
        background: linear-gradient(90deg, rgba(67, 0, 191, 0.6) 0%, rgba(89, 0, 255, 0.2) 100%);
    }

    .notifyCar {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        gap: 1vw;
    }

    .red {
         --aug-border-bg: rgb(255, 39, 39) !important;
         color: rgb(255, 69, 69);
    }

    .blue {
         --aug-border-bg: rgba(0, 160, 191, 1) !important;
         color: rgba(0, 160, 191, 1);
    }


    .carNotify {
        width: 17.5vw;
        padding: 1.5vw 2vw;

        display: flex;
        flex-direction: column;
        gap: .2vw;

        --aug-border-all: .1vw;
        --aug-border-bg: rgba(0, 160, 191, 1);
        background: rgba(8,8,8,.4) !important;
    }

    .carNotifyTexts {
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        font: 800 0.8vw 'Montserrat';
    }

    .carNotifyTexts p {
        text-transform: uppercase;
        font: 500 .8vw 'Montserrat';
        color: #fff;
    }

    .carImage {
        width: 6vw;
    }

    .notifyItem {
        padding: .5vw;
        border: 0.0526041667vw solid rgba(255, 255, 255, 0.12);
        background: linear-gradient(94deg, rgba(0, 0, 0, 0.20) 33.18%, rgba(0, 0, 0, 0.00) 33.18%), radial-gradient(47.62% 70.59% at 50% 78.53%, rgba(255, 255, 255, 0.10) 0%, rgba(255, 255, 255, 0.00) 100%), radial-gradient(166.76% 426.24% at 49.79% 50.2%, rgba(212, 212, 212, 0.10) 0%, rgba(0, 0, 0, 0.00) 100%), rgba(0, 0, 0, 0.55);
        display: flex;
        position: relative;
    }

    .progress-bar {
        width: 100%;
        height: 0.3645833333vw;
        background: linear-gradient(65deg, rgba(0, 0, 0, 0.55) 0%, rgba(0, 0, 0, 0.00) 190.14%);
        position: absolute;
        left: 0;
        bottom: 0;
        z-index: 1;
    }
    .notifyItem img {
        width: 3.5vw;
    }

    .notifyItemData {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: .25vw;
        margin-left: 1vw;
    }

    .notifyItemData h3 {
        font: 700 0.8vw 'Montserrat';
    }

    .notifyItemData p {
        font: 500 0.7vw 'Montserrat';
    }

    .title {
        font: 800 1vw Gilroy;
        text-transform: uppercase;
    }

    .msg {
        font: 500 .8vw Gilroy;
        color: #FFF;
    }

    .left {
        position: absolute;
        left: -.1vw;
        top: 1vw;
        width: .5vw;
        height: 1.8vw;
        border-radius: .5vw;
        z-index: 3;
    }

    .right {
        position: absolute;
        display:flex;
        gap: .2vw;
        bottom: -.15vw;
        right: 1.2vw;
    }

    .right span {
        width: .4vw;
        height: .6vw;
        border-radius: .5vw;
        z-index: 3;
    }

    .sucesso {
        box-shadow: 0 0 .5vw #B2EF30;
        background: #B2EF30;
    }
    .negado {
        box-shadow: 0 0 .5vw #FF006E;
        background: #FF006E;
    }
    .aviso {
        box-shadow: 0 0 .5vw #EFC530;
        background: #EFC530;
    }
    .importante {
        box-shadow: 0 0 .5vw #00D8F2;
        background: #00D8F2;
    }

    .default {
        box-shadow: 0 0 .5vw rgb(229, 229, 229);
        background: rgb(229, 229, 229);
    }

    .title{
        color: #6f4ee7;
    }

    .removed .title{
        color: #e74e4e;
    }

    @keyframes reduceWidth {
        to {
            width: 0;
        }
    }

    .fill-bar {
        width: 100%;
        height: 100%;
        animation-name: reduceWidth;
        animation-timing-function: linear;
        animation-fill-mode: forwards;
    }

    .fill-green {
        border: 0.0545833333vw solid #1c1fcd;
        background: linear-gradient(90deg, #221ccd 31%, rgba(28, 205, 120, 0.00) 178.75%), rgba(0, 0, 0, 0.55);
        box-shadow: 0px 0px 17.82069px 0px rgba(96, 28, 205, 0.43);
    }

    .fill-red {
        border: 0.0545833333vw solid #EA3E3E;
        background: linear-gradient(90deg, #EA3E3E 31%, rgba(234, 62, 62, 0.00) 178.75%), rgba(0, 0, 0, 0.55);
        box-shadow: 0vw 0vw 0.9281609375vw 0vw rgba(234, 62, 62, 0.43);
    }
</style>