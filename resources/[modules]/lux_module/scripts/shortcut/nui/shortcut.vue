<template>
    <main>
        <div id="shortcut">
            <div class="title">
                ATALHOS
            </div>
            <div class="top">
                <div class="flex">
                    <div class="square">U</div>
                    <p>FECHAR ATALHO</p>
                </div>
            </div>
            <div class="content">
                <div v-for="command in commands" :key="command" class="content-inside">
                    <div class="bar-content-inside">
                        <div class="square_inside">{{ command.key }}</div>
                        <p>{{ command.name }}</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<script>
export default {
    data() {
        return {
            commands: [
                { key: "/recrutamento", name: "Para abrir o painel de recrutamento" },
                { key: "/box", name: "Para ganhar premiações" },
                { key: "/FPS ON", name: "Melhorar seu FPS" },
                { key: "HOME", name: "Altura do VOIP" },
                { key: "F9", name: "Para abrir menu de atalhos" },
                { key: "F1", name: "Histórico de Notificações" },
                { key: "F6", name: "Cancelar Animações" },
                { key: "K", name: "Celular" },
                { key: "`", name: "Inventário" },
                { key: "E", name: "Interagir" },
                { key: "T", name: "Chat" },
                { key: "F", name: "Entrar em veículos" },
                { key: "G", name: "Veículo | Colocar Cinto" },
                { key: "H", name: "Veículo | Ligar Luzes" },
                { key: "Z", name: "Veículo | Ligar Motor" },
                { key: "L", name: "Veículo | Alarme" },
                { key: "/atalhos", name: "Para abrir esse menu" },
            ]
        }
    },

    methods: {
        onClose() {
            this.post("module:close")
        }
    }
}
</script>

<style scoped>
#shortcut {
    padding: 1.04vw;
    position: absolute;
    right: 1.6vw;
    filter: drop-shadow(0 0 0.63vw rgba(0, 0, 0, 0.25));
    top: 50%;
    transform: translateY(-50%);
    width: 20.63vw;
    height: 39.46vw;
    z-index: 999999999 !important;
    display: flex;
    justify-content: center;
    flex-direction: column;
    border-radius: 0.52vw;
    border: 2px solid #0d00ff;
    zoom: .8;
    background: linear-gradient(296deg, rgba(17, 17, 17, 0.75) 42.73%, rgba(17, 17, 17, 0.00) 146.39%);
}

.title {
    width: 7.45vw;
    height: 2.11vw;
    transform: rotate(-1.261deg);
    border-radius: 0.26vw;
    background: #242ee3;
    color: #FFF;
    text-align: center;
    font-size: 1.04vw;
    font-style: normal;
    font-weight: 800;
    line-height: normal;

    position: absolute;
    top: -20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.top {
    width: 19.3vw;
    height: 2.4vw;
    position: relative;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    font-style: normal;
    font-weight: 400;
    font-size: 0.63vw;
    line-height: 75%;

    color: #FFFFFF;
}

.top .flex {
    display: flex;
    align-items: center;
}

.top img {
    width: 1vw;
}

.top p {
    min-width: 4.16vw;
    height: 1.27vw;
    display: flex;
    align-items: center;
    color: rgba(255, 255, 255, 1);
    font-size: 0.68vw;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    padding: 0 0.5vw;
    margin-left: 0;
}

.square {
    min-width: 1.87vw;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 0.26vw;
    background: #242ee3;
    box-shadow: 0vw 0vw 0.93vw 0vw rgba(8, 0, 255, 1.0);
    padding: 0.3645833333vw 0.3645833333vw;
    height: 1.87vw;
    color: #292929;
    text-align: center;
    font-size: 1.04vw;
    font-style: normal;
    font-weight: 700;
    line-height: normal;
}

.content {
    width: 20.64vw;
    margin-top: 0.0520833333vw;
    display: flex;
    flex-direction: column;
    gap: 0.5208333333vw;
    margin-top: 0.0520833333vw;
}

.content-inside {
    width: 100%;
    height: 1.51vw;
    display: flex;
}

.flex {
    display: flex;
}

.bar-inside {
    width: 0.26vw;
    height: 100%;
}

.bar-content-inside {
    flex: 1;
    display: flex;
    align-items: center;
    font-size: 0.73vw;
    font-weight: 400;
    color: #FFF;
}

.bar-content-inside p {
    min-width: 4.16vw;
    height: 1.27vw;
    display: flex;
    align-items: center;

    color: rgba(255, 255, 255, 1);
    font-size: 0.68234375vw;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    border-radius: 0 0.44vw 0.44vw 0;
    padding: 0 0.5vw;
}

.square_inside {
    padding: 0.1vw 0.5vw;
    border: 0.05703125vw solid rgba(255, 255, 255, 0.12);
    border-radius: 0.26vw;
    background: rgba(17, 17, 17, 0.45);
    margin-left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    font-size: 0.68234375vw;
    height: 1.87vw;
    min-width: 1.87vw;
    font-weight: 600;
    line-height: 75%;
    color: rgba(255, 255, 255, 1);
}
</style>