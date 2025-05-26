<template>
    <div id="main">
        <div id="radio">
            <div class="container_radio">
                <p class="frequency_radio">FREQUÊNCIA</p>
                <div class="input_radio">
                    <input @input="event => frequency = event.target.value" :value="frequency" ref="frequency" type="text" />
                </div>
                <p class="volume_radio">VOLUME</p>
                <div class="range_radio">
                    <input min="0" max="100" v-model="volume" type="range" />
                    <div class="numbers_range_radio">{{volume}}</div>
                </div>
                <div class="buttons_radio">
                    <div @click="desconect" class="button_radio button_radio_gray">DESCONECTAR</div>
                    <div @click="confirm" class="button_radio button_radio_primary">CONECTAR</div>
                </div>  
            </div>
        </div>
    </div>
</template>

<script>
    export default {
         data() {
            return {
                frequency: '0',
                volume: 50 
            }
        },
        watch: {
            volume(value) {
                this.volume = value;
                this.post('volume', {
                    volume: value
                })
            }
        },
        methods: {
            onOpen() {
                this.$nextTick(() => this.$refs.frequency.focus());
            },
            onClose(boolean) {
                this.post('close', {
                    channel: boolean ? null: this.frequency
                });
            },
            confirm() {
                this.post('poweredOn', {
                    channel: this.frequency
                });
                this.onClose();
            },
            desconect() {
                this.onClose(true);
            }
        },
    }
</script>

<style>
    :root {
        --background--color--primary: linear-gradient(90deg, rgba(20,20,20,1) 0%, rgba(55,55,55,1) 100%);
        --color--primary: #0d05ff;
        --color--primary--hover: #0d05ff;
        --color--font--primary: #FFF;
    }

    .container_radio {
        width: 12vw;
        background: var(--background--color--primary);
        color: var(--color--font--primary);
        position: absolute;
        right: 1vw;
        top: 50%;
        transform: translate(0, -50%);
        border-radius: 5px;
        padding: .8vw;
    }

    .frequency_radio {
        font-size: .7vw;
        font-weight: 700;
    }

    .input_radio {
        flex: 1;
        height: 1.5vw;
        margin-top: .4vw;
        border: 1px solid var(--color--primary);
        border-radius: 5px;
        display: flex;
        align-items: center;
        padding: .4vw;
    }

    .input_radio input {
        width: 100%;
        outline: none;
        background-color: transparent;
        border: none;
        color: var(--color--font--primary);
        font-size: .6vw;
        font-weight: 500;
    }

    .volume_radio {
        font-size: .7vw;
        font-weight: 700;
        margin-top: .5vw;
    }

    .range_radio {
        flex: 1;
        height: 1.5vw;
        border-radius: 5px;
        position: relative;
        display: flex;
        align-items: center;
    }

    .range_radio input[type=range] {
        -webkit-appearance: none;
        width: 8vw;
        margin: 0;
        padding: 0;
        display: block;
        background-color: rgb(83, 83, 83);
        height: .1vw;
        border-radius: 10px;
    }

    .range_radio input[type=range]:focus {
        outline: none;
    }

    .range_radio input[type=range]::-webkit-slider-thumb {
        width: .6vw;
        height: .6vw;
        border-radius: 100%;
        background: var(--color--primary);
        -webkit-appearance: none;
    }

    .numbers_range_radio {
        width: 2vw;
        height: 1.5vw;
        border: 1px solid var(--color--primary);
        border-radius: 5px;
        position: absolute;
        right: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: .6vw;
        font-weight: 700;
    }

    .buttons_radio {
        flex: 1;
        height: 1.5vw;
        margin-top: .5vw;  
        display: flex;
        gap: .4vw;
    }

    .button_radio {
        width: 50%;
        height: 100%;
        color: var(--color--font--primary);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: .5vw;
        font-weight: 700;
        border-radius: 5px;
        cursor: pointer;
        transition: all ease .4s;
    }

    .button_radio_gray {
        background-color: #383838;
    }

    .button_radio_gray:hover {
        background-color: #6b6b6b;
    }

    .button_radio_primary {
        background-color: var(--color--primary);
    }

    .button_radio_primary:hover {
        background-color: var(--color--primary--hover);
    }
</style>