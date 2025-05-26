<template>
    <transition name="fade" mode="in-out">
        <div class="identity">
            <div class="container">
                <div class="top_container">
                    <p>IDENTIDADE</p>
                </div>
                <div class="content_container">
                    <div class="content">
                        <div class="container_infos_content">
                            <p>ID</p>
                            <p class="selected">{{ player.passaporte }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>NOME</p>
                            <p class="selected">{{ fullName }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>REGISTRO</p>
                            <p class="selected">{{ player.registro }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>RELACIONAMENTO</p>
                            <p class="selected">{{ player.relacionamento }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>CELULAR</p>
                            <p class="selected">{{ player.celular }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>EMPREGO</p>
                            <p class="selected">{{ player.emprego || 'Desempregado' }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>VIP</p>
                            <p class="selected">{{ player.vip }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>CARTEIRA</p>
                            <p class="selected">$ {{ player.carteira?.toLocaleString('en') }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>BANCO</p>
                            <p class="selected">$ {{ player.banco?.toLocaleString('en') }}</p>
                        </div>
                    </div>
                    <!-- <div class="content">
                        <div class="container_infos_content">
                            <p>PAYPAL</p>
                            <p class="selected">$ {{ player.paypal?.toLocaleString('en') }}</p>
                        </div>
                    </div> -->
                    <div class="content">
                        <div class="container_infos_content">
                            <p>MULTAS</p>
                            <p class="selected">$ {{ player.multas?.toLocaleString('en') }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>VALE CASA</p>
                            <p class="selected">{{ player.valecasa }}</p>
                        </div>
                    </div>
                    <div class="content">
                        <div class="container_infos_content">
                            <p>VALE GARAGEM</p>
                            <p class="selected">{{ player.valegaragem }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
export default {
    data() {
        return {
            player: {}
        }
    },
    computed: {
        fullName() {
            return this.player.nome + " " + this.player.sobrenome;
        }
    },
    methods: {
        async onOpen() {
            await this.request('requestIdentity').then(({ infos }) => {
                this.player = infos;
            });
        },

        onClose() {
            this.post('closeIdentity');
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,700;1,800;1,900&display=swap');

.identity {
    width: 18vw;
    padding: .5vw;
    position: absolute;
    transform: translate(0, -50%);
    top: 50%;
    right: 1vw;
    /* border: 0.0520833333vw solid rgba(255, 255, 255, .2); */
}

.container {
    width: 100%;
    border-radius: 0.52vw;
    border: 0.1vw solid #0056f3;
    background: linear-gradient(296deg, rgba(17, 17, 17, 0.75) 42.73%, rgba(17, 17, 17, 0.00) 146.39%);
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0.52vw 0.73vw;
    padding-top: 1.65vw;
}

.top_container {
    width: 7.45vw;
    height: 2.11vw;
    transform: rotate(-1.261deg);
    border-radius: 0.26vw;
    background: #0056f3;

    display: flex;
    align-items: center;
    justify-content: center;

    position: absolute;
    left: 1.5vw;
    top: -1.04vw;
    color: #FFF;
    text-align: center;
    font-size: 1.04vw;
    font-style: normal;
    font-weight: 800;
    line-height: normal;
}


.top_container img {
    width: 1vw;
}

.content_container {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 0.265125vw;
}

.content {
    width: 100%;
    height: 1.5104166666666667vw;
    display: flex;
}

.bar_content {
    width: 0.2604166666666667vw;
    height: 100%;
    background: #FFFFFF;
    box-shadow: 0vw 0vw 0.63vw rgba(255, 255, 255, 0.55);
}

.container_infos_content {
    flex: 1;
    margin-left: 0.15625vw;
    border-radius: 0.26vw;
    background: rgba(17, 17, 17, 0.45);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.78vw;
    font-weight: 500;
    font-size: 0.6291666666666667vw;
    word-wrap: break-word;
    color: rgba(255, 255, 255, 0.55);
}

.selected {
    font-size: 11px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    letter-spacing: 1.1px;
    color: #FFFFFF;
}
</style>