<script>
    export default {
        data() {
            return {
                player: [],
            }
        },
        methods: {
            onUpdate: function (data) {
                this.player = [];
                this.player = data;
            }
        },
    }
</script>

<template>
    <div id="talking">
        <div v-for="(_, key) in player" :key="key" class="player-talking">
            <span>{{player[key].name}}</span>
            <p>[{{player[key].user_id}}] -</p>
            <img src="talking/nui/images/mic.svg" />
        </div>
    </div>
</template>

<style scoped>
    #talking {
        position: absolute;
        right: 1.042vw;
        top: 6.979vw;
        display: flex;
        flex-direction: column;
        gap: 0.156vw;
    }

    .player-talking {
        width: 100%;
        display: flex;
        gap: 0.26vw;
        align-items: center;
        color: #FFF;
        font-size: 0.521vw;
    }

    .player-talking img {
        height: 0.677vw;
    }
</style>