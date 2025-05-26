<template>
    <div id="main">
        <div id="progressbar">
            <div v-if="timeSub !== 0" class="container_progress">
                <div class="infos_progress">
                    <p v-show="message !== ''" class="message_progress">{{message}}</p>  
                    <div class="time_progress">
                        <img src="progressbar/nui/images/time.svg" />
                        <p>00:{{minutesRemaining}}:{{secondsRemaining}}</p>
                    </div>
                </div>
                <div class="bar_progress">
                    <p class="progress_porcent">CONCLUÍDO: {{porcent.toFixed()}}%</p>
                    <div :style="{'width': porcent+'%'}" class="inside_bar_progress"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                message: '',
                time: 0,
                timeSub: 0,
                timeFix: 0,
                porcent: 0,
                opened: false
            }
        },
        methods: {
            onUpdate(data) {
                if(data.clear){
                    this.time = 0;
                    this.timeSub = 0;
                    this.timeFix = 0;
                    this.message = '';
                    clearInterval(this.timeInterval);
                    clearInterval(this.porcentInverval);
                    return
                }
                this.timeSub = data.time;
                this.timeFix = data.time;
                this.message = data.message;

                this.timeInterval = setInterval(() => {
                    if(this.time < this.timeFix) {
                        this.time +=100;
                        this.timeSub -=100;
                        return;
                    }   
                }, 100)

                this.porcentInverval = setInterval(() => {
                    this.porcent = ((this.time / 1000) * 100) / (this.timeFix / 1000);
                }, 1)

                setTimeout(() => {
                    this.time = 0;
                    this.timeSub = 0;
                    this.timeFix = 0;
                    this.message = '';
                    clearInterval(this.timeInterval);
                    clearInterval(this.porcentInverval);
                }, this.timeFix);
            } 
        },
        computed: {
            minutesRemaining() {
                return String(Math.floor((this.timeSub / 1000) / 60)).padStart(2, '0');
            },
            secondsRemaining() {
                return String(parseInt((this.timeSub / 1000) % 60)).padStart(2, '0');
            },
        },
    }
</script>

<style scoped>
    #progressbar {
        position: absolute;
        transform: translate(-50%, 0);
        left: 50%;
        bottom: 1vw;
        font-size: .7vw;
    }   

    .infos_progress {
        width: 15vw;
        display: flex;
        justify-content: space-between;
        margin-bottom: .2vw;
        font-weight: 600;
        color: #FFF;
    }

    .message_progress {
        text-transform: uppercase;
    }

    .time_progress {
        display: flex;
    }

    .time_progress img {
        width: .7vw;
        margin-right: .1vw;
    }

    .bar_progress {
        width: 15vw;
        height: 1.3vw;
        background-color: rgba(0, 0, 0, 0.37);
        position: relative;
        padding: .2vw;
        border-radius: .2vw;
    }

    .progress_porcent {
        position: absolute;
        z-index: 2;
        transform: translate(0, -50%);
        top: 50%;
        font-size: .6vw;
        font-weight: 600;
        padding: 0 0.3vw;
        color: #FFF;
    }

    .inside_bar_progress {
        width: 100%;
        height: 100%;
        background: linear-gradient(270.86deg, rgba(64, 27, 124, 0.25) 4.15%, rgba(128, 0, 0, .25) 99.25%);
        box-shadow: inset 0px 0px 27px #3c0080;
        transition: all ease .1s;
        border-radius: .2vw;
    }
</style>