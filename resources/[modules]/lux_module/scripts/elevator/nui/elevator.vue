<template>
    <main>
        <div class="gradient_elevator"></div>
        <div id="elevator">
            <p class="title_elevator">ELEVADOR</p>
            <div class="container_buttons">
                <div v-for="(_, i) in Array(9)" :key="i" @click="setWalk(buttons[i]?.index || undefined)" class="button_elevator">
                    <div :class="{'emptyBox_elevator': !buttons[i]}" class="inside_button_elevator">{{buttons[i]?.botao || '•'}}</div>
                </div>
            </div>
            <div class="container_bars">
                <div class="bar_elevator"></div>
                <div class="bar_elevator"></div>
                <div class="bar_elevator"></div>
            </div>
            <div @click="closeUI()" class="button_close_elevator">
                <img draggable="false" src="elevator/nui/images/power.svg" />
            </div>
        </div>
    </main>
</template>

<script>
export default {
    data() {
        return {
           buttons: [],
        }
    },

    methods: {
        setWalk(param) {
            if (param !== undefined) {
                this.post('selectAndar', { index: param });
                return;
            }
        },

        closeUI() {
            this.post('elevatorClose');
        },

        async onOpen() {
            await this.request('requestElevator', {}).then(data => {
                this.buttons = data;
            }).catch(() => {});
        },

        onClose() {
        },
    },
}
</script>

<style scoped>
.gradient_elevator {
    width: 100vw;
    height: 100vh;
    background: rgb(26,66,74);
    background: linear-gradient(90deg, rgba(26,66,74,0) 32%, rgba(18,45,50,0) 34%, rgb(0, 0, 0) 100%);
    position: absolute;
    top: 0;
    z-index: -1;
}

#elevator {
    width: 10vw;
    padding: .5vw 0;
    background-color: #9e9e9e;
    background-image: -webkit-linear-gradient(bottom, rgb(213,12,18), #9e9e9e 40%); 
    background-image: -moz-linear-gradient(to bottom, #9e9e9e 60%, #454545 100%);
    background-image: -o-linear-gradient(to bottom, #9e9e9e 60%, #454545 100%); 
    background-image: linear-gradient(to bottom, #9e9e9e 60%, #454545 100%);
    border-radius: 5px;
    position: absolute;
    right: 2vw;
    top: 50%;
    transform: translate(0, -50%);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.281);
}

.title_elevator {
    text-align: center;
    margin-top: 1vw;
    font-weight: 700;
    font-size: .8vw;
    color: #FFF;
    text-shadow: 0px 0px 10px black;
}

.container_buttons {
    width: 90%;
    margin: 1vw auto;
    display: flex;
    flex-wrap: wrap;
    gap: .2vw;
    justify-content: center;
    align-content: flex-start;
}

.button_elevator {
    width: 2.5vw;
    height: 2.5vw;
    background-color: #cacaca;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.281);
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all ease .4s;
}

.emptyBox_elevator {
    opacity: 0.2;
    cursor: not-allowed;
}

.inside_button_elevator {
    width: 2vw;
    height: 2vw;
    border: .1vw solid rgba(0, 0, 0, 0.671);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.281);
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    font-size: .6vw;
    color: rgb(105, 105, 105);
    transition: all ease .4s;
    text-transform: uppercase;
}

.inside_button_elevator:hover {
    border: .1vw solid rgba(38, 0, 255, 0.671);
}

.container_bars {
    margin-top: 1vw;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: .3vw;
}

.bar_elevator {
    width: 80%;
    height: .5vw;
    background-color: rgb(105, 105, 105);
    border-radius: 20px;
    border: .1vw solid rgba(0, 0, 0, 0.671);
}

.button_close_elevator {
    width: 2vw;
    height: 2vw;
    border-radius: 100%;
    margin: 1vw auto;
    background-color: rgba(255, 0, 0, 0.671);
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all ease .4s;
}

.button_close_elevator:hover {
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.281);
}

.button_close_elevator img {
    width: 1vw;
}
</style>